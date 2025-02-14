import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:my_movie_app/core/OverlayLoader.dart';
import 'package:my_movie_app/domain/use_cases/DiscoverMoviesUseCase.dart';
import 'package:my_movie_app/domain/use_cases/PopularMoviesUseCase.dart';
import 'package:my_movie_app/domain/use_cases/TopRatedMoviesUseCase.dart';
import 'package:my_movie_app/presentation/components/movies_slider.dart';
import 'package:my_movie_app/presentation/screens/HomeScreen/HomeScreenBloc.dart';
import 'package:my_movie_app/presentation/screens/HomeScreen/HomeScreenStates.dart';

import '../../components/MoviesListHorizontal.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final DiscoverMoviesBloc sliderBloc;
  late final TopRatedMoviesBloc topRatedMoviesBloc;
  late final PopularMoviesBloc popularMoviesBloc;
  var showLoader = true;

  @override
  void initState() {
    sliderBloc = GetIt.instance<DiscoverMoviesBloc>();
    topRatedMoviesBloc = GetIt.instance<TopRatedMoviesBloc>();
    popularMoviesBloc = GetIt.instance<PopularMoviesBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider.value(value: sliderBloc),
          BlocProvider.value(value: topRatedMoviesBloc),
          BlocProvider.value(value: popularMoviesBloc),
        ],
        child: _homeScree(),
      ),
    ));
  }

  Widget _homeScree() {
    return Stack(
      children: [
        SingleChildScrollView(
            child: Column(children: [
          textTitle("Discover"),
          _moviesSlider(),
          _titleAndShowMore("Top Rated", "Show More"),
          _topRatedMovies(),
          _titleAndShowMore("Popular", "Show More"),
          _popularMovies(),
        ]))
      ],
    );
  }

  Widget _titleAndShowMore(String title, String showMoreText) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        textTitle(title),
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                children: [
                  Text(
                    "  $showMoreText  ",
                    style: TextStyle(fontSize: 12),
                  ),
                  Icon(
                    Icons.arrow_forward,
                    size: 14,
                  )
                ],
              ),
            ),
          ),
        )
      ]),
    );
  }

  Widget textTitle(
    String text,
  ) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, top: 20),
      child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        Text(
          text,
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
        ),
      ]),
    );
  }

  Widget _moviesSlider() {
    return BlocBuilder<DiscoverMoviesBloc, HomeState>(
      buildWhen: (previousState, currentState) {
        if (currentState is LoadingHomeScreen) {
          OverlayLoader.show(context);
        }
        return true;
      },
      builder: (context, state) {
        if (state is InitialHomeScreenState) {
          context
              .read<DiscoverMoviesBloc>()
              .add(DiscoverMoviesParams(language: "us-eng", page: "1"));
          context
              .read<TopRatedMoviesBloc>()
              .add(TopRatedMoviesParams(language: "us-eng", page: "1"));
          context
              .read<PopularMoviesBloc>()
              .add(PopularMoviesParams(language: "us-eng", page: "1"));
        } else if (state is LoadedMoviesSlider) {
          OverlayLoader.hide();
          return Center(
            child: MoviesSlider(moviesList: state.results!),
          );
        } else if (state is ErrorHomeScreenApi) {
          return Center(
            child: Text("Error: ${state.message}"),
          );
        }
        return Container();
      },
    );
  }

  Widget _topRatedMovies() {
    return BlocBuilder<TopRatedMoviesBloc, HomeState>(
        builder: (context, state) {
      if (state is LoadedDiscoverMovies) {
        return SizedBox(
          height: 265,
          child: MoviesListHorizontal(moviesList: state.results!),
        );
      }
      return Container();
    });
  }

  Widget _popularMovies() {
    return BlocBuilder<PopularMoviesBloc, HomeState>(builder: (event, state) {
      if (state is LoadedPopularMovies) {
        return SizedBox(
          height: 265,
          child: MoviesListHorizontal(moviesList: state.results!),
        );
      }
      return Container();
    });
  }
}
