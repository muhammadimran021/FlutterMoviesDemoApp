import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:my_movie_app/domain/use_cases/SearchMovieUseCase.dart';
import 'package:my_movie_app/presentation/components/MoviesVerticalList.dart';
import 'package:my_movie_app/presentation/screens/SearchPage/SearchMovieBloc.dart';
import 'package:my_movie_app/presentation/screens/SearchPage/SearchMovieState.dart';

import '../movie_detail_screen/MovieDetails.dart';

class Search extends SearchDelegate<String> {
  late final SearchMovieBloc searchMovieBloc;

  Search() {
    searchMovieBloc = GetIt.instance<SearchMovieBloc>();
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, '');
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  Widget _searchContent() {
    return BlocBuilder<SearchMovieBloc, SearchMovieState>(
        bloc: searchMovieBloc,
        builder: (context, state) {
          if (state is LoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is LoadedState) {
            return MoviesVerticalList(
                moviesList: state.searchMovieRootModel.results!,
                onItemClick: (movieItem) {
                  close(context, '');
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MovieDetailsScreen(
                                movieItem: movieItem,
                              )));
                });
          } else if (state is ErrorState) {
            return Container(
              child: Text(state.message),
            );
          }
          return Container();
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isNotEmpty && query.length > 4) {
      searchMovieBloc.add(SearchMovieParams(query: query, language: 'us-en'));
    }
    return Scaffold(
      body: _searchContent(),
    );
  }
}

class SearchQueryChangesParams {
  final String query;

  SearchQueryChangesParams({required this.query});
}
