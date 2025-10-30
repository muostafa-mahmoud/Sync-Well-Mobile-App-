import 'package:hive/hive.dart';

part 'user_hive_model.g.dart';

@HiveType(typeId: 10) // Changed from 0 to 10 to avoid conflict with UserModel
class UserHiveModel extends HiveObject {
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

  UserHiveModel({
    required this.id,
    required this.fullName,
    required this.email,
    required this.hashedPassword,
    this.phone,
    this.dob,
    required this.createdAt,
  });

  // Convert to the app's User model for use in UI
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'fullName': fullName,
      'email': email,
      'phone': phone,
      'dob': dob?.toIso8601String(),
      'createdAt': createdAt.toIso8601String(),
    };
  }

  @override
  String toString() {
    return 'UserHiveModel(id: $id, fullName: $fullName, email: $email)';
  }
}
