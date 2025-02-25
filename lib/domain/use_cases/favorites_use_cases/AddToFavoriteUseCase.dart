import 'package:my_movie_app/data/models/TopRatedMoviesRootModel.dart';
import 'package:my_movie_app/domain/use_cases/BaseUseCase.dart';
import 'package:my_movie_app/presentation/screens/movie_detail_screen/MovieDetailsEvents.dart';

import '../../../data/repositories/MovieDetailRepository.dart';

class AddToFavoriteUseCase extends BaseUseCase<dynamic, Result> {
  final MovieDetailRepository repository;

  AddToFavoriteUseCase({required this.repository});

  @override
  Future<dynamic> call(Result params) {
    return repository.markFavorite(params.id.toString(),params);
  }
}


