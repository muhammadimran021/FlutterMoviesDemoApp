import 'package:my_movie_app/ApiService/dio/DioProvider.dart';
import 'package:my_movie_app/data/models/CreditsRoodModel.dart';
import 'package:my_movie_app/data/models/MovieDetailRootModel.dart';
import 'package:my_movie_app/data/models/TopRatedMoviesRootModel.dart';

import '../../Utils/HiveDatabaseHelper.dart';

class MovieDetailRepository {
  final DioProvider dioProvider;
  final hiveDatabaseHelper = HiveDatabaseHelper();

  MovieDetailRepository({required this.dioProvider});

  Future<CreditsRoodModel> getMovieCredits(
      String id, String apiKey, String language) async {
    final response = await dioProvider.dio.get(
      '/movie/$id/credits?api_key=$apiKey&language=$language',
    );
    return CreditsRoodModel.fromJson(response.data);
  }

  Future<MovieDetailRootModel> getMovieDetail(
      String movieId, String language) async {
    final response =
        await dioProvider.dio.get('/movie/$movieId?language=$language');
    return MovieDetailRootModel.fromJson(response.data);
  }

  Future<void> markFavorite(String movieId, Result topRateMovieModel) async {
    await hiveDatabaseHelper.save<bool>("MarkFavorite", movieId, true);
    await hiveDatabaseHelper.save<Result>(
        "MyFavoriteMovies", movieId, topRateMovieModel);
  }

  Future<bool> getFavorite(String movieId) async {
    final result = await hiveDatabaseHelper.get<bool>("MarkFavorite", movieId);
    return result != null;
  }

  Future<void> unMarkFavorite(String movieId) async {
    await hiveDatabaseHelper.delete<bool>("MarkFavorite", movieId);
    await hiveDatabaseHelper.delete<Result>("MyFavoriteMovies", movieId.toString());
  }
}
