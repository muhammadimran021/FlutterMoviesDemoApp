import 'package:my_movie_app/data/models/TopRatedMoviesRootModel.dart';
import 'package:my_movie_app/data/repositories/HomeScreenRepository.dart';
import 'package:my_movie_app/domain/use_cases/BaseUseCase.dart';

class PopularMoviesUseCase
    extends BaseUseCase<TopRatedMoviesRootModel, PopularMoviesParams> {
  final HomeScreenRepository repository;

  PopularMoviesUseCase({required this.repository});

  @override
  Future<TopRatedMoviesRootModel> call(PopularMoviesParams params) {
    return repository.getPopularMovies(params);
  }
}

class PopularMoviesParams {
  final String language;
  final String page;

  PopularMoviesParams({required this.language, required this.page});
}
