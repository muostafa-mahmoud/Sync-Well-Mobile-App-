// lib/features/profile/presentation/pages/profile_page.dart
import 'package:flutter/material.dart';
import '../../../../core/app/theme.dart';

class ProfilePage extends StatelessWidget {
  final Function(int) onNavTap;
  const ProfilePage({super.key, required this.onNavTap});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(height: 20),
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/profile.jpg'),
            ),
            const SizedBox(height: 12),
            const Text('Alex Johnson',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const Text('alex.johnson@email.com',
                style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 24),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                children: [
                  _statCard('Age', '28 years'),
                  _statCard('Weight', '75 kg'),
                  _statCard('Height', '175 cm'),
                  _statCard('BMI', '22.5'),
                  _statCard('Workouts', '124'),
                  _statCard('Weight Lost', '5.2 kg'),
                  _statCard('Calories/Day', '1700'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _statCard(String label, String value) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.cardBg,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(label, style: const TextStyle(color: Colors.grey)),
          const SizedBox(height: 6),
          Text(value,
              style:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
