import 'package:my_movie_app/data/models/MovieDetailRootModel.dart';
import 'package:my_movie_app/data/repositories/MovieDetailRepository.dart';
import 'package:my_movie_app/domain/use_cases/BaseUseCase.dart';

class MovieDetailUseCase
    extends BaseUseCase<MovieDetailRootModel, MovieDetailParams> {
  final MovieDetailRepository repository;

  MovieDetailUseCase(this.repository);

  @override
  Future<MovieDetailRootModel> call(MovieDetailParams params) {
    return repository.getMovieDetail(params.movieId, params.language);
  }
}

class MovieDetailParams {
  final String movieId;
  final String language;

  MovieDetailParams({required this.movieId, required this.language});
}
