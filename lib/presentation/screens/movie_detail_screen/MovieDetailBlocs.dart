import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movie_app/domain/use_cases/MovieCreditUseCase.dart';
import 'package:my_movie_app/domain/use_cases/MovieDetailUseCase.dart';
import 'package:my_movie_app/domain/use_cases/favorites_use_cases/AddToFavoriteUseCase.dart';
import 'package:my_movie_app/domain/use_cases/favorites_use_cases/GetFavoriteByMovieIdUseCase.dart';
import 'package:my_movie_app/domain/use_cases/favorites_use_cases/UnFavoriteUseCase.dart';
import 'package:my_movie_app/presentation/screens/movie_detail_screen/MovieDetailsEvents.dart';
import 'package:my_movie_app/presentation/screens/movie_detail_screen/MovieDetailsState.dart';

class MovieCreditBloc extends Bloc<MovieCreditsParams, MovieDetailState> {
  final MovieCreditUseCase movieCreditUseCase;

  MovieCreditBloc(this.movieCreditUseCase) : super(InitialState()) {
    on<MovieCreditsParams>((event, emit) async {
      try {
        emit(LoadingState());
        final response = await movieCreditUseCase.call(event);
        emit(LoadedState(creditsRoodModel: response));
      } catch (e) {
        emit(ErrorState(message: e.toString()));
      }
    });
  }
}

class MovieDetailBloc extends Bloc<MovieDetailsEvents, MovieDetailState> {
  final MovieDetailUseCase useCase;
  final AddToFavoriteUseCase addToFavoriteUseCase;
  final UnFavoriteUseCase unFavoriteUseCase;
  final GetFavoriteByMovieIdUseCase getFavoriteByMovieIdUseCase;

  MovieDetailBloc(this.useCase, this.addToFavoriteUseCase,
      this.unFavoriteUseCase, this.getFavoriteByMovieIdUseCase)
      : super(InitialState()) {
    on<MovieDetailParams>((event, emit) async {
      try {
        emit(LoadingState());
        final response = await useCase.call(event);
        emit(LoadedMovieDetail(movieDetailRootModel: response));
      } catch (e) {
        emit(ErrorState(message: e.toString()));
      }
    });

    on<MarkFavorite>((event, emit) {
      if (event.isFavorite) {
        addToFavoriteUseCase.call(event.movieResult);
        emit(FavoriteState(isFavorite: true));
      } else {
        unFavoriteUseCase.call(event.movieResult.id.toString());
        emit(FavoriteState(isFavorite: false));
      }
    });

    on<GetFavorite>((event, emit) async {
      if (event.movieId.isNotEmpty) {
        final result = await getFavoriteByMovieIdUseCase.call(event.movieId);
        emit(FavoriteState(isFavorite: result));
      }
    });
  }
}
