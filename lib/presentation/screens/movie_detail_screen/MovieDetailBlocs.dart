import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movie_app/domain/use_cases/MovieCreditUseCase.dart';
import 'package:my_movie_app/domain/use_cases/MovieDetailUseCase.dart';
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

class MovieDetailBloc extends Bloc<MovieDetailParams, MovieDetailState> {
  final MovieDetailUseCase useCase;

  MovieDetailBloc(this.useCase) : super(InitialState()) {
    on<MovieDetailParams>((event, emit) async {
      try {
        emit(LoadingState());
        final response = await useCase.call(event);
        emit(LoadedMovieDetail(movieDetailRootModel: response));
      } catch (e) {
        emit(ErrorState(message: e.toString()));
      }
    });
  }
}
