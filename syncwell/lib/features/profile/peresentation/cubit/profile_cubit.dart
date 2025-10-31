// lib/features/profile/presentation/cubit/profile_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncwell/features/profile/data/profile_repository.dart';
import 'package:syncwell/features/auth/domain/entities/user.dart';

class ProfileCubit extends Cubit<User?> {
  final ProfileRepository repository;

  ProfileCubit(this.repository) : super(null);

  void loadProfile() {
    final user = repository.currentUser;
    emit(user);
  }

  Future<void> updateProfile({
    int? age,
    double? weight,
    double? height,
    int? workoutsCount,
    double? weightLost,
    int? caloriesPerDay,
  }) async {
    await repository.updateFitnessProfile(
      age: age,
      weight: weight,
      height: height,
      workoutsCount: workoutsCount,
      weightLost: weightLost,
      caloriesPerDay: caloriesPerDay,
    );
    loadProfile(); // Reload to get updated data
  }
}
