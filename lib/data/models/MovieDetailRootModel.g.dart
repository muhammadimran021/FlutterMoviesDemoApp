// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MovieDetailRootModel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MovieDetailRootModelAdapter extends TypeAdapter<MovieDetailRootModel> {
  @override
  final int typeId = 0;

  @override
  MovieDetailRootModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MovieDetailRootModel(
      adult: fields[0] as bool?,
      backdropPath: fields[1] as String?,
      belongsToCollection: fields[2] as BelongsToCollection?,
      budget: fields[3] as int?,
      genres: (fields[4] as List?)?.cast<Genre>(),
      homepage: fields[5] as String?,
      id: fields[6] as int?,
      imdbId: fields[7] as String?,
      originCountry: (fields[8] as List?)?.cast<String>(),
      originalLanguage: fields[9] as String?,
      originalTitle: fields[10] as String?,
      overview: fields[11] as String?,
      popularity: fields[12] as double?,
      posterPath: fields[13] as String?,
      productionCompanies: (fields[14] as List?)?.cast<ProductionCompany>(),
      productionCountries: (fields[15] as List?)?.cast<ProductionCountry>(),
      releaseDate: fields[16] as DateTime?,
      revenue: fields[17] as int?,
      runtime: fields[18] as int?,
      spokenLanguages: (fields[19] as List?)?.cast<SpokenLanguage>(),
      status: fields[20] as String?,
      tagline: fields[21] as String?,
      title: fields[22] as String?,
      video: fields[23] as bool?,
      voteAverage: fields[24] as double?,
      voteCount: fields[25] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, MovieDetailRootModel obj) {
    writer
      ..writeByte(26)
      ..writeByte(0)
      ..write(obj.adult)
      ..writeByte(1)
      ..write(obj.backdropPath)
      ..writeByte(2)
      ..write(obj.belongsToCollection)
      ..writeByte(3)
      ..write(obj.budget)
      ..writeByte(4)
      ..write(obj.genres)
      ..writeByte(5)
      ..write(obj.homepage)
      ..writeByte(6)
      ..write(obj.id)
      ..writeByte(7)
      ..write(obj.imdbId)
      ..writeByte(8)
      ..write(obj.originCountry)
      ..writeByte(9)
      ..write(obj.originalLanguage)
      ..writeByte(10)
      ..write(obj.originalTitle)
      ..writeByte(11)
      ..write(obj.overview)
      ..writeByte(12)
      ..write(obj.popularity)
      ..writeByte(13)
      ..write(obj.posterPath)
      ..writeByte(14)
      ..write(obj.productionCompanies)
      ..writeByte(15)
      ..write(obj.productionCountries)
      ..writeByte(16)
      ..write(obj.releaseDate)
      ..writeByte(17)
      ..write(obj.revenue)
      ..writeByte(18)
      ..write(obj.runtime)
      ..writeByte(19)
      ..write(obj.spokenLanguages)
      ..writeByte(20)
      ..write(obj.status)
      ..writeByte(21)
      ..write(obj.tagline)
      ..writeByte(22)
      ..write(obj.title)
      ..writeByte(23)
      ..write(obj.video)
      ..writeByte(24)
      ..write(obj.voteAverage)
      ..writeByte(25)
      ..write(obj.voteCount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieDetailRootModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class BelongsToCollectionAdapter extends TypeAdapter<BelongsToCollection> {
  @override
  final int typeId = 1;

  @override
  BelongsToCollection read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BelongsToCollection(
      id: fields[0] as int?,
      name: fields[1] as String?,
      posterPath: fields[2] as String?,
      backdropPath: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, BelongsToCollection obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.posterPath)
      ..writeByte(3)
      ..write(obj.backdropPath);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BelongsToCollectionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class GenreAdapter extends TypeAdapter<Genre> {
  @override
  final int typeId = 2;

  @override
  Genre read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Genre(
      id: fields[0] as int?,
      name: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Genre obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GenreAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ProductionCompanyAdapter extends TypeAdapter<ProductionCompany> {
  @override
  final int typeId = 3;

  @override
  ProductionCompany read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductionCompany(
      id: fields[0] as int?,
      logoPath: fields[1] as String?,
      name: fields[2] as String?,
      originCountry: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ProductionCompany obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.logoPath)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.originCountry);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductionCompanyAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ProductionCountryAdapter extends TypeAdapter<ProductionCountry> {
  @override
  final int typeId = 4;

  @override
  ProductionCountry read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductionCountry(
      iso31661: fields[0] as String?,
      name: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ProductionCountry obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.iso31661)
      ..writeByte(1)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductionCountryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SpokenLanguageAdapter extends TypeAdapter<SpokenLanguage> {
  @override
  final int typeId = 5;

  @override
  SpokenLanguage read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SpokenLanguage(
      englishName: fields[0] as String?,
      iso6391: fields[1] as String?,
      name: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, SpokenLanguage obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.englishName)
      ..writeByte(1)
      ..write(obj.iso6391)
      ..writeByte(2)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SpokenLanguageAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
