import 'package:my_movie_app/data/models/CreditsRoodModel.dart';

abstract class MovieDetailState {}

class InitialState extends MovieDetailState {}

class LoadingState extends MovieDetailState {}

class LoadedState extends MovieDetailState {
  final CreditsRoodModel creditsRoodModel;

  LoadedState({required this.creditsRoodModel});
}

class ErrorState extends MovieDetailState {
  final String message;

  ErrorState({required this.message});
}
