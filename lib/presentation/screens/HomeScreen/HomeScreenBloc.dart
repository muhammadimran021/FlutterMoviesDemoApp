import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movie_app/domain/use_cases/DiscoverMoviesUseCase.dart';
import 'package:my_movie_app/domain/use_cases/PopularMoviesUseCase.dart';
import 'package:my_movie_app/domain/use_cases/TopRatedMoviesUseCase.dart';
import 'package:my_movie_app/presentation/screens/HomeScreen/HomeScreenStates.dart';

class DiscoverMoviesBloc extends Bloc<DiscoverMoviesParams, HomeState> {
  final DiscoverMoviesUseCase discoverMoviesUseCase;

  DiscoverMoviesBloc(this.discoverMoviesUseCase)
      : super(InitialHomeScreenState()) {
    on<DiscoverMoviesParams>((event, emit) async {
      emit(LoadingHomeScreen());
      try {
        final response = await discoverMoviesUseCase.call(event);
        emit(LoadedMoviesSlider(results: response.results));
      } catch (e) {
        emit(ErrorHomeScreenApi(message: e.toString()));
      }
    });
  }
}

class TopRatedMoviesBloc extends Bloc<TopRatedMoviesParams, HomeState> {
  final TopRatedMoviesUseCase topRatedMoviesUseCase;

  TopRatedMoviesBloc(this.topRatedMoviesUseCase)
      : super(InitialHomeScreenState()) {
    on<TopRatedMoviesParams>((event, emit) async {
      emit(LoadingHomeScreen());
      try {
        final response = await topRatedMoviesUseCase.call(event);
        emit(LoadedDiscoverMovies(results: response.results));
      } catch (e) {
        emit(ErrorHomeScreenApi(message: e.toString()));
      }
    });
  }
}

class PopularMoviesBloc extends Bloc<PopularMoviesParams, HomeState> {
  final PopularMoviesUseCase popularMoviesUseCase;

  PopularMoviesBloc(this.popularMoviesUseCase)
      : super(InitialHomeScreenState()) {
    on<PopularMoviesParams>((event, emit) async {
      emit(LoadingHomeScreen());
      try {
        final response = await popularMoviesUseCase.call(event);
        emit(LoadedPopularMovies(results: response.results));
      } catch (e) {
        emit(ErrorHomeScreenApi(message: e.toString()));
      }
    });
  }
}
