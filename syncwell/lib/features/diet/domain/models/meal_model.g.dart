// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MealsSectionAdapter extends TypeAdapter<MealsSection> {
  @override
  final int typeId = 1;

  @override
  MealsSection read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MealsSection(
      id: fields[0] as int,
      image: fields[1] as String,
      imageType: fields[2] as String,
      title: fields[3] as String,
      readyInMinutes: fields[4] as int,
      servings: fields[5] as int,
      sourceUrl: fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, MealsSection obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.image)
      ..writeByte(2)
      ..write(obj.imageType)
      ..writeByte(3)
      ..write(obj.title)
      ..writeByte(4)
      ..write(obj.readyInMinutes)
      ..writeByte(5)
      ..write(obj.servings)
      ..writeByte(6)
      ..write(obj.sourceUrl);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MealsSectionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
