import '../../../data/models/TopRatedMoviesRootModel.dart';

abstract class HomeState {}

class InitialHomeScreenState extends HomeState {}

class LoadingHomeScreen extends HomeState {}

class ErrorHomeScreenApi extends HomeState {
  final String message;

  ErrorHomeScreenApi({required this.message});
}

class LoadedMoviesSlider extends HomeState {
  final List<Result>? results;

  LoadedMoviesSlider({required this.results});
}

class LoadedDiscoverMovies extends HomeState {
  final List<Result>? results;

  LoadedDiscoverMovies({required this.results});
}

class LoadedPopularMovies extends HomeState {
  final List<Result>? results;

  LoadedPopularMovies({required this.results});
}
