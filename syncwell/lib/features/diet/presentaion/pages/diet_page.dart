// lib/features/diet/presentation/pages/diet_page.dart
import 'package:flutter/material.dart';
import '../../../../core/app/theme.dart';

class DietPage extends StatelessWidget {
  final Function(int) onNavTap;
  const DietPage({super.key, required this.onNavTap});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            Text('Diet Plan',
                style: Theme.of(context).textTheme.headlineSmall),
            const Text('Track your nutrition.'),
            const SizedBox(height: 16),
            Text('Daily Target: 2500 kcal'),
            const SizedBox(height: 6),
            LinearProgressIndicator(
              value: 1700 / 2500,
              minHeight: 10,
              color: AppColors.primaryGreen,
              backgroundColor: Colors.grey[800],
            ),
            const SizedBox(height: 6),
            const Text('1700 kcal consumed, 800 kcal remaining'),
            const SizedBox(height: 16),
            _mealCard('Breakfast', 450, ['Oatmeal with Berries', 'Greek Yogurt']),
            _mealCard('Lunch', 650, ['Grilled Chicken Salad', 'Brown Rice']),
            _mealCard('Dinner', 0, []),
            _mealCard('Snacks', 0, []),
          ],
        ),
      ),
    );
  }

  Widget _mealCard(String title, int kcal, List<String> items) {
    return Card(
      color: AppColors.cardBg,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
              Text('$kcal kcal'),
            ],
          ),
          const SizedBox(height: 8),
          if (items.isEmpty)
            const Text('No items added')
          else
            for (final item in items) Text('• $item'),
        ]),
      ),
    );
  }
}
