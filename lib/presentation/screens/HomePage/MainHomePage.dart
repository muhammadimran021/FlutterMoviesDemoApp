import 'package:flutter/material.dart';
import 'package:my_movie_app/presentation/screens/HomeScreen/home_screen.dart';
import 'package:my_movie_app/presentation/screens/movie_detail_screen/MovieDetails.dart';

import '../MoviesList/NowPlayingMovies.dart';

class MainHomePage extends StatefulWidget {
  const MainHomePage({super.key});

  @override
  State<MainHomePage> createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  var index = 0;
  final List list = [HomeScreen(), AllMoviesPage(), MovieDetailsScreen()];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            leading: Icon(Icons.menu),
            backgroundColor: Colors.grey.shade300,
            title: Text("Movies"),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Icon(Icons.search),
              )
            ],
          ),
          body: list[index],
          bottomNavigationBar: Container(
            height: 70,
            decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25))),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                        onTap: () {
                          setState(() {
                            index = 0;
                          });
                        },
                        child: Column(children: [
                          Icon(Icons.home, size: 30),
                          Text("Home")
                        ])),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                        onTap: () {
                          setState(() {
                            index = 1;
                          });
                        },
                        child: Column(children: [
                          Icon(Icons.movie, size: 30),
                          Text("Now Playing")
                        ])),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                        onTap: () {
                          setState(() {
                            index = 2;
                          });
                        },
                        child: Column(children: [
                          Icon(Icons.favorite, size: 30),
                          Text("Favorite")
                        ])),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                        onTap: () {
                          setState(() {
                            index = 3;
                          });
                        },
                        child: Column(children: [
                          Icon(Icons.trending_up, size: 30),
                          Text("Trending")
                        ])),
                  ),
                ]),
          )),
    );
  }
}
