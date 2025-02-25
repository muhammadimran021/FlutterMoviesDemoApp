import 'package:my_movie_app/data/models/TopRatedMoviesRootModel.dart';
import 'package:my_movie_app/data/repositories/FavoriteMoviesRepository.dart';
import 'package:my_movie_app/domain/use_cases/BaseUseCase.dart';

class GetAllFavoriteMoviesUseCase extends BaseUseCase<List<Result>, dynamic> {
  final FavoriteMoviesRepository favoriteMoviesRepository;

  GetAllFavoriteMoviesUseCase({required this.favoriteMoviesRepository});

  @override
  Future<List<Result>> call(dynamic params) {
    return favoriteMoviesRepository.getAllFavoriteMovies();
  }
}
