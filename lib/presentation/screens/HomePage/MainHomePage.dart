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
                  Column(
                    children: [
                      IconButton(
                          onPressed: () {
                            setState(() {
                              index = 0;
                            });
                          },
                          icon: Icon(Icons.home, size: 30)),
                      Text("Home")
                    ],
                  ),
                  Column(
                    children: [
                      IconButton(
                          onPressed: () {
                            setState(() {
                              index = 1;
                            });
                          },
                          icon: Icon(
                            Icons.movie,
                            size: 30,
                          )),
                      Text("Now Playing")
                    ],
                  ),
                  Column(
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            index = 2;
                          });
                        },
                        icon: Icon(
                          Icons.favorite,
                          size: 30,
                        ),
                      ),
                      Text("Favorite")
                    ],
                  ),
                  Column(
                    children: [
                      IconButton(
                          onPressed: () {
                            setState(() {
                              index = 3;
                            });
                          },
                          icon: Icon(
                            Icons.trending_up_sharp,
                            size: 30,
                          )),
                      Text("Trending")
                    ],
                  )
                ]),
          )),
    );
  }
}
