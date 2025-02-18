import 'package:get_it/get_it.dart';
import 'package:my_movie_app/ApiService/dio/DioProvider.dart';
import 'package:my_movie_app/data/repositories/HomeScreenRepository.dart';
import 'package:my_movie_app/data/repositories/MovieDetailRepository.dart';
import 'package:my_movie_app/data/repositories/NowPlayingMoviesRepository.dart';
import 'package:my_movie_app/data/repositories/SearchMovieRepository.dart';
import 'package:my_movie_app/domain/use_cases/DiscoverMoviesUseCase.dart';
import 'package:my_movie_app/domain/use_cases/MovieCreditUseCase.dart';
import 'package:my_movie_app/domain/use_cases/MovieDetailUseCase.dart';
import 'package:my_movie_app/domain/use_cases/NowPlayingMoviesUseCase.dart';
import 'package:my_movie_app/domain/use_cases/PopularMoviesUseCase.dart';
import 'package:my_movie_app/domain/use_cases/SearchMovieUseCase.dart';
import 'package:my_movie_app/domain/use_cases/TopRatedMoviesUseCase.dart';
import 'package:my_movie_app/presentation/screens/HomeScreen/HomeScreenBloc.dart';
import 'package:my_movie_app/presentation/screens/MoviesList/NowPlayingMoviesBloc.dart';
import 'package:my_movie_app/presentation/screens/SearchPage/SearchMovieBloc.dart';
import 'package:my_movie_app/presentation/screens/movie_detail_screen/MovieDetailBlocs.dart';

final sl = GetIt.instance;

void setUpLocators() {
  sl.registerLazySingleton(() => DioProvider());

  /**
   * Repositories
   */
  sl.registerLazySingleton(() => HomeScreenRepository(dio: sl()));
  sl.registerLazySingleton(() => NowPlayingMoviesRepository(dioProvider: sl()));
  sl.registerLazySingleton(() => MovieDetailRepository(dioProvider: sl()));
  sl.registerLazySingleton(() => SearchMovieRepository(dioProvider: sl()));

  /**
   * Use Cases
   */
  sl.registerLazySingleton(() => TopRatedMoviesUseCase(repository: sl()));
  sl.registerLazySingleton(() => DiscoverMoviesUseCase(repository: sl()));
  sl.registerLazySingleton(() => PopularMoviesUseCase(repository: sl()));
  sl.registerLazySingleton(() => NowPlayingMoviesUseCase(repository: sl()));
  sl.registerLazySingleton(() => MovieCreditUseCase(repository: sl()));
  sl.registerLazySingleton(() => MovieDetailUseCase(sl()));
  sl.registerLazySingleton(() => SearchMovieUseCase(repository: sl()));

  /**
   * Bloc's
   */
  sl.registerFactory(() => DiscoverMoviesBloc(sl()));
  sl.registerFactory(() => TopRatedMoviesBloc(sl()));
  sl.registerFactory(() => PopularMoviesBloc(sl()));
  sl.registerFactory(() => NowPlayingMoviesBloc(nowPlayingMoviesUseCase: sl()));
  sl.registerFactory(() => MovieCreditBloc(sl()));
  sl.registerFactory(() => MovieDetailBloc(sl()));
  sl.registerFactory(() => SearchMovieBloc(searchMovieUseCase: sl()));
}
