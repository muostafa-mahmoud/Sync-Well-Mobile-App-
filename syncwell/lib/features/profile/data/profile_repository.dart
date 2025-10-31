// lib/features/profile/data/profile_repository.dart
import '../../auth/data/auth_repository.dart';
import '../../auth/domain/entities/user.dart';

class ProfileRepository {
  final AuthRepository authRepository;

  ProfileRepository(this.authRepository);

  User? get currentUser => authRepository.currentUser;

  Future<void> updateFitnessProfile({
    int? age,
    double? weight,
    double? height,
    int? workoutsCount,
    double? weightLost,
    int? caloriesPerDay,
  }) async {
    await authRepository.updateFitnessProfile(
      age: age,
      weight: weight,
      height: height,
      workoutsCount: workoutsCount,
      weightLost: weightLost,
      caloriesPerDay: caloriesPerDay,
    );
  }
}
