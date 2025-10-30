// lib/features/diet/data/diet_api_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../domain/models/diet_day_model.dart';
import '../domain/models/meal_model.dart';

class DietApiService {
  final String baseUrl;
  DietApiService(this.baseUrl);

  Future<DietDayModel> fetchTodayDiet() async {
    final res = await http.get(Uri.parse('$baseUrl/diet/today'));
    if (res.statusCode != 200) {
      throw Exception('Failed to fetch diet: ${res.statusCode}');
    }
    final data = jsonDecode(res.body);
    return DietDayModel(
      date: DateTime.parse(data['date']),
      targetCalories: data['targetCalories'],
      breakfast: (data['breakfast'] as List)
          .map((m) => MealModel(title: m['title'], calories: m['calories']))
          .toList(),
      lunch: (data['lunch'] as List)
          .map((m) => MealModel(title: m['title'], calories: m['calories']))
          .toList(),
      dinner: (data['dinner'] as List)
          .map((m) => MealModel(title: m['title'], calories: m['calories']))
          .toList(),
      snacks: (data['snacks'] as List)
          .map((m) => MealModel(title: m['title'], calories: m['calories']))
          .toList(),
    );
  }
}
