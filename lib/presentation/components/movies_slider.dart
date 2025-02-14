import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:my_movie_app/data/models/TopRatedMoviesRootModel.dart';

class MoviesSlider extends StatelessWidget {
  final List<Result> moviesList;

  const MoviesSlider({super.key, required this.moviesList});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: CarouselSlider.builder(
        options: CarouselOptions(
          height: 250,
          disableCenter: true,
          viewportFraction: 0.6,
          enlargeCenterPage: true,
          autoPlay: true,
        ),
        itemBuilder: (BuildContext context, int index, int realIndex) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              'https://image.tmdb.org/t/p/w500/${moviesList[index].posterPath!}',
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Center(child: CircularProgressIndicator());
              },
              errorBuilder: (context, error, stackTrace) {
                return Center(child: Icon(Icons.error, color: Colors.red));
              },
            ),
          );
        },
        itemCount: moviesList.length,
      ),
    );
  }
}
