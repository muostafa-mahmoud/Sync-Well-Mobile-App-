import 'package:flutter/material.dart';

// all colors in this widget
const Color kPrimaryColor = Color(0xFFE56E2C);
const Color kBackgroundColor = Color(0xFF1C1C1C); //back ground color
const Color kCardColor = Color(0xFF282828); // every card back ground color
const Color kAccentRed = Color(0xFFE54A4A); //Call icon  color
const Color kAccentGreen = Color(0xFF42A562); //Ex icon  color
const Color kAccentYellow = Color(0xFFFFC107); //Min icon  color

class WorkoutPage extends StatefulWidget {
  const WorkoutPage({super.key, required void Function(int i) onNavTap});

  @override
  State<WorkoutPage> createState() => _WorkoutScreenState();
}

class _WorkoutScreenState extends State<WorkoutPage> {
  // Ex Data
  final List<Map<String, String>> exercises = [
    {'name': 'Running', 'duration': '30 min', 'calories': '300 kcal'},
    {'name': 'Push-ups', 'duration': '3 sets', 'calories': '50 kcal'},
    {'name': 'Squats', 'duration': '4 sets', 'calories': '80 kcal'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Stack(
        children: [
          // Custom top app bar
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: 130,
            child: Container(
              decoration: const BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.arrow_back, color: Colors.white, size: 24),
                      Spacer(),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Workout Plan',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Build your strength',
                    style: TextStyle(color: Colors.white70, fontSize: 16),
                  ),
                ],
              ),
            ),
          ),

          //Main screen content

          Positioned.fill(
            top: 130,
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ---Today's Progress ---
                  const SizedBox(height: 10),
                  const Text(
                    "Today's Progress",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 10),
                  _buildProgressCard(),
                  const SizedBox(height: 20),

                  // ---   Today's Exercises ---
                  const Text(
                    "Today's Exercises",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 10),

                  ...exercises.map(
                    (exercise) => _buildExerciseCard(
                      name: exercise['name']!,
                      duration: exercise['duration']!,
                      calories: exercise['calories']!,
                    ),
                  ),


                  const SizedBox(height: 100),
                ],
              ),
            ),
          ),
        ],
      ),

    );
  }

  Widget _buildProgressCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: kCardColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _ProgressItem(
                value: '45',
                unit: 'Minutes',
                color: kAccentYellow,
                icon: Icons.timer,
              ),
              _ProgressItem(
                value: '320',
                unit: 'Calories',
                color: kAccentRed,
                icon: Icons.local_fire_department,
              ),
              _ProgressItem(
                value: '3/5',
                unit: 'Exercises',
                color: kAccentGreen,
                icon: Icons.sports_gymnastics,
              ),
            ],
          ),
          const SizedBox(height: 20),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: 0.6, // 60% 
              backgroundColor: Colors.white10,
              valueColor: const AlwaysStoppedAnimation<Color>(kAccentGreen),
              minHeight: 8,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExerciseCard({
    required String name,
    required String duration,
    required String calories,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: kCardColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              
             
              Icon(Icons.access_time, color: Colors.grey, size: 16),
            
              const SizedBox(width: 5),
              Text(
                duration,
                style: const TextStyle(color: Colors.grey, fontSize: 14),
              ),
              const SizedBox(width: 15),

              Icon(Icons.local_fire_department, color: Colors.grey, size: 16),
              const SizedBox(width: 5),
              Text(
                calories,
                style: const TextStyle(color: Colors.grey, fontSize: 14),
              ),
            ],
          ),
          const SizedBox(height: 15),

          Align(
            alignment: Alignment.centerRight,
            child: ElevatedButton(
              onPressed: () {

                print('$name started!');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: kAccentGreen,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 12,
                ),
              ),
              child: const Text(
                'Start',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }

}

class _ProgressItem extends StatelessWidget {
  final String value;
  final String unit;
  final Color color;
  final IconData icon;

  const _ProgressItem({
    required this.value,
    required this.unit,
    required this.color,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 55,
          height: 55,
          decoration: BoxDecoration(
            color: color.withOpacity(0.2),   
            shape: BoxShape.circle,
            border: Border.all(color: color, width: 2), 
          ),
          child: Icon(icon, color: color, size: 28),
        ),
        const SizedBox(height: 5),
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(unit, style: const TextStyle(color: Colors.grey, fontSize: 12)),
      ],
    );
  }
}
