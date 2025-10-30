import 'package:hive/hive.dart';
import 'package:syncwell/core/dp/boxes.dart';
import '../domain/models/workout_day_model.dart';
import '../domain/models/exercise_model.dart';

class WorkoutRepository {
  final Box<WorkoutDayModel> _box = Hive.box<WorkoutDayModel>(Boxes.workoutBox);

  /// Load today's workout plan.
  /// If none exists in Hive, seed with a default plan.
  WorkoutDayModel loadToday() {
    final todayKey = _dateKey(DateTime.now());

    // Try to find an existing workout for today
    final existing = _box.values.firstWhere(
      (d) => _dateKey(d.date) == todayKey,
      orElse: () => _seedDefault(),
    );

    // If it's already in Hive, return it
    if (existing.isInBox) return existing;

    // Otherwise, add the seeded default to Hive
    _box.add(existing);
    return existing;
  }

  /// Mark one more exercise as completed
  Future<void> markExerciseDone(WorkoutDayModel day) async {
    day.completedCount = (day.completedCount + 1).clamp(0, day.totalExercises);
    await day.save();
  }

  /// Reset progress for today (optional helper)
  Future<void> resetProgress(WorkoutDayModel day) async {
    day.completedCount = 0;
    await day.save();
  }

  /// Seed a default workout plan
  WorkoutDayModel _seedDefault() {
    return WorkoutDayModel(
      date: DateTime.now(),
      exercises: [
        ExerciseModel(name: 'Running', durationMin: 30, calories: 300),
        ExerciseModel(name: 'Push-ups', durationMin: 15, calories: 25),
        ExerciseModel(name: 'Plank', durationMin: 5, calories: 20),
      ],
    );
  }

  String _dateKey(DateTime d) => '${d.year}-${d.month}-${d.day}';
}
