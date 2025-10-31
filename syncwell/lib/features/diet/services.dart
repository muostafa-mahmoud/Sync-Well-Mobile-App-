import 'package:dio/dio.dart';
import 'package:syncwell/features/diet/domain/models/diet_day_model.dart';

class DioServices {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.spoonacular.com/',
      receiveTimeout: Duration(seconds: 5),
      connectTimeout: Duration(seconds: 5),
    ),
  );

  Future<MealsModel?> getMeals(double targetCalories) async {
    try {
      Response response = await dio.get(
        'mealplanner/generate', // endpoint فقط
        queryParameters: {
          'timeFrame': 'day',
          'targetCalories': targetCalories,
          'apiKey': '914848383f5841b48308d6e8937a6d24',
        },
      );

      if (response.data != null && response.data['meals'] != null) {
        return MealsModel.fromJson(response.data);
      } else {
        print('API returned null or meals key missing');
        return null;
      }
    } catch (e) {
      print('Error fetching meals: $e');
      return null;
    }
  }
}
