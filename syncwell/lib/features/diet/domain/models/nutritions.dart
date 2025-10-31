import 'package:hive/hive.dart';

part 'nutritions.g.dart'; // لازم يكون هنا

@HiveType(typeId: 2)
class Nutritions extends HiveObject {
  @HiveField(0)
  double calories;

  @HiveField(1)
  double protein;

  @HiveField(2)
  double fat;

  @HiveField(3)
  double carbohydrates;

  Nutritions({
    required this.calories,
    required this.protein,
    required this.fat,
    required this.carbohydrates,
  });

  // toJson
  Map<String, double> toJson() {
    return {
      'calories': calories,
      'protein': protein,
      'fat': fat,
      'carbohydrates': carbohydrates,
    };
  }

  // fromJson
  factory Nutritions.fromJson(Map<String, dynamic> json) {
    return Nutritions(
      calories: (json['calories'] ?? 0).toDouble(),
      protein: (json['protein'] ?? 0).toDouble(),
      fat: (json['fat'] ?? 0).toDouble(),
      carbohydrates: (json['carbohydrates'] ?? 0).toDouble(),
    );
  }
}
