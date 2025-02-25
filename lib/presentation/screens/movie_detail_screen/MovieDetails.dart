import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:my_movie_app/core/OverlayLoader.dart';
import 'package:my_movie_app/data/models/CreditsRoodModel.dart';
import 'package:my_movie_app/data/models/MovieDetailRootModel.dart';
import 'package:my_movie_app/data/models/TopRatedMoviesRootModel.dart';
import 'package:my_movie_app/domain/use_cases/MovieCreditUseCase.dart';
import 'package:my_movie_app/presentation/components/CrewListHorizontal.dart';
import 'package:my_movie_app/presentation/components/MoviesGenresGrid.dart';
import 'package:my_movie_app/presentation/screens/movie_detail_screen/MovieDetailBlocs.dart';
import 'package:my_movie_app/presentation/screens/movie_detail_screen/MovieDetailsState.dart';

import 'MovieDetailsEvents.dart';

class MovieDetailsScreen extends StatefulWidget {
  final Result? movieItem;

  const MovieDetailsScreen({
    super.key,
    this.movieItem,
  });

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  late final MovieCreditBloc movieCreditBloc;
  late final MovieDetailBloc movieDetailBloc;
  List<Cast> castList = [];
  List<Genre> genreList = [];
  late var isFavoriteMovie = false;

  @override
  void initState() {
    movieCreditBloc = GetIt.instance<MovieCreditBloc>();
    movieDetailBloc = GetIt.instance<MovieDetailBloc>();
    movieDetailBloc.add(GetFavorite(movieId: widget.movieItem!.id.toString()));
    movieDetailBloc.add(MovieDetailParams(
        movieId: widget.movieItem!.id.toString(), language: "us-eng"));
    movieCreditBloc.add(MovieCreditsParams(
        id: widget.movieItem!.id.toString(),
        apiKey: "bd9a0f3aac2b3bb637d47a4ab5c5d388",
        language: "us-en"));
    super.initState();
  }

  @override
  void dispose() {
    movieDetailBloc.close();
    movieCreditBloc.close();
    print('bloc closed');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
            body: MultiBlocProvider(
      providers: [
        BlocProvider.value(value: movieCreditBloc),
        BlocProvider.value(value: movieDetailBloc),
      ],
      child: _movieDetailedScreen(widget.movieItem!, screenHeight),
    )));
  }

  Widget _movieDetailedScreen(Result movieItem, double screenHeight) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Column(
              children: [
                _coverImage(movieItem.backdropPath!, screenHeight),
                Padding(
                  padding: const EdgeInsets.only(left: 120.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              movieItem.title!,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            Row(
                              children: [
                                Text("Rating: "),
                                Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                ),
                                Text(movieItem.voteAverage.toString()),
                                SizedBox(
                                  width: 10,
                                ),
                                Text("|"),
                                SizedBox(
                                  width: 10,
                                ),
                                Text("Vote: ${movieItem.voteCount}"),
                              ],
                            )
                          ],
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(top: 2, right: 8.0),
                          child: GestureDetector(
                              onTap: () {
                                movieDetailBloc.add(MarkFavorite(
                                    isFavorite: !isFavoriteMovie,
                                    movieResult: movieItem));
                              },
                              child: _favoriteIconBloc())),
                    ],
                  ),
                ),
              ],
            ),
            _backButton(),
            Positioned(
              child: Padding(
                padding:
                    EdgeInsets.only(top: (screenHeight * 0.3) - 50, left: 10),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.network(
                      height: 100,
                      width: 100,
                      'https://image.tmdb.org/t/p/w500/${movieItem.posterPath!}',
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Center(child: CircularProgressIndicator());
                      },
                      errorBuilder: (context, error, stackTrace) {
                        return Center(
                            child: Icon(Icons.error, color: Colors.red));
                      },
                    )),
              ),
            ),
          ],
        ),
        Expanded(
            child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 10.0, left: 10, right: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                _genre(movieItem),
                SizedBox(
                  height: 10,
                ),
                Divider(
                  color: Colors.grey.shade300,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Text(
                    "Overview",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                ),
                Text(movieItem.overview.toString()),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Text(
                    "Release Date: ${movieItem.releaseDate!.day}, ${movieItem.releaseDate!.month}, ${movieItem.releaseDate!.year} ",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Divider(
                  color: Colors.grey.shade300,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Cast & Crew",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                _crewCast(movieItem)
              ],
            ),
          ),
        ))
      ],
    );
  }

  Widget _coverImage(String coverImage, double screenHeight) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Image.network(
        'https://image.tmdb.org/t/p/w500/$coverImage',
        height: screenHeight * 0.3,
        width: double.infinity,
        fit: BoxFit.fill,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return SizedBox(
              height: 200, child: Center(child: CircularProgressIndicator()));
        },
        errorBuilder: (context, error, stackTrace) {
          return SizedBox(
              height: 200,
              child: Center(child: Icon(Icons.error, color: Colors.red)));
        },
      ),
    );
  }

  Widget _backButton() {
    return GestureDetector(
        onTap: () {
          Navigator.pop(context,true);
        },
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30), color: Colors.white),
              child: Icon(Icons.arrow_back)),
        ));
  }

  Widget _crewCast(Result movieItem) {
    return BlocBuilder<MovieCreditBloc, MovieDetailState>(
        buildWhen: (previousState, currentState) {
      if (currentState is LoadingState) {
        OverlayLoader.show(context);
      } else {
        OverlayLoader.hide();
      }
      return true;
    }, builder: (context, state) {
      if (state is LoadedState) {
        castList = state.creditsRoodModel.cast!;
        return SizedBox(
            height: 130, child: CrewListHorizontal(castList: castList));
      } else if (state is ErrorState) {
        return Text(state.message);
      }
      return Container();
    });
  }

  Widget _genre(Result movieItem) {
    return BlocBuilder<MovieDetailBloc, MovieDetailState>(
        buildWhen: (previousState, currentState) {
      return currentState is LoadedMovieDetail;
    }, builder: (context, state) {
      if (state is LoadedMovieDetail) {
        genreList = state.movieDetailRootModel.genres!;
        return SizedBox(height: 40, child: MoviesGenresList(genre: genreList));
      } else if (state is ErrorState) {
        return Text(state.message);
      }

      return Container();
    });
  }

  Widget _favoriteIconBloc() {
    return BlocBuilder<MovieDetailBloc, MovieDetailState>(
        buildWhen: (previousState, currentState) {
      return currentState is FavoriteState;
    }, builder: (context, state) {
      if (state is FavoriteState) {
        isFavoriteMovie = state.isFavorite;
        return state.isFavorite == true
            ? Icon(Icons.bookmark)
            : Icon(Icons.bookmark_outline);
      }
      return Icon(
        Icons.bookmark_outline,
        size: 30,
      );
    });
  }
}
