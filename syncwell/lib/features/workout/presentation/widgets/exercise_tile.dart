// lib/features/workout/presentation/widgets/exercise_tile.dart
import 'package:flutter/material.dart';
import '../../domain/models/exercise_model.dart';

class ExerciseTile extends StatelessWidget {
  final ExerciseModel exercise;
  final VoidCallback onStart;
  const ExerciseTile({super.key, required this.exercise, required this.onStart});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(exercise.name),
        subtitle: Text('${exercise.durationMin} min • ${exercise.calories} kcal'),
        trailing: ElevatedButton(onPressed: onStart, child: const Text('Start')),
      ),
    );
  }
}
