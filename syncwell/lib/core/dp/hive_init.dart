// lib/core/db/hive_init.dart
import 'package:hive/hive.dart';
import 'package:syncwell/features/auth/domain/user_mode.dart';
import '../../features/diet/domain/models/meal_model.dart';
import '../../features/diet/domain/models/diet_day_model.dart';
import '../../features/workout/domain/models/exercise_model.dart';
import '../../features/workout/domain/models/workout_day_model.dart';
import 'boxes.dart';

Future<void> initHiveAdaptersAndBoxes() async {
  Hive.registerAdapter(UserModelAdapter());
  Hive.registerAdapter(MealsModel as TypeAdapter);
  Hive.registerAdapter(MealsSection as TypeAdapter);
  Hive.registerAdapter(ExerciseModelAdapter());
  Hive.registerAdapter(WorkoutDayModelAdapter());

  await Hive.openBox<UserModel>(Boxes.userBox);
  await Hive.openBox<MealsModel>(Boxes.dietBox);
  await Hive.openBox<WorkoutDayModel>(Boxes.workoutBox);
}
