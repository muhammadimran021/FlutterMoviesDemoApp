import 'package:flutter/material.dart';
import 'package:my_movie_app/data/models/MovieDetailRootModel.dart';

class MoviesGenresList extends StatelessWidget {
  final List<Genre>? genre;

  const MoviesGenresList({super.key, required this.genre});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: genre == null ? 0 : genre?.length,
        itemBuilder: (context, index) {
          return _genreItemBuilder(genre![index]);
        });
  }

  Widget _genreItemBuilder(Genre genreItem) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0),
          child: Text(
            genreItem.name!,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
