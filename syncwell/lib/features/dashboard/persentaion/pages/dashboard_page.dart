
import 'package:flutter/material.dart';
import 'package:syncwell/features/dashboard/widgets/calories_card.dart';
import 'package:syncwell/features/dashboard/widgets/daily_tip_section.dart';
import 'package:syncwell/features/dashboard/widgets/header_section.dart';
import 'package:syncwell/features/dashboard/widgets/quick_access_section.dart';
import 'package:syncwell/features/dashboard/widgets/quick_stats_row.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key, required void Function(int i) onNavTap});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    final verticalSpacing = screenHeight * 0.02;

    double headerHeight = (screenHeight * 0.25).clamp(180, 250);

    return Scaffold(
      backgroundColor: const Color(0xFF1A1A1A),
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          HeaderSection(
            mainText: 'Good Morning 👋',
            subText: 'Alex Johnson',
          ),

          Padding(
            padding: EdgeInsets.only(top: headerHeight * 0.8), 
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const CaloriesCard(),

                  SizedBox(height: verticalSpacing),

                  const QuickStatsRow(),

                  SizedBox(height: verticalSpacing * 0.7),

                  const QuickAccessSection(),

                  const DailyTipSection(),

                  
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
