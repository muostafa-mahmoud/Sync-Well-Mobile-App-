/// User Entity - Lightweight data class for UI use
/// This is converted from UserHiveModel for use in the presentation layer
class User {
  final String id;
  final String fullName;
  final String email;
  final String? phone;
  final DateTime? dob;
  final int? age;
  final double? weight;
  final double? height;
  final double? bmi;
  final int workoutsCount;
  final double weightLost;
  final int caloriesPerDay;

  User({
    required this.id,
    required this.fullName,
    required this.email,
    this.phone,
    this.dob,
    this.age,
    this.weight,
    this.height,
    this.bmi,
    this.workoutsCount = 0,
    this.weightLost = 0,
    this.caloriesPerDay = 2000,
  });

  factory User.fromMap(Map<String, dynamic> data, String id) {
    final rawDob = data['dob'];
    DateTime? parsedDob;
    if (rawDob is DateTime) {
      parsedDob = rawDob;
    } else if (rawDob is String) {
      parsedDob = DateTime.tryParse(rawDob);
    }
    return User(
      id: id,
      email: data['email'] ?? '',
      fullName: data['fullName'] ?? '',
      phone: data['phone'],
      dob: parsedDob,
      age: data['age'],
      weight: data['weight']?.toDouble(),
      height: data['height']?.toDouble(),
      bmi: data['bmi']?.toDouble(),
      workoutsCount: data['workoutsCount'] ?? 0,
      weightLost: data['weightLost']?.toDouble() ?? 0,
      caloriesPerDay: data['caloriesPerDay'] ?? 2000,
    );
  }
}
