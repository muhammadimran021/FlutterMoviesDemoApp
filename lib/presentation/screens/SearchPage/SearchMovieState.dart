import 'package:my_movie_app/data/models/TopRatedMoviesRootModel.dart';

import '../../../data/models/SearchMovieRootModel.dart';

abstract class SearchMovieState{}
class InitialState extends SearchMovieState{}
class LoadingState extends SearchMovieState{}
class LoadedState extends SearchMovieState{
  final SearchMovieRootModel searchMovieRootModel;

  LoadedState({required this.searchMovieRootModel});

}
class ErrorState extends SearchMovieState{
  final String message;

  ErrorState({required this.message});

}