import 'package:my_movie_app/data/models/TopRatedMoviesRootModel.dart';
import 'package:my_movie_app/data/repositories/HomeScreenRepository.dart';
import 'package:my_movie_app/domain/use_cases/BaseUseCase.dart';

class TopRatedMoviesUseCase
    extends BaseUseCase<TopRatedMoviesRootModel, TopRatedMoviesParams> {
  final HomeScreenRepository repository;

  TopRatedMoviesUseCase({required this.repository});

  @override
  Future<TopRatedMoviesRootModel> call(TopRatedMoviesParams params) {
    return repository.getMovieList(params);
  }
}

class TopRatedMoviesParams {
  final String language;
  final String page;

  TopRatedMoviesParams({required this.language, required this.page});
}
