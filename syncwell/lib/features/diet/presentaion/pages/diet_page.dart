import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/diet_cubit.dart';
import '../cubit/diet_state.dart';
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

              // Nutrition Section
              NutritionSection(nutritions: nutritions),

              const SizedBox(height: 16),
              const Text(
                'Meals',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),

              // Display all meals in a scrollable list
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: meals.length,
                itemBuilder: (context, index) {
                  return MealTile(meal: meals[index]);
                },
              ),

              const SizedBox(height: 16),

              // Example navigation button
              ElevatedButton(
                onPressed: () => onNavTap(1),
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
