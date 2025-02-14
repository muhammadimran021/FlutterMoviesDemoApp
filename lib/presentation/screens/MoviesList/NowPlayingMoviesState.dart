import '../../../data/models/TopRatedMoviesRootModel.dart';

abstract class NowPlayingMoviesState {}

class InitialState extends NowPlayingMoviesState {}

class LoadingState extends NowPlayingMoviesState {}

class ErrorState extends NowPlayingMoviesState {
  final String message;

  ErrorState({required this.message});
}

class LoadedNowPlayingMovies extends NowPlayingMoviesState {
  final List<Result>? results;

  LoadedNowPlayingMovies({required this.results});
}
