import 'package:my_movie_app/data/models/TopRatedMoviesRootModel.dart';

abstract class MovieDetailsEvents {}

class MovieDetailParams extends MovieDetailsEvents {
  final String movieId;
  final String language;

  MovieDetailParams({required this.movieId, required this.language});
}

class MarkFavorite extends MovieDetailsEvents {
  final bool isFavorite;
  final Result movieResult;

  MarkFavorite(
      {required this.isFavorite,
      required this.movieResult});
}

class GetFavorite extends MovieDetailsEvents {
  final String movieId;

  GetFavorite({required this.movieId});
}
