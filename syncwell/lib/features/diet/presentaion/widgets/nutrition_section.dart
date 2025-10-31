import 'package:flutter/material.dart';
import '../../domain/models/nutritions.dart';

class NutritionSection extends StatelessWidget {
  final Nutritions nutritions;

  const NutritionSection({super.key, required this.nutritions});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.green[50],
      margin: const EdgeInsets.symmetric(vertical: 16),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Nutrition Summary',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text('Calories: ${nutritions.calories.toStringAsFixed(0)} kcal'),
            Text('Protein: ${nutritions.protein} g'),
            Text('Fat: ${nutritions.fat} g'),
            Text('Carbohydrates: ${nutritions.carbohydrates} g'),
          ],
        ),
      ),
    );
  }
}
