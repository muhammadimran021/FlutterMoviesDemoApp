// To parse this JSON data, do
//
//     final creditsRoodModel = creditsRoodModelFromJson(jsonString);

import 'dart:convert';

import 'package:hive/hive.dart';
part 'CreditsRoodModel.g.dart';

CreditsRoodModel creditsRoodModelFromJson(String str) =>
    CreditsRoodModel.fromJson(json.decode(str));

String creditsRoodModelToJson(CreditsRoodModel data) =>
    json.encode(data.toJson());

@HiveType(typeId: 6)
class CreditsRoodModel {
  @HiveField(0)
  int? id;
  @HiveField(1)
  List<Cast>? cast;
  @HiveField(2)
  List<Cast>? crew;

  CreditsRoodModel({
    this.id,
    this.cast,
    this.crew,
  });

  factory CreditsRoodModel.fromJson(Map<String, dynamic> json) =>
      CreditsRoodModel(
        id: json["id"],
        cast: json["cast"] == null
            ? []
            : List<Cast>.from(json["cast"]!.map((x) => Cast.fromJson(x))),
        crew: json["crew"] == null
            ? []
            : List<Cast>.from(json["crew"]!.map((x) => Cast.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "cast": cast == null
            ? []
            : List<dynamic>.from(cast!.map((x) => x.toJson())),
        "crew": crew == null
            ? []
            : List<dynamic>.from(crew!.map((x) => x.toJson())),
      };
}

@HiveType(typeId: 7)
class Cast {
  @HiveField(0)
  bool? adult;
  @HiveField(1)
  int? gender;
  @HiveField(2)
  int? id;
  @HiveField(3)
  String? knownForDepartment;
  @HiveField(4)
  String? name;
  @HiveField(5)
  String? originalName;
  @HiveField(6)
  double? popularity;
  @HiveField(7)
  String? profilePath;
  @HiveField(8)
  int? castId;
  @HiveField(9)
  String? character;
  @HiveField(10)
  String? creditId;
  @HiveField(11)
  int? order;
  @HiveField(12)
  String? department;
  @HiveField(13)
  String? job;

  Cast({
    this.adult,
    this.gender,
    this.id,
    this.knownForDepartment,
    this.name,
    this.originalName,
    this.popularity,
    this.profilePath,
    this.castId,
    this.character,
    this.creditId,
    this.order,
    this.department,
    this.job,
  });

  factory Cast.fromJson(Map<String, dynamic> json) => Cast(
        adult: json["adult"],
        gender: json["gender"],
        id: json["id"],
        knownForDepartment: json["known_for_department"],
        name: json["name"],
        originalName: json["original_name"],
        popularity: json["popularity"]?.toDouble(),
        profilePath: json["profile_path"],
        castId: json["cast_id"],
        character: json["character"],
        creditId: json["credit_id"],
        order: json["order"],
        department: json["department"],
        job: json["job"],
      );

  Map<String, dynamic> toJson() => {
        "adult": adult,
        "gender": gender,
        "id": id,
        "known_for_department": knownForDepartment,
        "name": name,
        "original_name": originalName,
        "popularity": popularity,
        "profile_path": profilePath,
        "cast_id": castId,
        "character": character,
        "credit_id": creditId,
        "order": order,
        "department": department,
        "job": job,
      };
}
