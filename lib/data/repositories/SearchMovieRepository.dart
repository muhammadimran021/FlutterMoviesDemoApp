import 'package:my_movie_app/ApiService/dio/DioProvider.dart';
import 'package:my_movie_app/data/models/TopRatedMoviesRootModel.dart';

import '../models/SearchMovieRootModel.dart';

class SearchMovieRepository {
  final DioProvider dioProvider;

  SearchMovieRepository({required this.dioProvider});

  Future<SearchMovieRootModel> searchMovie(
      String query, String language) async {
    final response =
        await dioProvider.dio.get('/search/movie?query=$query&language=$language');
    print(response.data);
    return SearchMovieRootModel.fromJson(response.data);
  }
}
