// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CreditsRoodModel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CreditsRoodModelAdapter extends TypeAdapter<CreditsRoodModel> {
  @override
  final int typeId = 6;

  @override
  CreditsRoodModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CreditsRoodModel(
      id: fields[0] as int?,
      cast: (fields[1] as List?)?.cast<Cast>(),
      crew: (fields[2] as List?)?.cast<Cast>(),
    );
  }

  @override
  void write(BinaryWriter writer, CreditsRoodModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.cast)
      ..writeByte(2)
      ..write(obj.crew);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CreditsRoodModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CastAdapter extends TypeAdapter<Cast> {
  @override
  final int typeId = 7;

  @override
  Cast read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Cast(
      adult: fields[0] as bool?,
      gender: fields[1] as int?,
      id: fields[2] as int?,
      knownForDepartment: fields[3] as String?,
      name: fields[4] as String?,
      originalName: fields[5] as String?,
      popularity: fields[6] as double?,
      profilePath: fields[7] as String?,
      castId: fields[8] as int?,
      character: fields[9] as String?,
      creditId: fields[10] as String?,
      order: fields[11] as int?,
      department: fields[12] as String?,
      job: fields[13] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Cast obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.adult)
      ..writeByte(1)
      ..write(obj.gender)
      ..writeByte(2)
      ..write(obj.id)
      ..writeByte(3)
      ..write(obj.knownForDepartment)
      ..writeByte(4)
      ..write(obj.name)
      ..writeByte(5)
      ..write(obj.originalName)
      ..writeByte(6)
      ..write(obj.popularity)
      ..writeByte(7)
      ..write(obj.profilePath)
      ..writeByte(8)
      ..write(obj.castId)
      ..writeByte(9)
      ..write(obj.character)
      ..writeByte(10)
      ..write(obj.creditId)
      ..writeByte(11)
      ..write(obj.order)
      ..writeByte(12)
      ..write(obj.department)
      ..writeByte(13)
      ..write(obj.job);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CastAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
