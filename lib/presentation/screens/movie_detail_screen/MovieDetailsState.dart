import 'package:my_movie_app/data/models/CreditsRoodModel.dart';
import 'package:my_movie_app/data/models/MovieDetailRootModel.dart';

abstract class MovieDetailState {}

class InitialState extends MovieDetailState {}

class LoadingState extends MovieDetailState {}

class LoadedState extends MovieDetailState {
  final CreditsRoodModel creditsRoodModel;

  LoadedState({required this.creditsRoodModel});
}

class LoadedMovieDetail extends MovieDetailState {
  final MovieDetailRootModel movieDetailRootModel;

  LoadedMovieDetail({required this.movieDetailRootModel});
}

class ErrorState extends MovieDetailState {
  final String message;

  ErrorState({required this.message});
}

class FavoriteState extends MovieDetailState{
  final bool isFavorite;

  FavoriteState({required this.isFavorite});

}
