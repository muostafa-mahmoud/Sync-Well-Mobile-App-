// lib/features/auth/domain/user_mode.dart
import 'package:hive/hive.dart';


@HiveType(typeId: 0)
class UserModel extends HiveObject {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String email;

  @HiveField(2)
  final int age;

  @HiveField(3)
  final double weight;

  @HiveField(4)
  final double height;

  @HiveField(5)
  final double bmi;

  @HiveField(6)
  final int workouts;

  @HiveField(7)
  final double weightLost;

  @HiveField(8)
  final int caloriesPerDay;

  UserModel({
    required this.name,
    required this.email,
    required this.age,
    required this.weight,
    required this.height,
    required this.bmi,
    required this.workouts,
    required this.weightLost,
    required this.caloriesPerDay,
  });
}
