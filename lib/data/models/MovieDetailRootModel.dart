// To parse this JSON data, do
//
//     final movieDetailRootModel = movieDetailRootModelFromJson(jsonString);

import 'dart:convert';

import 'package:hive/hive.dart';
part 'MovieDetailRootModel.g.dart';

MovieDetailRootModel movieDetailRootModelFromJson(String str) =>
    MovieDetailRootModel.fromJson(json.decode(str));

String movieDetailRootModelToJson(MovieDetailRootModel data) =>
    json.encode(data.toJson());

@HiveType(typeId: 0)
class MovieDetailRootModel {
  @HiveField(0)
  bool? adult;
  @HiveField(1)
  String? backdropPath;
  @HiveField(2)
  BelongsToCollection? belongsToCollection;
  @HiveField(3)
  int? budget;
  @HiveField(4)
  List<Genre>? genres;
  @HiveField(5)
  String? homepage;
  @HiveField(6)
  int? id;
  @HiveField(7)
  String? imdbId;
  @HiveField(8)
  List<String>? originCountry;
  @HiveField(9)
  String? originalLanguage;
  @HiveField(10)
  String? originalTitle;
  @HiveField(11)
  String? overview;
  @HiveField(12)
  double? popularity;
  @HiveField(13)
  String? posterPath;
  @HiveField(14)
  List<ProductionCompany>? productionCompanies;
  @HiveField(15)
  List<ProductionCountry>? productionCountries;
  @HiveField(16)
  DateTime? releaseDate;
  @HiveField(17)
  int? revenue;
  @HiveField(18)
  int? runtime;
  @HiveField(19)
  List<SpokenLanguage>? spokenLanguages;
  @HiveField(20)
  String? status;
  @HiveField(21)
  String? tagline;
  @HiveField(22)
  String? title;
  @HiveField(23)
  bool? video;
  @HiveField(24)
  double? voteAverage;
  @HiveField(25)
  int? voteCount;

