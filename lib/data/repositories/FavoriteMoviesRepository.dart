import 'package:my_movie_app/Utils/HiveDatabaseHelper.dart';
import 'package:my_movie_app/data/models/TopRatedMoviesRootModel.dart';

class FavoriteMoviesRepository {
  final hiveDatabaseHelper = HiveDatabaseHelper();

  Future<List<Result>> getAllFavoriteMovies() async {
    final moviesList = hiveDatabaseHelper.getAll<Result>("MyFavoriteMovies");
    return moviesList;
  }
}
