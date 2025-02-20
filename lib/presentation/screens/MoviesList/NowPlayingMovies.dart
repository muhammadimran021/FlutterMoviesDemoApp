import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:my_movie_app/core/OverlayLoader.dart';
import 'package:my_movie_app/data/repositories/NowPlayingMoviesRepository.dart';
import 'package:my_movie_app/presentation/components/MoviesVerticalList.dart';
import 'package:my_movie_app/presentation/screens/MoviesList/NowPlayingMoviesBloc.dart';
import 'package:my_movie_app/presentation/screens/MoviesList/NowPlayingMoviesState.dart';

import '../movie_detail_screen/MovieDetails.dart';

class AllMoviesPage extends StatefulWidget {
  const AllMoviesPage({super.key});

  @override
  State<AllMoviesPage> createState() => _AllMoviesPageState();
}

class _AllMoviesPageState extends State<AllMoviesPage> {
  late final NowPlayingMoviesBloc nowPlayingMoviesBloc;

  @override
  void initState() {
    nowPlayingMoviesBloc = GetIt.instance<NowPlayingMoviesBloc>();
    super.initState();
  }

  @override
  void dispose() {
    nowPlayingMoviesBloc.close();
    print('Now playing bloc closed');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => nowPlayingMoviesBloc,
      child: _nowPlayingMoviesBuilder(),
    );
  }

  Widget _nowPlayingMoviesBuilder() {
    return BlocBuilder<NowPlayingMoviesBloc, NowPlayingMoviesState>(
      buildWhen: (emit, state) {
        if (state is LoadingState) {
          OverlayLoader.show(context);
        } else if (state is LoadedNowPlayingMovies || state is ErrorState) {
          OverlayLoader.hide();
        }
        return true;
      },
      builder: (context, state) {
        if (state is InitialState) {
          context
              .read<NowPlayingMoviesBloc>()
              .add(NowPlayingMoviesParams(language: "us-english", page: "1"));
        } else if (state is LoadedNowPlayingMovies) {
          return MoviesVerticalList(
            moviesList: state.results!,
            onItemClick: (movieItem) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MovieDetailsScreen(
                        movieItem: movieItem,
                      )));
            },
          );
        } else if (state is ErrorState) {
          return Center(child: Text(state.message));
        }
        return Container();
      },
    );
  }
}
