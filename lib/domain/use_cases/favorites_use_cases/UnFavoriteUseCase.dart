import 'package:my_movie_app/domain/use_cases/BaseUseCase.dart';

import '../../../data/repositories/MovieDetailRepository.dart';

class UnFavoriteUseCase extends BaseUseCase<dynamic, String> {
  final MovieDetailRepository repository;

  UnFavoriteUseCase({required this.repository});

  @override
  Future call(String params) {
    return repository.unMarkFavorite(params);
  }
}
