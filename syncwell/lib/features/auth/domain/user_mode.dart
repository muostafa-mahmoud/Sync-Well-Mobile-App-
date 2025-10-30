// lib/features/auth/domain/user_mode.dart
// Compatibility wrapper for the old UserModel
import 'package:hive/hive.dart';

part 'user_mode.g.dart';

@HiveType(typeId: 0)
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
