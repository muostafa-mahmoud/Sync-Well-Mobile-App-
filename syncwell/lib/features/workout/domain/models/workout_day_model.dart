import 'package:hive/hive.dart';
import 'exercise_model.dart';

@HiveType(typeId: 5)
class WorkoutDayModel extends HiveObject {
  @HiveField(0)
  DateTime date;
  @HiveField(1)
  List<ExerciseModel> exercises;
  @HiveField(2)
  int completedCount;

  WorkoutDayModel({
    required this.date,
    this.exercises = const [],
    this.completedCount = 0,
  });

  int get totalDuration => exercises.fold(0, (a, b) => a + b.durationMin);
  int get totalCalories => exercises.fold(0, (a, b) => a + b.calories);
  int get totalExercises => exercises.length;
}

class WorkoutDayModelAdapter extends TypeAdapter<WorkoutDayModel> {
  @override
  final int typeId = 5;

  @override
  WorkoutDayModel read(BinaryReader reader) {
    return WorkoutDayModel(
      date: DateTime.fromMillisecondsSinceEpoch(reader.readInt()),
      exercises: reader.readList().cast<ExerciseModel>(),
      completedCount: reader.readInt(),
    );
  }

  @override
  void write(BinaryWriter writer, WorkoutDayModel obj) {
    writer
      ..writeInt(obj.date.millisecondsSinceEpoch)
      ..writeList(obj.exercises)
      ..writeInt(obj.completedCount);
  }
}
