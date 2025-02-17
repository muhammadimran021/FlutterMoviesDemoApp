import 'package:flutter/material.dart';
import 'package:my_movie_app/data/models/CreditsRoodModel.dart';

class CrewListHorizontal extends StatelessWidget {
  final List<Cast> castList;

  const CrewListHorizontal({super.key, required this.castList});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: castList.length,
      itemBuilder: (context, index) {
        return _crewItem(castList[index]);
      },
      scrollDirection: Axis.horizontal,
    );
  }

  Widget _crewItem(Cast castList) {
    return SizedBox(
      width: 100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(80),
                child: castList.profilePath == null
                    ? Icon(Icons.not_interested,size: 80,)
                    : Image.network(
                        height: 80,
                        width: 80,
                        'https://image.tmdb.org/t/p/w500/${castList.profilePath}',
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
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: Text(
              textAlign: TextAlign.center,
              castList.name.toString(),
              style: TextStyle(
                fontSize: 12,
              ),
            ),
          )
        ],
      ),
    );
  }
}
