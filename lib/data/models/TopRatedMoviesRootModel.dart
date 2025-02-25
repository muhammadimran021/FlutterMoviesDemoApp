// To parse this JSON data, do
//
//     final topRatedMoviesRootModel = topRatedMoviesRootModelFromJson(jsonString);

import 'dart:convert';

import 'package:hive/hive.dart';
part 'TopRatedMoviesRootModel.g.dart';

TopRatedMoviesRootModel topRatedMoviesRootModelFromJson(String str) =>
    TopRatedMoviesRootModel.fromJson(json.decode(str));

String topRatedMoviesRootModelToJson(TopRatedMoviesRootModel data) =>
    json.encode(data.toJson());

class TopRatedMoviesRootModel {
  int? page;
  List<Result>? results;
  int? totalPages;
  int? totalResults;

  TopRatedMoviesRootModel({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  factory TopRatedMoviesRootModel.fromJson(Map<String, dynamic> json) =>
      TopRatedMoviesRootModel(
        page: json["page"],
        results: json["results"] == null
            ? []
            : List<Result>.from(
                json["results"]!.map((x) => Result.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "results": results == null
            ? []
            : List<dynamic>.from(results!.map((x) => x.toJson())),
        "total_pages": totalPages,
        "total_results": totalResults,
      };
}

@HiveType(typeId: 8)
class Result {
  @HiveField(0)
  bool? adult;
  @HiveField(1)
  String? backdropPath;
  @HiveField(2)
  List<int>? genreIds;
  @HiveField(3)
  int? id;
  @HiveField(4)
  String? originalLanguage;
  @HiveField(5)
  String? originalTitle;
  @HiveField(6)
  String? overview;
  @HiveField(7)
  double? popularity;
  @HiveField(8)
  String? posterPath;
  @HiveField(9)
  DateTime? releaseDate;
  @HiveField(10)
  String? title;
  @HiveField(11)
  bool? video;
  @HiveField(12)
  double? voteAverage;
  @HiveField(13)
  int? voteCount;

  Result({
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        genreIds: json["genre_ids"] == null
            ? []
            : List<int>.from(json["genre_ids"]!.map((x) => x)),
        id: json["id"],
        originalLanguage: json["original_language"],
        originalTitle: json["original_title"],
        overview: json["overview"],
        popularity: json["popularity"]?.toDouble(),
        posterPath: json["poster_path"],
        releaseDate: (json["release_date"] == null || json["release_date"].toString().trim().isEmpty)
            ? null
            : DateTime.parse(json["release_date"]),
        title: json["title"],
        video: json["video"],
        voteAverage: json["vote_average"]?.toDouble(),
        voteCount: json["vote_count"],
      );

  Map<String, dynamic> toJson() => {
        "adult": adult,
        "backdrop_path": backdropPath,
        "genre_ids":
            genreIds == null ? [] : List<dynamic>.from(genreIds!.map((x) => x)),
        "id": id,
        "original_language": originalLanguage,
        "original_title": originalTitle,
        "overview": overview,
        "popularity": popularity,
        "poster_path": posterPath,
        "release_date":
            "${releaseDate!.year.toString().padLeft(4, '0')}-${releaseDate!.month.toString().padLeft(2, '0')}-${releaseDate!.day.toString().padLeft(2, '0')}",
        "title": title,
        "video": video,
        "vote_average": voteAverage,
        "vote_count": voteCount,
      };
}
