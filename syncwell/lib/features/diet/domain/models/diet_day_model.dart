import 'package:hive/hive.dart';
import 'package:syncwell/features/diet/domain/models/meal_model.dart';
import 'nutritions.dart';

part 'diet_day_model.g.dart';

@HiveType(typeId: 2) // كل موديل له typeId مختلف
class MealsModel extends HiveObject {
  @HiveField(0)
  List<MealsSection> meals;

  @HiveField(1)
  Nutritions nutritions;

  MealsModel({required this.meals, required this.nutritions});

  // toJson
  Map<String, dynamic> toJson() {
    return {
      'meals': meals.map((e) => e.toJson()).toList(),
      'nutritions': nutritions.toJson(),
    };
  }

  // fromJson
  factory MealsModel.fromJson(Map<String, dynamic> json) {
    var mealsJson = json['meals'] as List<dynamic>?; // nullable
    List<MealsSection> mealsList = mealsJson != null
        ? mealsJson.map((item) => MealsSection.fromJson(item)).toList()
        : [];

    var nutritionsJson = json['nutritions'] as Map<String, dynamic>?;

    return MealsModel(
      meals: mealsList,
      nutritions: nutritionsJson != null
          ? Nutritions.fromJson(nutritionsJson)
          : Nutritions(calories: 0, protein: 0, fat: 0, carbohydrates: 0),
    );
  }
}
