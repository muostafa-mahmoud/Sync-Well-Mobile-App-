import 'package:flutter/material.dart';
import 'package:syncwell/features/dashboard/persentaion/pages/dashboard_page.dart';
import 'package:syncwell/features/diet/presentaion/pages/diet_page.dart';
import 'package:syncwell/features/profile/peresentation/pages/profile_page.dart';
import 'package:syncwell/features/widgets/nav_bottom/bottom_nav.dart';

import 'workout/presentation/pages/workout_page.dart';


class MainShell extends StatefulWidget {
  const MainShell({super.key});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    final pages = [
      DashboardPage(onNavTap: _onTap),
      WorkoutPage(onNavTap: _onTap),
      DietPage(onNavTap: _onTap),
      ProfilePage(onNavTap: _onTap),
    ];

    return Scaffold(
      body: pages[_index],
      bottomNavigationBar: BottomNav(currentIndex: _index, onTap: _onTap),
    );
  }

  void _onTap(int i) => setState(() => _index = i);
}
