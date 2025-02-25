import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:my_movie_app/data/models/TopRatedMoviesRootModel.dart';
import 'package:my_movie_app/presentation/components/MoviesVerticalList.dart';
import 'package:my_movie_app/presentation/screens/favorite_movies/FavoriteMoviesState.dart';

import '../../../core/OverlayLoader.dart';
import '../movie_detail_screen/MovieDetails.dart';
import 'FavoriteMoviesBloc.dart';

class FavoriteMoviesPage extends StatefulWidget {
  const FavoriteMoviesPage({super.key});

  @override
  State<FavoriteMoviesPage> createState() => _FavoriteMoviesPageState();
}

class _FavoriteMoviesPageState extends State<FavoriteMoviesPage> {
  late final FavoriteMoviesBloc favoriteMoviesBloc;

  @override
  void dispose() {
    favoriteMoviesBloc.close();
    super.dispose();
  }

  @override
  void initState() {
    favoriteMoviesBloc = GetIt.instance<FavoriteMoviesBloc>();
    favoriteMoviesBloc.add("favorite");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: BlocProvider(
        create: (context) => favoriteMoviesBloc,
        child: _build(),
      ),
    ));
  }

  Widget _build() {
    return BlocBuilder<FavoriteMoviesBloc, FavoriteMoviesState>(
      buildWhen: (previousState, currentState) {
        if (currentState is LoadedFavoriteMovies) {
          OverlayLoader.show(context);
        }
        return currentState is LoadedFavoriteMovies;
      },
      builder: (context, event) {
        if (event is LoadedFavoriteMovies) {
          OverlayLoader.hide();
          return MoviesVerticalList(
              moviesList: event.results,
              onItemClick: (movieItem) {
                _navigateToDetail(movieItem);
              });
        }
        return Container();
      },
    );
  }

  void _navigateToDetail(Result movieItem) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MovieDetailsScreen(movieItem: movieItem),
      ),
    );

    if (result == true) {
      favoriteMoviesBloc.add("favorite");
      // Refresh the list when returning
    }
  }
}
