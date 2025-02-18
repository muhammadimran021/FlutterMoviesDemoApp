import 'package:my_movie_app/data/models/TopRatedMoviesRootModel.dart';
import 'package:my_movie_app/data/repositories/SearchMovieRepository.dart';
import 'package:my_movie_app/domain/use_cases/BaseUseCase.dart';

import '../../data/models/SearchMovieRootModel.dart';

class SearchMovieUseCase
    extends BaseUseCase<SearchMovieRootModel, SearchMovieParams> {
  final SearchMovieRepository repository;

  SearchMovieUseCase({required this.repository});

  @override
  Future<SearchMovieRootModel> call(SearchMovieParams params) {
    return repository.searchMovie(params.query, params.language);
  }
}

class SearchMovieParams {
  final String query;
  final String language;

  SearchMovieParams({required this.query, required this.language});
}
