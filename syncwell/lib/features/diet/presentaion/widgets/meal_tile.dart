import 'package:flutter/material.dart';
import '../../domain/models/meal_model.dart';

class MealTile extends StatelessWidget {
  final MealsSection meal;

  const MealTile({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Image.network(
          'https://spoonacular.com/recipeImages/${meal.image}',
          width: 60,
          height: 60,
          fit: BoxFit.cover,
        ),
        title: Text(
          meal.title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          '${meal.readyInMinutes} mins | Servings: ${meal.servings}',
        ),
        onTap: () {
          // Open the recipe URL in browser
        },
      ),
    );
  }
}
