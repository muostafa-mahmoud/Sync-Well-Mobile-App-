// lib/features/dashboard/presentation/pages/dashboard_page.dart
import 'package:flutter/material.dart';
import '../../../../core/app/theme.dart';

class DashboardPage extends StatelessWidget {
  final Function(int) onNavTap;
  const DashboardPage({super.key, required this.onNavTap});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            Text("Today's Calories",
                style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 8),
            LinearProgressIndicator(
              value: 1720 / 2500,
              minHeight: 10,
              color: AppColors.primaryGreen,
              backgroundColor: Colors.grey[800],
            ),
            const SizedBox(height: 8),
            const Text("1720 kcal consumed of 2500 kcal goal"),
            const Text("780 kcal remaining"),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _metricCard("BMI", "22.5"),
                _metricCard("Steps", "7,542"),
                _metricCard("Weight", "75 kg"),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.accentBlue),
                    onPressed: () {},
                    child: const Text('BMI Calculator'),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryGreen),
                    onPressed: () => onNavTap(2),
                    child: const Text('Diet Plan'),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange),
                    onPressed: () => onNavTap(1),
                    child: const Text('Workout'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text('Daily Tip',
                style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 6),
            const Text(
                'Drink water before meals to help with digestion and portion control.'),
          ],
        ),
      ),
    );
  }

  Widget _metricCard(String label, String value) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.cardBg,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(color: Colors.grey)),
          const SizedBox(height: 4),
          Text(value,
              style:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
