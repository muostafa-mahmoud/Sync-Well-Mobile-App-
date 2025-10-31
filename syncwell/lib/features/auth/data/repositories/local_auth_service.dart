import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../../../core/local/models/user_hive_model.dart';
import '../../domain/entities/user.dart';

class LocalAuthService {
  static const String _usersBoxName = 'users';
  static const String _currentUserBoxName = 'current_user';
  static const String _currentUserKey = 'current_user_id';

  // Get the users box
  Box<UserHiveModel> get _usersBox => Hive.box<UserHiveModel>(_usersBoxName);

  // Get the current user box (stores the logged-in user ID)
  Box get _currentUserBox => Hive.box(_currentUserBoxName);

  /// Hash password using SHA-256
  String _hashPassword(String password) {
    final bytes = utf8.encode(password);
    final hash = sha256.convert(bytes);
    return hash.toString();
  }

  /// Generate a unique user ID
  String _generateUserId() {
    return DateTime.now().millisecondsSinceEpoch.toString();
  }

  /// Sign up a new user
  Future<User> signUp({
    required String email,
    required String password,
    required String fullName,
    String? phone,
    DateTime? dob,
  }) async {
    // Check if user already exists
    final existingUser = _usersBox.values
        .where((user) => user.email.toLowerCase() == email.toLowerCase())
        .toList();

    if (existingUser.isNotEmpty) {
      throw Exception('User with this email already exists');
    }

    // Create new user
    final userId = _generateUserId();
    final hashedPassword = _hashPassword(password);

    final userHiveModel = UserHiveModel(
      id: userId,
      fullName: fullName,
      email: email.toLowerCase(),
      hashedPassword: hashedPassword,
      phone: phone,
      dob: dob,
      createdAt: DateTime.now(),
    );

    // Save to Hive
    await _usersBox.put(userId, userHiveModel);

    // Set as current user
    await _currentUserBox.put(_currentUserKey, userId);

    return User(
      id: userId,
      fullName: fullName,
      email: email,
      phone: phone,
      dob: dob,
    );
  }

  /// Login user
  Future<User> login({required String email, required String password}) async {
    // Find user by email
    UserHiveModel? userHiveModel;
    try {
      userHiveModel = _usersBox.values.firstWhere(
        (user) => user.email.toLowerCase() == email.toLowerCase(),
      );
    } catch (e) {
      throw Exception('No user found with this email');
    }

    // Verify password
    final hashedPassword = _hashPassword(password);
    if (userHiveModel.hashedPassword != hashedPassword) {
      throw Exception('Invalid password');
    }

    // Set as current user
    await _currentUserBox.put(_currentUserKey, userHiveModel.id);

    return User(
      id: userHiveModel.id,
      fullName: userHiveModel.fullName,
      email: userHiveModel.email,
      phone: userHiveModel.phone,
      dob: userHiveModel.dob,
    );
  }

  /// Sign out current user
  Future<void> signOut() async {
    await _currentUserBox.delete(_currentUserKey);
  }

  /// Get current logged-in user
  User? get currentUser {
    final userId = _currentUserBox.get(_currentUserKey);
    if (userId == null) return null;

    final userHiveModel = _usersBox.get(userId);
    if (userHiveModel == null) return null;

    return User(
      id: userHiveModel.id,
      fullName: userHiveModel.fullName,
      email: userHiveModel.email,
      phone: userHiveModel.phone,
      dob: userHiveModel.dob,
      age: userHiveModel.age,
      weight: userHiveModel.weight,
      height: userHiveModel.height,
      bmi: userHiveModel.bmi,
      workoutsCount: userHiveModel.workoutsCount,
      weightLost: userHiveModel.weightLost,
      caloriesPerDay: userHiveModel.caloriesPerDay,
    );
  }

  /// Check if user is logged in
  bool get isLoggedIn {
    return _currentUserBox.get(_currentUserKey) != null;
  }

  /// Load current user profile
  Future<User?> loadCurrentUserProfile() async {
    return currentUser;
  }

  /// Get user profile by ID
  Future<User?> getUserProfile(String uid) async {
    final userHiveModel = _usersBox.get(uid);
    if (userHiveModel == null) return null;

    return User(
      id: userHiveModel.id,
      fullName: userHiveModel.fullName,
      email: userHiveModel.email,
      phone: userHiveModel.phone,
      dob: userHiveModel.dob,
      age: userHiveModel.age,
      weight: userHiveModel.weight,
      height: userHiveModel.height,
      bmi: userHiveModel.bmi,
      workoutsCount: userHiveModel.workoutsCount,
      weightLost: userHiveModel.weightLost,
      caloriesPerDay: userHiveModel.caloriesPerDay,
    );
  }

  /// Update user profile
  Future<void> updateUserProfile({
    required String uid,
    String? fullName,
    String? phone,
    DateTime? dob,
  }) async {
    final userHiveModel = _usersBox.get(uid);
    if (userHiveModel == null) {
      throw Exception('User not found');
    }

    if (fullName != null) userHiveModel.fullName = fullName;
    if (phone != null) userHiveModel.phone = phone;
    if (dob != null) userHiveModel.dob = dob;

    await userHiveModel.save();
  }

  /// Update fitness profile data
  Future<void> updateFitnessProfile({
    required String uid,
    int? age,
    double? weight,
    double? height,
    int? workoutsCount,
    double? weightLost,
    int? caloriesPerDay,
  }) async {
    final userHiveModel = _usersBox.get(uid);
    if (userHiveModel == null) {
      throw Exception('User not found');
    }

    userHiveModel.updateFitnessProfile(
      age: age,
      weight: weight,
      height: height,
      workoutsCount: workoutsCount,
      weightLost: weightLost,
      caloriesPerDay: caloriesPerDay,
    );

    await userHiveModel.save();
  }

  /// Delete current user account
  Future<void> deleteAccount() async {
    final userId = _currentUserBox.get(_currentUserKey);
    if (userId != null) {
      await _usersBox.delete(userId);
      await _currentUserBox.delete(_currentUserKey);
    }
  }

  /// Send password reset (local implementation - just changes password)
  Future<void> sendPasswordResetEmail(String email) async {
    // For local auth, we can't send emails
    // This is a placeholder that just validates the email exists
    final userExists = _usersBox.values.any(
      (user) => user.email.toLowerCase() == email.toLowerCase(),
    );

    if (!userExists) {
      throw Exception('No user found with this email');
    }

    // In a real local app, you might want to implement a different password reset flow
    throw Exception(
      'Password reset is not available for local accounts. Please contact support.',
    );
  }

  /// Reset password (for local use - requires old password)
  Future<void> resetPassword({
    required String email,
    required String oldPassword,
    required String newPassword,
  }) async {
    UserHiveModel? userHiveModel;
    try {
      userHiveModel = _usersBox.values.firstWhere(
        (user) => user.email.toLowerCase() == email.toLowerCase(),
      );
    } catch (e) {
      throw Exception('No user found with this email');
    }

    // Verify old password
    final hashedOldPassword = _hashPassword(oldPassword);
    if (userHiveModel.hashedPassword != hashedOldPassword) {
      throw Exception('Invalid old password');
    }

    // Update to new password
    userHiveModel.hashedPassword = _hashPassword(newPassword);
    await userHiveModel.save();
  }
}
