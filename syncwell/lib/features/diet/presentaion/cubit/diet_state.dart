import 'package:syncwell/features/diet/domain/models/diet_day_model.dart';

class DietState {}

class IntialSttateDiet extends DietState {}

class MealsLoaded extends DietState {
  final MealsModel mealsModel;

  MealsLoaded({required this.mealsModel});
}

class MealsLoadFeild extends DietState {
  final String massageError;

  MealsLoadFeild({required this.massageError});
}
