// To parse this JSON data, do
//
//     final searchMovieRootModel = searchMovieRootModelFromJson(jsonString);

import 'dart:convert';

import 'TopRatedMoviesRootModel.dart';

SearchMovieRootModel searchMovieRootModelFromJson(String str) =>
    SearchMovieRootModel.fromJson(json.decode(str));

String searchMovieRootModelToJson(SearchMovieRootModel data) =>
    json.encode(data.toJson());

class SearchMovieRootModel {
  int? page;
  List<Result>? results;
  int? totalPages;
  int? totalResults;

  SearchMovieRootModel({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  factory SearchMovieRootModel.fromJson(Map<String, dynamic> json) =>
      SearchMovieRootModel(
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


enum OriginalLanguage { EN, ES }

final originalLanguageValues =
    EnumValues({"en": OriginalLanguage.EN, "es": OriginalLanguage.ES});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
