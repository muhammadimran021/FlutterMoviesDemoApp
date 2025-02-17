import 'package:flutter/material.dart';

import '../../data/models/TopRatedMoviesRootModel.dart';

class MoviesListHorizontal extends StatelessWidget {
  final List<Result> moviesList;
  final void Function(Result) onItemClick;

  const MoviesListHorizontal(
      {super.key, required this.moviesList, required this.onItemClick});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: moviesList.length,
        itemBuilder: (context, index) {
          return _buildItemList(moviesList[index], onItemClick);
        });
  }
}

Widget _buildItemList(
    Result moviesListItem, void Function(Result) onItemClick) {
  return Padding(
      padding: const EdgeInsets.only(top: 20.0, right: 5, left: 10),
      child: GestureDetector(
        onTap: () => onItemClick(moviesListItem),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      height: 155,
                      'https://image.tmdb.org/t/p/w500/${moviesListItem.posterPath!}',
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Center(child: CircularProgressIndicator());
                      },
                      errorBuilder: (context, error, stackTrace) {
                        return Center(
                            child: Icon(Icons.error, color: Colors.red));
                      },
                    )),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 100,
                  child: Text(
                    moviesListItem.title.toString(),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 12, color: Colors.black, height: 1.0),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(4)),
                child: Row(
                  children: [
                    Icon(
                      Icons.star_rate,
                      color: Colors.amber,
                    ),
                    Text(" ${moviesListItem.voteAverage.toString()}  ")
                  ],
                ),
              ),
            ),
          ],
        ),
      ));
}
