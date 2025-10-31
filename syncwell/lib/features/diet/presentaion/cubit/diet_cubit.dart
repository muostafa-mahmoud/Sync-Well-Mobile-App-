import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hive/hive.dart';
import 'package:syncwell/features/diet/domain/models/diet_day_model.dart';
import 'package:syncwell/features/diet/presentaion/cubit/diet_state.dart';
import 'package:syncwell/features/diet/services.dart';
// يحتوي على حالات IntialStateDiet, MealsLoaded, MealsLoadFailed

class DietCubit extends Cubit<DietState> {
  final DioServices dioServices;
  final Box<MealsModel> mealsBox;

  DietCubit({required this.dioServices, required this.mealsBox})
    : super(IntialSttateDiet());

  Future<void> fetchMeals(double targetCalories) async {
    emit(IntialSttateDiet());
    try {
      final meals = await dioServices.getMeals(2000);
      if (meals != null) {
        // حفظ في Hive
        await mealsBox.put('today_meals', meals);
        emit(MealsLoaded(mealsModel: meals));
      } else {
        emit(MealsLoadFeild(massageError: 'API returned null'));
      }
    } catch (e) {
      emit(MealsLoadFeild(massageError: e.toString()));
    }
  }
}
