import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncwell/features/diet/presentaion/cubit/diet_state.dart';
import '../cubit/diet_cubit.dart';
import '../widgets/meal_tile.dart';
import '../widgets/nutrition_section.dart';

class DietPage extends StatelessWidget {
  final Function(int) onNavTap;

  const DietPage({super.key, required this.onNavTap});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DietCubit, DietState>(
      builder: (context, state) {
        if (state is MealsLoaded) {
          final meals = state.mealsModel.meals;
          final nutritions = state.mealsModel.nutritions;

          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              const Text(
                'Diet Plan',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),

              NutritionSection(nutritions: nutritions),

              const SizedBox(height: 16),
              const Text(
                'Meals',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),

              for (var meal in meals) MealTile(meal: meal),

              const SizedBox(height: 16),

              // Example: Navigate using onNavTap
              ElevatedButton(
                onPressed: () => onNavTap(1), // navigate to tab 1 for example
                child: const Text('Go to Workout Page'),
              ),
            ],
          );
        } else if (state is MealsLoadFeild) {
          return Center(child: Text(state.massageError));
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
