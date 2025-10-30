import 'package:flutter/material.dart';
import 'package:syncwell/features/bmi_calc/bmi_calc.dart';

class QuickAccessSection extends StatelessWidget {
  const QuickAccessSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.04,
        vertical: screenHeight * 0.01,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          Text(
            "Quick Access",
            style: TextStyle(
              color: Colors.white,
              fontSize: screenWidth * 0.045,
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: screenHeight * 0.015),

        
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _AccessCard(
                color: const Color(0xFF3B82F6), 
                icon: Icons.calculate,
                title: "BMI\nCalculator",
                size: screenWidth,
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                          builder: (context) =>
                              BMICalculatorScreen(onNavTap: (int p1) {  },),
                        ),);
                },
              ),
              _AccessCard(
                color: const Color(0xFF22C55E), 
                icon: Icons.restaurant_menu,
                title: "Diet\nPlan",
                size: screenWidth,
              ),
              _AccessCard(
                color: const Color(0xFFF97316), 
                icon: Icons.fitness_center,
                title: "Workout",
                size: screenWidth,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _AccessCard extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String title;
  final VoidCallback? onTap;
  final double size;

  const _AccessCard({
    required this.color,
    required this.icon,
    required this.title,
    this.onTap,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(size * 0.04),
      onTap: onTap,
      child: Ink(
        width: size * 0.27,
        height: size * 0.27,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(size * 0.04),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white, size: size * 0.075),
            SizedBox(height: size * 0.02),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: size * 0.035,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
