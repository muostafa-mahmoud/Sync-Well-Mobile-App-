// lib/core/db/hive_init.dart
import 'package:hive/hive.dart';
import 'package:syncwell/features/diet/domain/models/nutritions.dart';
import '../../features/diet/domain/models/meal_model.dart';
import '../../features/diet/domain/models/diet_day_model.dart';
import '../../features/workout/domain/models/exercise_model.dart';
import '../../features/workout/domain/models/workout_day_model.dart';
import 'boxes.dart';

Future<void> initHiveAdaptersAndBoxes() async {
  // Note: UserHiveModel is already registered in main.dart
  Hive.registerAdapter(MealsModelAdapter());
  Hive.registerAdapter(MealsSectionAdapter());
  Hive.registerAdapter(NutritionsAdapter());
  Hive.registerAdapter(ExerciseModelAdapter());
  Hive.registerAdapter(WorkoutDayModelAdapter());

  await Hive.openBox<MealsModel>(Boxes.dietBox);
  await Hive.openBox<WorkoutDayModel>(Boxes.workoutBox);
}