  MovieDetailRootModel({
    this.adult,
    this.backdropPath,
    this.belongsToCollection,
    this.budget,
    this.genres,
    this.homepage,
    this.id,
    this.imdbId,
    this.originCountry,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.productionCompanies,
    this.productionCountries,
    this.releaseDate,
    this.revenue,
    this.runtime,
    this.spokenLanguages,
    this.status,
    this.tagline,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

  factory MovieDetailRootModel.fromJson(Map<String, dynamic> json) =>
      MovieDetailRootModel(
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        belongsToCollection: json["belongs_to_collection"] == null
            ? null
            : BelongsToCollection.fromJson(json["belongs_to_collection"]),
        budget: json["budget"],
        genres: json["genres"] == null
            ? []
            : List<Genre>.from(json["genres"]!.map((x) => Genre.fromJson(x))),
        homepage: json["homepage"],
        id: json["id"],
        imdbId: json["imdb_id"],
        originCountry: json["origin_country"] == null
            ? []
            : List<String>.from(json["origin_country"]!.map((x) => x)),
        originalLanguage: json["original_language"],
        originalTitle: json["original_title"],
        overview: json["overview"],
        popularity: json["popularity"]?.toDouble(),
        posterPath: json["poster_path"],
        productionCompanies: json["production_companies"] == null
            ? []
            : List<ProductionCompany>.from(json["production_companies"]!
                .map((x) => ProductionCompany.fromJson(x))),
        productionCountries: json["production_countries"] == null
            ? []
            : List<ProductionCountry>.from(json["production_countries"]!
                .map((x) => ProductionCountry.fromJson(x))),
        releaseDate: json["release_date"] == null
            ? null
            : DateTime.parse(json["release_date"]),
        revenue: json["revenue"],
        runtime: json["runtime"],
        spokenLanguages: json["spoken_languages"] == null
            ? []
            : List<SpokenLanguage>.from(json["spoken_languages"]!
                .map((x) => SpokenLanguage.fromJson(x))),
        status: json["status"],
        tagline: json["tagline"],
        title: json["title"],
        video: json["video"],
        voteAverage: json["vote_average"]?.toDouble(),
        voteCount: json["vote_count"],
      );

  Map<String, dynamic> toJson() => {
        "adult": adult,
        "backdrop_path": backdropPath,
        "belongs_to_collection": belongsToCollection?.toJson(),
        "budget": budget,
        "genres": genres == null
            ? []
            : List<dynamic>.from(genres!.map((x) => x.toJson())),
        "homepage": homepage,
        "id": id,
        "imdb_id": imdbId,
        "origin_country": originCountry == null
            ? []
            : List<dynamic>.from(originCountry!.map((x) => x)),
        "original_language": originalLanguage,
        "original_title": originalTitle,
        "overview": overview,
        "popularity": popularity,
        "poster_path": posterPath,
        "production_companies": productionCompanies == null
            ? []
            : List<dynamic>.from(productionCompanies!.map((x) => x.toJson())),
        "production_countries": productionCountries == null
            ? []
            : List<dynamic>.from(productionCountries!.map((x) => x.toJson())),
        "release_date":
            "${releaseDate!.year.toString().padLeft(4, '0')}-${releaseDate!.month.toString().padLeft(2, '0')}-${releaseDate!.day.toString().padLeft(2, '0')}",
        "revenue": revenue,
        "runtime": runtime,
        "spoken_languages": spokenLanguages == null
            ? []
            : List<dynamic>.from(spokenLanguages!.map((x) => x.toJson())),
        "status": status,
        "tagline": tagline,
        "title": title,
        "video": video,
        "vote_average": voteAverage,
        "vote_count": voteCount,
      };
}

@HiveType(typeId: 1)
class BelongsToCollection {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? name;
  @HiveField(2)
  String? posterPath;
  @HiveField(3)
  String? backdropPath;

  BelongsToCollection({
    this.id,
    this.name,
    this.posterPath,
    this.backdropPath,
  });

  factory BelongsToCollection.fromJson(Map<String, dynamic> json) =>
      BelongsToCollection(
        id: json["id"],
        name: json["name"],
        posterPath: json["poster_path"],
        backdropPath: json["backdrop_path"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "poster_path": posterPath,
        "backdrop_path": backdropPath,
      };
}

@HiveType(typeId: 2)
class Genre {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? name;

  Genre({
    this.id,
    this.name,
  });

  factory Genre.fromJson(Map<String, dynamic> json) => Genre(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

@HiveType(typeId: 3)
class ProductionCompany {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? logoPath;
  @HiveField(2)
  String? name;
  @HiveField(3)
  String? originCountry;

  ProductionCompany({
    this.id,
    this.logoPath,
    this.name,
    this.originCountry,
  });

  factory ProductionCompany.fromJson(Map<String, dynamic> json) =>
      ProductionCompany(
        id: json["id"],
        logoPath: json["logo_path"],
        name: json["name"],
        originCountry: json["origin_country"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "logo_path": logoPath,
        "name": name,
        "origin_country": originCountry,
      };
}

@HiveType(typeId: 4)
class ProductionCountry {
  @HiveField(0)
  String? iso31661;
  @HiveField(1)
  String? name;

  ProductionCountry({
    this.iso31661,
    this.name,
  });

  factory ProductionCountry.fromJson(Map<String, dynamic> json) =>
      ProductionCountry(
        iso31661: json["iso_3166_1"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "iso_3166_1": iso31661,
        "name": name,
      };
}

@HiveType(typeId: 5)
class SpokenLanguage {
  @HiveField(0)
  String? englishName;
  @HiveField(1)
  String? iso6391;
  @HiveField(2)
  String? name;

  SpokenLanguage({
    this.englishName,
    this.iso6391,
    this.name,
  });

  factory SpokenLanguage.fromJson(Map<String, dynamic> json) => SpokenLanguage(
        englishName: json["english_name"],
        iso6391: json["iso_639_1"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "english_name": englishName,
        "iso_639_1": iso6391,
        "name": name,
      };
}
