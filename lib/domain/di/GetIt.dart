import 'package:get_it/get_it.dart';
import 'package:my_movie_app/ApiService/dio/DioProvider.dart';
import 'package:my_movie_app/data/repositories/HomeScreenRepository.dart';
import 'package:my_movie_app/data/repositories/NowPlayingMoviesRepository.dart';
import 'package:my_movie_app/domain/use_cases/DiscoverMoviesUseCase.dart';
import 'package:my_movie_app/domain/use_cases/NowPlayingMoviesUseCase.dart';
import 'package:my_movie_app/domain/use_cases/PopularMoviesUseCase.dart';
import 'package:my_movie_app/domain/use_cases/TopRatedMoviesUseCase.dart';
import 'package:my_movie_app/presentation/screens/HomeScreen/HomeScreenBloc.dart';
import 'package:my_movie_app/presentation/screens/MoviesList/NowPlayingMoviesBloc.dart';

final sl = GetIt.instance;

void setUpLocators() {
  sl.registerLazySingleton(() => DioProvider());
  sl.registerLazySingleton(() => HomeScreenRepository(dio: sl()));
  sl.registerLazySingleton(() => NowPlayingMoviesRepository(dioProvider: sl()));
  sl.registerLazySingleton(() => TopRatedMoviesUseCase(repository: sl()));
  sl.registerLazySingleton(() => DiscoverMoviesUseCase(repository: sl()));
  sl.registerLazySingleton(() => PopularMoviesUseCase(repository: sl()));
  sl.registerLazySingleton(() => NowPlayingMoviesUseCase(repository: sl()));
  sl.registerFactory(() => DiscoverMoviesBloc(sl()));
  sl.registerFactory(() => TopRatedMoviesBloc(sl()));
  sl.registerFactory(() => PopularMoviesBloc(sl()));
  sl.registerFactory(() => NowPlayingMoviesBloc(nowPlayingMoviesUseCase: sl()));
}
