// lib/features/diet/presentation/widgets/meal_tile.dart
import 'package:flutter/material.dart';
import '../../domain/models/meal_model.dart';

class MealTile extends StatelessWidget {
  final String title;
  final List<MealModel> meals;
  final int totalKcal;

  const MealTile({super.key, required this.title, required this.meals, required this.totalKcal});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.w700)),
              Text('$totalKcal kcal'),
            ],
          ),
          const SizedBox(height: 8),
          for (final meal in meals) Text('• ${meal.title}'),
        ]),
      ),
    );
  }
}
