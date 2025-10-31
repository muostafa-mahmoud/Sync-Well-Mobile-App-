// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nutritions.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NutritionsAdapter extends TypeAdapter<Nutritions> {
  @override
  final int typeId = 2;

  @override
  Nutritions read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Nutritions(
      calories: fields[0] as double,
      protein: fields[1] as double,
      fat: fields[2] as double,
      carbohydrates: fields[3] as double,
    );
  }

  @override
  void write(BinaryWriter writer, Nutritions obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.calories)
      ..writeByte(1)
      ..write(obj.protein)
      ..writeByte(2)
      ..write(obj.fat)
      ..writeByte(3)
      ..write(obj.carbohydrates);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NutritionsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
