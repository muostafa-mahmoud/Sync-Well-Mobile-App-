// lib/core/utils/validators.dart
class Validators {
  static String? required(String? v, {String label = 'This field'}) {
    if (v == null || v.trim().isEmpty) return '$label is required';
    return null;
  }

  static String? email(String? v) {
    if (v == null || v.trim().isEmpty) return 'Email is required';
    final r = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');
    if (!r.hasMatch(v.trim())) return 'Invalid email';
    return null;
  }

  static String? minLength(String? v, int min, {String label = 'This field'}) {
    if (v == null || v.length < min) return '$label must be at least $min characters';
    return null;
  }
}
