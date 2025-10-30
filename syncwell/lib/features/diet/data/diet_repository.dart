// lib/features/diet/data/diet_repository.dart
import 'package:hive/hive.dart';
import 'package:syncwell/core/dp/boxes.dart';
import '../domain/models/diet_day_model.dart';
import '../domain/models/meal_model.dart';
import 'diet_api_service.dart';

class DietRepository {
  final Box<DietDayModel> _box = Hive.box<DietDayModel>(Boxes.dietBox);
  final DietApiService api;
  DietRepository(this.api);

  Future<DietDayModel> loadToday({int defaultTarget = 2500}) async {
    try {
      final remote = await api.fetchTodayDiet();
      await _cache(remote);
      return remote;
    } catch (_) {
      if (_box.isNotEmpty) return _box.getAt(0)!;
      final local = DietDayModel(date: DateTime.now(), targetCalories: defaultTarget);
      await _box.add(local);
      return local;
    }
  }

  Future<void> addBreakfastMeal(MealModel meal, DietDayModel day) async {
    day.breakfast = [...day.breakfast, meal];
    await day.save();
  }

  Future<void> _cache(DietDayModel day) async {
    if (_box.isEmpty) {
      await _box.add(day);
    } else {
      await _box.putAt(0, day);
    }
  }
}
