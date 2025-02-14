import 'package:dio/dio.dart';

class DioProvider {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: "https://api.themoviedb.org/3/",
    connectTimeout: const Duration(seconds: 30),
    receiveTimeout: const Duration(seconds: 30),
    headers: {
      'Content-Type': 'application/json',
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJiZDlhMGYzYWFjMmIzYmI2MzdkNDdhNGFiNWM1ZDM4OCIsIm5iZiI6MTY0Njg5NDc0Ni4zMTEsInN1YiI6IjYyMjk5ZTlhZDM0ZWIzMDA2ZDQ0ZGFkYSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.n3vNoOwdGoAp7_Cdg_rQaLKWmPouJwQOYG-mVDY68sE',
    },
  ));

  Dio get dio => _dio;
}
