import 'package:hive/hive.dart';

part 'user_hive_model.g.dart';

/// Unified User Model - Contains ALL user data (Auth + Profile + Fitness)
/// This is the SINGLE source of truth for user data in the app
@HiveType(typeId: 0)
class UserHiveModel extends HiveObject {
  // ========== AUTH DATA ==========
  @HiveField(0)
  String id;

  @HiveField(1)
  String fullName;

  @HiveField(2)
  String email;

  @HiveField(3)
  String hashedPassword;

  @HiveField(4)
  String? phone;

  @HiveField(5)
  DateTime? dob;

  @HiveField(6)
  DateTime createdAt;

  // ========== FITNESS PROFILE DATA ==========
  @HiveField(7)
  int? age;

  @HiveField(8)
  double? weight;

  @HiveField(9)
  double? height;

  @HiveField(10)
  double? bmi;

  @HiveField(11)
  int workoutsCount;

  @HiveField(12)
  double weightLost;

  @HiveField(13)
  int caloriesPerDay;

  UserHiveModel({
    required this.id,
    required this.fullName,
    required this.email,
    required this.hashedPassword,
    this.phone,
    this.dob,
    required this.createdAt,
    this.age,
    this.weight,
    this.height,
    this.bmi,
    this.workoutsCount = 0,
    this.weightLost = 0,
    this.caloriesPerDay = 2000,
  });

  // Calculate BMI from weight and height
  static double? calculateBMI(double? weight, double? height) {
    if (weight == null || height == null || height == 0) return null;
    return weight / ((height / 100) * (height / 100));
  }

  // Update BMI when weight or height changes
  void updateBMI() {
    bmi = calculateBMI(weight, height);
  }

  // Update fitness profile
  void updateFitnessProfile({
    int? age,
    double? weight,
    double? height,
    int? workoutsCount,
    double? weightLost,
    int? caloriesPerDay,
  }) {
    if (age != null) this.age = age;
    if (weight != null) this.weight = weight;
    if (height != null) this.height = height;
    if (workoutsCount != null) this.workoutsCount = workoutsCount;
    if (weightLost != null) this.weightLost = weightLost;
    if (caloriesPerDay != null) this.caloriesPerDay = caloriesPerDay;

    // Auto-update BMI if weight or height changed
    if (weight != null || height != null) {
      updateBMI();
    }
  }

  // Convert to Map for UI/API
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'fullName': fullName,
      'email': email,
      'phone': phone,
      'dob': dob?.toIso8601String(),
      'createdAt': createdAt.toIso8601String(),
      'age': age,
      'weight': weight,
      'height': height,
      'bmi': bmi,
      'workoutsCount': workoutsCount,
      'weightLost': weightLost,
      'caloriesPerDay': caloriesPerDay,
    };
  }

  @override
  String toString() {
    return 'UserHiveModel(id: $id, fullName: $fullName, email: $email, bmi: $bmi)';
  }
}
