import 'package:my_movie_app/ApiService/dio/DioProvider.dart';
import 'package:my_movie_app/data/models/TopRatedMoviesRootModel.dart';

class NowPlayingMoviesRepository {
  final DioProvider dioProvider;

  NowPlayingMoviesRepository({required this.dioProvider});

  Future<TopRatedMoviesRootModel> getNowPlayingMovies(
      NowPlayingMoviesParams params) async {
    final response = await dioProvider.dio.get('movie/now_playing?',
        queryParameters: {"language": params.language, "page": params.page});

    return TopRatedMoviesRootModel.fromJson(response.data);
  }
}

class NowPlayingMoviesParams {
  final String language;
  final String page;

  NowPlayingMoviesParams({required this.language, required this.page});
}
