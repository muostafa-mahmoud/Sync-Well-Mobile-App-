// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diet_day_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MealsModelAdapter extends TypeAdapter<MealsModel> {
  @override
  final int typeId = 2;

  @override
  MealsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MealsModel(
      meals: (fields[0] as List).cast<MealsSection>(),
      nutritions: fields[1] as Nutritions,
    );
  }

  @override
  void write(BinaryWriter writer, MealsModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.meals)
      ..writeByte(1)
      ..write(obj.nutritions);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MealsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
