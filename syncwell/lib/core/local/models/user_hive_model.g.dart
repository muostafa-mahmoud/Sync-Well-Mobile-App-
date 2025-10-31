// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserHiveModelAdapter extends TypeAdapter<UserHiveModel> {
  @override
  final int typeId = 0;

  @override
  UserHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserHiveModel(
      id: fields[0] as String,
      fullName: fields[1] as String,
      email: fields[2] as String,
      hashedPassword: fields[3] as String,
      phone: fields[4] as String?,
      dob: fields[5] as DateTime?,
      createdAt: fields[6] as DateTime,
      age: fields[7] as int?,
      weight: fields[8] as double?,
      height: fields[9] as double?,
      bmi: fields[10] as double?,
      workoutsCount: fields[11] as int,
      weightLost: fields[12] as double,
      caloriesPerDay: fields[13] as int,
    );
  }

  @override
  void write(BinaryWriter writer, UserHiveModel obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.fullName)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.hashedPassword)
      ..writeByte(4)
      ..write(obj.phone)
      ..writeByte(5)
      ..write(obj.dob)
      ..writeByte(6)
      ..write(obj.createdAt)
      ..writeByte(7)
      ..write(obj.age)
      ..writeByte(8)
      ..write(obj.weight)
      ..writeByte(9)
      ..write(obj.height)
      ..writeByte(10)
      ..write(obj.bmi)
      ..writeByte(11)
      ..write(obj.workoutsCount)
      ..writeByte(12)
      ..write(obj.weightLost)
      ..writeByte(13)
      ..write(obj.caloriesPerDay);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
