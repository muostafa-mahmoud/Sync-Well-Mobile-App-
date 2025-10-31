import 'package:hive/hive.dart';
import 'package:syncwell/features/diet/domain/models/diet_day_model.dart';
import 'package:syncwell/features/diet/services.dart';
import 'package:syncwell/core/dp/boxes.dart';

class DietRepository {
  final DioServices dioServices;

  DietRepository(this.dioServices);

  Box<MealsModel> get _mealsBox => Hive.box<MealsModel>(Boxes.dietBox);

  /// Load today's meals from cache or API
  Future<MealsModel?> loadToday({int defaultTarget = 2000}) async {
    // Try to load from cache first
    final cached = _mealsBox.get('today_meals');
    if (cached != null) {
      return cached;
    }

    // If not cached, fetch from API
    try {
      final meals = await dioServices.getMeals(defaultTarget.toDouble());
      if (meals != null) {
        await _mealsBox.put('today_meals', meals);
      }
      return meals;
    } catch (e) {
      print('Error loading meals: $e');
      return null;
    }
  }

  /// Fetch fresh meals from API
  Future<MealsModel?> fetchMeals(double targetCalories) async {
    try {
      final meals = await dioServices.getMeals(targetCalories);
      if (meals != null) {
        await _mealsBox.put('today_meals', meals);
      }
      return meals;
    } catch (e) {
      print('Error fetching meals: $e');
      return null;
    }
  }

  /// Get cached meals
  MealsModel? getCachedMeals() {
    return _mealsBox.get('today_meals');
  }

  /// Clear cached meals
  Future<void> clearCache() async {
    await _mealsBox.delete('today_meals');
  }
}
