import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movie_app/data/repositories/NowPlayingMoviesRepository.dart';
import 'package:my_movie_app/domain/use_cases/NowPlayingMoviesUseCase.dart';
import 'package:my_movie_app/presentation/screens/MoviesList/NowPlayingMoviesState.dart';

class NowPlayingMoviesBloc
    extends Bloc<NowPlayingMoviesParams, NowPlayingMoviesState> {
  final NowPlayingMoviesUseCase nowPlayingMoviesUseCase;

  NowPlayingMoviesBloc({required this.nowPlayingMoviesUseCase})
      : super(InitialState()) {
    on<NowPlayingMoviesParams>((event, emit) async {
      emit(LoadingState());
      final request = await nowPlayingMoviesUseCase.call(event);
      emit(LoadedNowPlayingMovies(results: request.results));
    });
  }
}
