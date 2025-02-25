import 'package:my_movie_app/domain/use_cases/BaseUseCase.dart';

import '../../../data/repositories/MovieDetailRepository.dart';

class GetFavoriteByMovieIdUseCase extends BaseUseCase<bool,String>{
  final MovieDetailRepository repository;

  GetFavoriteByMovieIdUseCase(this.repository);

  @override
  Future<bool> call(String params) {
    return repository.getFavorite(params);
  }

}