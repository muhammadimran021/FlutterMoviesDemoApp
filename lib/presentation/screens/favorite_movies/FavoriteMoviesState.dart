import '../../../data/models/TopRatedMoviesRootModel.dart';

abstract class FavoriteMoviesState{}
class LoadingFavoriteMovies extends FavoriteMoviesState{}
class LoadedFavoriteMovies extends FavoriteMoviesState{
  final List<Result> results;

  LoadedFavoriteMovies({required this.results});
}
class ErrorState extends FavoriteMoviesState{
  final String message;

  ErrorState({required this.message});
}