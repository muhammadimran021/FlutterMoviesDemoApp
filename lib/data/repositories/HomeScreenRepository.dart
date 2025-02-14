import 'package:my_movie_app/ApiService/dio/DioProvider.dart';
import 'package:my_movie_app/data/models/TopRatedMoviesRootModel.dart';
import 'package:my_movie_app/domain/use_cases/DiscoverMoviesUseCase.dart';
import 'package:my_movie_app/domain/use_cases/PopularMoviesUseCase.dart';
import 'package:my_movie_app/domain/use_cases/TopRatedMoviesUseCase.dart';

class HomeScreenRepository {
  final DioProvider dio;
  final String _api_key = "bd9a0f3aac2b3bb637d47a4ab5c5d388";

  HomeScreenRepository({required this.dio});

  Future<TopRatedMoviesRootModel> getMovieList(
      TopRatedMoviesParams params) async {
    final response = await dio.dio.get("movie/top_rated",
        queryParameters: {"language": params.language, "page": params.page});

    return TopRatedMoviesRootModel.fromJson(response.data);
  }

  Future<TopRatedMoviesRootModel> getDiscoverMovies(
      DiscoverMoviesParams params) async {
    final response = await dio.dio.get(
      '/discover/movie?include_adult=false'
      '&include_video=false'
      '&language=${params.language}'
      '&page${params.page}'
      '&sort_by=popularity.desc',
    );

    return TopRatedMoviesRootModel.fromJson(response.data);
  }

  Future<TopRatedMoviesRootModel> getPopularMovies(
      PopularMoviesParams params) async {
    final response = await dio.dio.get('movie/popular?',
        queryParameters: {"language": params.language, "page": params.page});

    return TopRatedMoviesRootModel.fromJson(response.data);
  }

}
