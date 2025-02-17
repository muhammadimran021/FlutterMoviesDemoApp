import 'package:my_movie_app/ApiService/dio/DioProvider.dart';
import 'package:my_movie_app/data/models/CreditsRoodModel.dart';

class MovieDetailRepository {
  final DioProvider dioProvider;

  MovieDetailRepository({required this.dioProvider});

  Future<CreditsRoodModel> getMovieCredits (
      String id, String apiKey, String language) async {
    final response = await dioProvider.dio.get(
      '/movie/$id/credits?api_key=$apiKey&language=$language',
    );
    return CreditsRoodModel.fromJson(response.data);
  }
}
