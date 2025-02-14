import 'package:my_movie_app/data/models/TopRatedMoviesRootModel.dart';
import 'package:my_movie_app/data/repositories/HomeScreenRepository.dart';
import 'package:my_movie_app/domain/use_cases/BaseUseCase.dart';

class DiscoverMoviesUseCase
    extends BaseUseCase<TopRatedMoviesRootModel, DiscoverMoviesParams> {
  final HomeScreenRepository repository;

  DiscoverMoviesUseCase({required this.repository});

  @override
  Future<TopRatedMoviesRootModel> call(DiscoverMoviesParams params) {
    return repository.getDiscoverMovies(params);
  }
}

class DiscoverMoviesParams {
  final String language;
  final String page;

  DiscoverMoviesParams({required this.language, required this.page});
}
