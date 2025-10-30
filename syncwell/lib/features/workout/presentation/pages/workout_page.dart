// lib/features/workout/presentation/pages/workout_page.dart
import 'package:flutter/material.dart';
import '../../../../core/app/theme.dart';

class WorkoutPage extends StatelessWidget {
  final Function(int) onNavTap;
  const WorkoutPage({super.key, required this.onNavTap});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            Text('Workout Plan',
                style: Theme.of(context).textTheme.headlineSmall),
            const Text('Build your strength.'),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _chip('45 Minutes'),
                _chip('320 Calories'),
                _chip('3/5 Exercises'),
              ],
            ),
            const SizedBox(height: 12),
            LinearProgressIndicator(
              value: 3 / 5,
              minHeight: 10,
              color: AppColors.primaryGreen,
              backgroundColor: Colors.grey[800],
            ),
            const SizedBox(height: 16),
            const Text("Today's Exercises",
                style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            _exerciseTile('Running', '30 min • 300 kcal'),
            _exerciseTile('Push-ups', '15 min • 25 kcal'),
          ],
        ),
      ),
    );
  }

  Widget _chip(String text) =>
      Chip(label: Text(text), backgroundColor: AppColors.cardBg);

  Widget _exerciseTile(String title, String subtitle) {
    return Card(
      color: AppColors.cardBg,
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: ElevatedButton(
          onPressed: () {},
          child: const Text('Start'),
        ),
      ),
    );
  }
}
