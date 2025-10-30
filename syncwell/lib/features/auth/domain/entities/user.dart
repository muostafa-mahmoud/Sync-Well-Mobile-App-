class User {
  final String id;
  final String fullName;
  final String email;
  final String? phone;
  final DateTime? dob;

  User({
    required this.id,
    required this.fullName,
    required this.email,
    this.phone,
    this.dob,
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
      email: data['email'],
      fullName: data['fullName'],
      phone: data['phone'],
      dob: parsedDob,
    );
  }
}
