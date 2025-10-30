// lib/features/diet/domain/models/meal_model.dart
import 'package:hive/hive.dart';

@HiveType(typeId: 2)
class MealModel extends HiveObject {
  @HiveField(0)
  String title;
  @HiveField(1)
  int calories;

  MealModel({required this.title, required this.calories});
}

class MealModelAdapter extends TypeAdapter<MealModel> {
  @override
  final int typeId = 2;

  @override
  MealModel read(BinaryReader reader) {
    return MealModel(title: reader.readString(), calories: reader.readInt());
  }

  @override
  void write(BinaryWriter writer, MealModel obj) {
    writer..writeString(obj.title)..writeInt(obj.calories);
  }
}
