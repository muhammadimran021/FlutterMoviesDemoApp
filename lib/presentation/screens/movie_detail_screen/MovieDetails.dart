import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:my_movie_app/core/OverlayLoader.dart';
import 'package:my_movie_app/data/models/TopRatedMoviesRootModel.dart';
import 'package:my_movie_app/domain/use_cases/MovieCreditUseCase.dart';
import 'package:my_movie_app/domain/use_cases/MovieDetailUseCase.dart';
import 'package:my_movie_app/presentation/components/CrewListHorizontal.dart';
import 'package:my_movie_app/presentation/components/MoviesGenresGrid.dart';
import 'package:my_movie_app/presentation/screens/movie_detail_screen/MovieDetailBlocs.dart';
import 'package:my_movie_app/presentation/screens/movie_detail_screen/MovieDetailsState.dart';

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

  @override
  void initState() {
    movieCreditBloc = GetIt.instance<MovieCreditBloc>();
    movieDetailBloc = GetIt.instance<MovieDetailBloc>();
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
    return SafeArea(
        child: Scaffold(
            body: MultiBlocProvider(
      providers: [
        BlocProvider.value(value: movieCreditBloc),
        BlocProvider.value(value: movieDetailBloc),
      ],
      child: _movieDetailedScreen(widget.movieItem!),
    )));
  }

  Widget _movieDetailedScreen(Result movieItem) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            _coverImage(movieItem.backdropPath!),
            _backButton(),
            Padding(
              padding: const EdgeInsets.only(top: 150.0, left: 10, right: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
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
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 10.0, top: 60, right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 200,
                          child: Text(
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            movieItem.title!,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
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
                            Text("Vote: ${movieItem.voteCount}")
                          ],
                        )
                      ],
                    ),
                  ),
                ],
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

  Widget _coverImage(String coverImage) {
    return Image.network(
      'https://image.tmdb.org/t/p/w500/$coverImage',
      height: 200,
      width: double.infinity,
      fit: BoxFit.cover,
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
    );
  }

  Widget _backButton() {
    return GestureDetector(
        onTap: () {
          Navigator.pop(context);
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
      if (state is InitialState) {
        context.read<MovieCreditBloc>().add(MovieCreditsParams(
            id: movieItem.id.toString(),
            apiKey: "bd9a0f3aac2b3bb637d47a4ab5c5d388",
            language: "us-en"));
      } else if (state is LoadedState) {
        return SizedBox(
            height: 130,
            child: CrewListHorizontal(castList: state.creditsRoodModel.cast!));
      } else if (state is ErrorState) {
        return Text(state.message);
      }
      return Container();
    });
  }

  Widget _genre(Result movieItem) {
    return BlocBuilder<MovieDetailBloc, MovieDetailState>(
        builder: (context, state) {
      if (state is InitialState) {
        context.read<MovieDetailBloc>().add(MovieDetailParams(
            movieId: movieItem.id.toString(), language: "us-eng"));
      } else if (state is LoadedMovieDetail) {
        return SizedBox(
            height: 40,
            child: MoviesGenresList(genre: state.movieDetailRootModel.genres));
      } else if (state is ErrorState) {
        return Text(state.message);
      }
      return Container();
    });
  }
}
