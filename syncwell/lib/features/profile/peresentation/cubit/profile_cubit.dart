// lib/features/profile/presentation/cubit/profile_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncwell/features/auth/data/auth_repository.dart';
import 'package:syncwell/features/auth/domain/user_mode.dart';

class ProfileCubit extends Cubit<UserModel?> {
  final AuthRepository repository;

  ProfileCubit(this.repository) : super(null);

  void loadUser() {
    final user = repository.currentUser;
    if (user == null) {
      // Seed data if box is empty
      final newUser = UserModel(
        name: "Alex Johnson",
        email: "alex.johnson@email.com",
        age: 28,
        weight: 75,
        height: 175,
        bmi: 22.5,
        workoutsCount: 150,
        weightLost: 5.2,
        caloriesPerDay: 1700,
      );
      repository.saveUser(newUser);
      emit(newUser);
    } else {
      emit(user);
    }
  }
}
