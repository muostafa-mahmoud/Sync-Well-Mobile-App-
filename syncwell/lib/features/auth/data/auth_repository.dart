// lib/features/auth/data/auth_repository.dart
// Repository wrapper for LocalAuthService - provides access to user data
import '../data/repositories/local_auth_service.dart';
import '../domain/entities/user.dart';

class AuthRepository {
  final LocalAuthService _authService;

  AuthRepository(this._authService);

  User? get currentUser => _authService.currentUser;

  bool get isLoggedIn => _authService.isLoggedIn;

  Future<void> updateFitnessProfile({
    int? age,
    double? weight,
    double? height,
    int? workoutsCount,
    double? weightLost,
    int? caloriesPerDay,
  }) async {
    final user = currentUser;
    if (user == null) throw Exception('No user logged in');

    await _authService.updateFitnessProfile(
      uid: user.id,
      age: age,
      weight: weight,
      height: height,
      workoutsCount: workoutsCount,
      weightLost: weightLost,
      caloriesPerDay: caloriesPerDay,
    );
  }
}
