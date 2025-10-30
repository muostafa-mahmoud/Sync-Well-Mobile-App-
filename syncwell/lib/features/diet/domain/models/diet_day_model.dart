// lib/features/diet/domain/models/diet_day_model.dart
import 'package:hive/hive.dart';
import 'meal_model.dart';

@HiveType(typeId: 3)
class DietDayModel extends HiveObject {
  @HiveField(0)
  DateTime date;
  @HiveField(1)
  int targetCalories;
  @HiveField(2)
  List<MealModel> breakfast;
  @HiveField(3)
  List<MealModel> lunch;
  @HiveField(4)
  List<MealModel> dinner;
  @HiveField(5)
  List<MealModel> snacks;

  DietDayModel({
    required this.date,
    required this.targetCalories,
    this.breakfast = const [],
    this.lunch = const [],
    this.dinner = const [],
    this.snacks = const [],
  });

  int get consumed =>
      [...breakfast, ...lunch, ...dinner, ...snacks].fold(0, (a, b) => a + b.calories);
  int get remaining => targetCalories - consumed;
}

class DietDayModelAdapter extends TypeAdapter<DietDayModel> {
  @override
  final int typeId = 3;

  @override
  DietDayModel read(BinaryReader reader) {
    return DietDayModel(
      date: DateTime.fromMillisecondsSinceEpoch(reader.readInt()),
      targetCalories: reader.readInt(),
      breakfast: (reader.readList().cast<MealModel>()),
      lunch: (reader.readList().cast<MealModel>()),
      dinner: (reader.readList().cast<MealModel>()),
      snacks: (reader.readList().cast<MealModel>()),
    );
  }

  @override
  void write(BinaryWriter writer, DietDayModel obj) {
    writer
      ..writeInt(obj.date.millisecondsSinceEpoch)
      ..writeInt(obj.targetCalories)
      ..writeList(obj.breakfast)
      ..writeList(obj.lunch)
      ..writeList(obj.dinner)
      ..writeList(obj.snacks);
  }
}
