import 'dart:math';
import 'package:flutter/material.dart';

class DailyTipSection extends StatelessWidget {
  const DailyTipSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

   
    final List<String> tips = [
      "Drink water before meals to help with digestion and portion control.",
      "Get at least 7 hours of sleep to support muscle recovery.",
      "Take a 10-minute walk after eating to improve digestion.",
      "Avoid skipping breakfast to maintain energy levels.",
      "Stretch your body for 5 minutes every morning.",
      "Stay hydrated throughout the day for better focus.",
      "Replace sugary drinks with fresh juices or water.",
      "Eat more vegetables and fruits for vitamins and fiber.",
    ];

    
    final randomTip = tips[Random().nextInt(tips.length)];

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.04,
        vertical: screenHeight * 0.025,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF2A2A2A),
          borderRadius: BorderRadius.circular(screenWidth * 0.04),
        ),
        padding: EdgeInsets.all(screenWidth * 0.04),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 💡 الأيقونة
            Icon(
              Icons.lightbulb_outline,
              color: Colors.amber,
              size: screenWidth * 0.075,
            ),
            SizedBox(width: screenWidth * 0.03),

            // النص
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Daily Tip",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: screenWidth * 0.04,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.008),
                  Text(
                    randomTip,
                    style: TextStyle(
                      color: Colors.grey[300],
                      fontSize: screenWidth * 0.035,
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
