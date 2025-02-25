import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movie_app/domain/use_cases/favorites_use_cases/GetAllFavoriteMoviesUseCase.dart';

import 'FavoriteMoviesState.dart';

class FavoriteMoviesBloc
    extends Bloc<dynamic, FavoriteMoviesState> {
  final GetAllFavoriteMoviesUseCase favoriteMoviesUseCase;

  FavoriteMoviesBloc(this.favoriteMoviesUseCase)
      : super(LoadingFavoriteMovies()) {
    on<dynamic>((event, emit) async {
      try {
        final favoriteMovies = await favoriteMoviesUseCase.call(event);
        emit(LoadedFavoriteMovies(results: favoriteMovies));
      } catch (e) {
        emit(ErrorState(message: e.toString()));
      }
    });
  }
}
