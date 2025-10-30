// lib/features/profile/presentation/cubit/profile_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/profile_repository.dart';
import '../../domain/user_model.dart';

class ProfileCubit extends Cubit<UserModel?> {
  final ProfileRepository repository;

  ProfileCubit(this.repository) : super(null);

  void loadUser() {
    final user = repository.getUserProfile();
    if (user == null) {
      // Seed data if box is empty
      final newUser = UserModel(
        name: "Alex Johnson",
        email: "alex.johnson@email.com",
        age: 28,
        weight: 75,
        height: 175,
        bmi: 22.5,
        workouts: 124,
        weightLost: 5.2,
        caloriesPerDay: 1700,
      );
      repository.saveUserProfile(newUser);
      emit(newUser);
    } else {
      emit(user);
    }
  }
}
