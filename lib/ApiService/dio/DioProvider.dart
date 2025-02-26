import 'package:dio/dio.dart';
import 'package:my_movie_app/Utils/SecureStorageService.dart';

class DioProvider {
  static final DioProvider dioProvider = DioProvider._internal();
  late Dio dio;
  late String authKey;

  factory DioProvider() => dioProvider;

  DioProvider._internal();

  Future<void> create() async {
    authKey = (await SecureStorageService.getKey("auth_token")) ?? "";
    dio = Dio(BaseOptions(
      baseUrl: "https://api.themoviedb.org/3/",
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $authKey',
      },
    ));
  }
}
