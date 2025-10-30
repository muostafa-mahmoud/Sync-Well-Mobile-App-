import 'package:hive/hive.dart';

@HiveType(typeId: 4)
class ExerciseModel extends HiveObject {
  @HiveField(0)
  String name;
  @HiveField(1)
  int durationMin;
  @HiveField(2)
  int calories;

  ExerciseModel({
    required this.name,
    required this.durationMin,
    required this.calories,
  });
}

class ExerciseModelAdapter extends TypeAdapter<ExerciseModel> {
  @override
  final int typeId = 4;

  @override
  ExerciseModel read(BinaryReader reader) {
    return ExerciseModel(
      name: reader.readString(),
      durationMin: reader.readInt(),
      calories: reader.readInt(),
    );
  }

  @override
  void write(BinaryWriter writer, ExerciseModel obj) {
    writer
      ..writeString(obj.name)
      ..writeInt(obj.durationMin)
      ..writeInt(obj.calories);
  }
}
