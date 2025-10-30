import 'package:flutter/material.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({
    super.key,
    required this.mainText,
    required this.subText,
  });

  final String mainText;
  final String subText;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    double headerHeight = (screenHeight * 0.25).clamp(180, 250);

    double mainFontSize = (screenWidth * 0.04).clamp(14, 20);
    double subFontSize = (screenWidth * 0.06).clamp(18, 32);

    double borderRadiusValue = (screenWidth * 0.04).clamp(20, 35);

    return Container(
      width: screenWidth,
      constraints: BoxConstraints(
        minHeight: 180, 
        maxHeight: headerHeight,
      ),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF00C6FF), Color(0xFF00736B)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(borderRadiusValue),
          bottomRight: Radius.circular(borderRadiusValue),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all((screenWidth * 0.04).clamp(12, 24)),
        child: FittedBox(
          alignment: Alignment.centerLeft,
          fit: BoxFit.scaleDown,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                mainText,
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: mainFontSize,
                ),
              ),
              SizedBox(height: screenHeight * 0.008),
              Text(
                subText,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: subFontSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
