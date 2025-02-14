import 'package:my_movie_app/data/models/TopRatedMoviesRootModel.dart';
import 'package:my_movie_app/data/repositories/NowPlayingMoviesRepository.dart';
import 'package:my_movie_app/domain/use_cases/BaseUseCase.dart';

class NowPlayingMoviesUseCase
    extends BaseUseCase<TopRatedMoviesRootModel, NowPlayingMoviesParams> {
  final NowPlayingMoviesRepository repository;

  NowPlayingMoviesUseCase({required this.repository});

  @override
  Future<TopRatedMoviesRootModel> call(NowPlayingMoviesParams params) {
    return repository.getNowPlayingMovies(params);
  }
}
