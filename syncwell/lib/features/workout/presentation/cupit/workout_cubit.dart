// lib/features/workout/presentation/cubit/workout_cubit.dart
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/workout_repository.dart';
import '../../domain/models/workout_day_model.dart';

class WorkoutState extends Equatable {
  final WorkoutDayModel? day;
  final bool loading;
  const WorkoutState({this.day, this.loading = false});
  WorkoutState copyWith({WorkoutDayModel? day, bool? loading}) =>
      WorkoutState(day: day ?? this.day, loading: loading ?? this.loading);
  @override
  List<Object?> get props => [day, loading];
}

class WorkoutCubit extends Cubit<WorkoutState> {
  final WorkoutRepository repo;
  WorkoutCubit(this.repo) : super(const WorkoutState());

  void load() => emit(WorkoutState(day: repo.loadToday()));

  Future<void> startExercise() async {
    final current = state.day!;
    await repo.markExerciseDone(current);
    emit(state.copyWith(day: current));
  }
}
