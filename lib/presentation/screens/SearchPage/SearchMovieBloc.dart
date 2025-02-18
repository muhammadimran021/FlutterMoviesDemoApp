import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movie_app/domain/use_cases/SearchMovieUseCase.dart';
import 'package:my_movie_app/presentation/screens/SearchPage/SearchMovieState.dart';

class SearchMovieBloc extends Bloc<SearchMovieParams, SearchMovieState> {
  final SearchMovieUseCase searchMovieUseCase;

  SearchMovieBloc({required this.searchMovieUseCase}) : super(InitialState()) {
    on<SearchMovieParams>((event, emit) async {
      emit(LoadingState());
      try {
        // Add a delay before making the API call
        await Future.delayed(Duration(milliseconds: 1000));
        final response = await searchMovieUseCase.call(event);
        emit(LoadedState(searchMovieRootModel: response));
      } catch (e) {
        emit(ErrorState(message: e.toString()));
      }
    });
  }




}
