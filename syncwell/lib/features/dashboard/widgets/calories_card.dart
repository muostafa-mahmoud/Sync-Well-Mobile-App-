import 'package:flutter/material.dart';

class CaloriesCard extends StatelessWidget {
  const CaloriesCard({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    double totalCalories = 2000;
    double consumedCalories = 1500;
    double progress = consumedCalories / totalCalories;

    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.04,
        vertical: screenHeight * 0.015,
      ),
      padding: EdgeInsets.all(screenWidth * 0.04),
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFF2A2A2A),
        borderRadius: BorderRadius.circular(screenWidth * 0.04),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: screenWidth * 0.025,
            offset: Offset(0, screenHeight * 0.006),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Today's Calories",
            style: TextStyle(
              color: Colors.white,
              fontSize: screenWidth * 0.045,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: screenHeight * 0.02),
          // Progress Bar
          ClipRRect(
            borderRadius: BorderRadius.circular(screenWidth * 0.025),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: screenHeight * 0.012,
              backgroundColor: Colors.grey.shade800,
              valueColor:
                  const AlwaysStoppedAnimation<Color>(Color(0xFF00C6FF)),
            ),
          ),
          SizedBox(height: screenHeight * 0.02),
          // Calories Info Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _CalorieInfo(title: "Consumed", value: "1500 kcal", screenWidth: screenWidth),
              _CalorieInfo(title: "Burned", value: "300 kcal", screenWidth: screenWidth),
              _CalorieInfo(title: "Remaining", value: "500 kcal", screenWidth: screenWidth),
            ],
          ),
        ],
      ),
    );
  }
}

class _CalorieInfo extends StatelessWidget {
  final String title;
  final String value;
  final double screenWidth;

  const _CalorieInfo({
    required this.title,
    required this.value,
    required this.screenWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
            color: Colors.white70,
            fontSize: screenWidth * 0.035,
          ),
        ),
        SizedBox(height: screenWidth * 0.01),
        Text(
          value,
          style: TextStyle(
            color: Colors.white,
            fontSize: screenWidth * 0.04,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
