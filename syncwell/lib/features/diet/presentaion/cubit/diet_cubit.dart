// lib/features/diet/presentation/cubit/diet_cubit.dart
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/diet_repository.dart';
import '../../domain/models/diet_day_model.dart';
import '../../domain/models/meal_model.dart';

class DietState extends Equatable {
  final DietDayModel? day;
  final bool loading;
  final String? error;
  const DietState({this.day, this.loading = false, this.error});
  DietState copyWith({DietDayModel? day, bool? loading, String? error}) =>
      DietState(day: day ?? this.day, loading: loading ?? this.loading, error: error);
  @override
  List<Object?> get props => [day, loading, error];
}

class DietCubit extends Cubit<DietState> {
  final DietRepository repo;
  DietCubit(this.repo) : super(const DietState());

  Future<void> load() async {
    emit(state.copyWith(loading: true));
    try {
      final today = await repo.loadToday();
      emit(DietState(day: today, loading: false));
    } catch (e) {
      emit(DietState(loading: false, error: e.toString()));
    }
  }

  Future<void> addBreakfast(String title, int calories) async {
    final current = state.day!;
    await repo.addBreakfastMeal(MealModel(title: title, calories: calories), current);
    emit(state.copyWith(day: current));
  }
}
