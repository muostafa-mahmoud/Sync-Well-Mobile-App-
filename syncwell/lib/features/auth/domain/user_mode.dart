// lib/features/auth/domain/models/user_model.dart
import 'package:hive/hive.dart';


@HiveType(typeId: 1)
class UserModel extends HiveObject {
  @HiveField(0)
  String name;
  @HiveField(1)
  String email;
  @HiveField(2)
  int age;
  @HiveField(3)
  double weight;
  @HiveField(4)
  double height;
  @HiveField(5)
  double bmi;
  @HiveField(6)
  int workoutsCount;
  @HiveField(7)
  double weightLost;
  @HiveField(8)
  int caloriesPerDay;
  @HiveField(9)

  UserModel({
    required this.name,
    required this.email,
    required this.age,
    required this.weight,
    required this.height,
    required this.bmi,
    required this.workoutsCount,
    required this.weightLost,
    required this.caloriesPerDay,
  });
}

// Manual adapter
class UserModelAdapter extends TypeAdapter<UserModel> {
  @override
  final int typeId = 1;

  @override
  UserModel read(BinaryReader reader) {
    return UserModel(
      name: reader.readString(),
      email: reader.readString(),
      age: reader.readInt(),
      weight: reader.readDouble(),
      height: reader.readDouble(),
      bmi: reader.readDouble(),
      workoutsCount: reader.readInt(),
      weightLost: reader.readDouble(),
    caloriesPerDay: reader.readInt(),
    );
  }

  @override
  void write(BinaryWriter writer, UserModel obj) {
    writer
      ..writeString(obj.name)
      ..writeString(obj.email)
      ..writeInt(obj.age)
      ..writeDouble(obj.weight)
      ..writeDouble(obj.height)
      ..writeDouble(obj.bmi)
      ..writeInt(obj.workoutsCount)
      ..writeDouble(obj. weightLost)
      ..writeInt(obj.caloriesPerDay);
  }
}
