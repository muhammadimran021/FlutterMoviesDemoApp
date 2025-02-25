import 'package:flutter/material.dart';
import 'package:my_movie_app/presentation/screens/HomeScreen/home_screen.dart';
import 'package:my_movie_app/presentation/screens/SearchPage/Search.dart';

import '../MoviesList/NowPlayingMovies.dart';
import '../favorite_movies/FavoriteMoviesPage.dart';

class MainHomePage extends StatefulWidget {
  const MainHomePage({super.key});

  @override
  State<MainHomePage> createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  var index = 0;
  final List list = [
    HomeScreen(),
    AllMoviesPage(),
    FavoriteMoviesPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            leading: Icon(Icons.menu),
            backgroundColor: Colors.grey.shade300,
            title: Text("Movies"),
            actions: [
              GestureDetector(
                onTap: () {
                  showSearch(context: context, delegate: Search());
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Icon(Icons.search),
                ),
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
                          Text(
                            "Home",
                            style: TextStyle(fontSize: 12),
                          )
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
                          Text(
                            "Now Playing",
                            style: TextStyle(fontSize: 12),
                          )
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
                          Text(
                            "Favorite",
                            style: TextStyle(fontSize: 12),
                          )
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
                          Text(
                            "Trending",
                            style: TextStyle(fontSize: 12),
                          )
                        ])),
                  ),
                ]),
          )),
    );
  }
}
