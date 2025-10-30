// lib/features/dashboard/presentation/cubit/dashboard_cubit.dart
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../auth/data/auth_repository.dart';
import '../../../diet/data/diet_repository.dart';
import '../../../workout/data/workout_repository.dart';

class DashboardState extends Equatable {
  final int consumedKcal;
  final int targetKcal;
  final int steps;
  final double bmi;
  final double weightKg;
  const DashboardState({
    required this.consumedKcal,
    required this.targetKcal,
    required this.steps,
    required this.bmi,
    required this.weightKg,
  });
  @override
  List<Object?> get props => [consumedKcal, targetKcal, steps, bmi, weightKg];
}

class DashboardCubit extends Cubit<DashboardState> {
  final AuthRepository authRepo;
  final DietRepository dietRepo;
  final WorkoutRepository workoutRepo;

  DashboardCubit(this.authRepo, this.dietRepo, this.workoutRepo)
      : super(const DashboardState(consumedKcal: 0, targetKcal: 0, steps: 0, bmi: 0, weightKg: 0));

  Future<void> load() async {
    final user = authRepo.currentUser;
    final diet = await dietRepo.loadToday(defaultTarget: user?.caloriesPerDay ?? 2500);
    emit(DashboardState(
      consumedKcal: diet.consumed,
      targetKcal: diet.targetCalories,
      steps: 7542,
      bmi: user?.bmi ?? 0,
      weightKg: user?.weightKg ?? 0,
    ));
  }
}
