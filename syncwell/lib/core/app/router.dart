import 'package:flutter/material.dart';
import 'package:syncwell/features/auth/presentation/pages/auth_screen.dart';
import 'package:syncwell/features/bmi_calc/bmi_calc.dart';
import 'package:syncwell/features/dashboard/persentaion/pages/dashboard_page.dart';
import 'package:syncwell/features/diet/presentaion/pages/diet_page.dart';
import 'package:syncwell/features/profile/peresentation/pages/profile_page.dart';
import 'package:syncwell/features/splash/splash_screen.dart';
import 'package:syncwell/features/workout/presentation/pages/workout_page.dart';

class Routes {
  static const splash = '/';
  static const login = '/login';
  static const signup = '/signup';
  static const dashboard = '/dashboard';
  static const diet = '/diet';
  static const workout = '/workout';
  static const profile = '/profile';
  static const bmi = '/bmi';
}

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return MaterialPageRoute(builder: (_) => const SplashPage());
      case Routes.login:
        return MaterialPageRoute(builder: (_) => const AuthPage());
      case Routes.signup:
        return MaterialPageRoute(builder: (_) => const AuthPage());
      case Routes.dashboard:
        return MaterialPageRoute(
          builder: (_) => DashboardPage(onNavTap: (i) {}),
        );
      case Routes.diet:
        return MaterialPageRoute(builder: (_) => DietPage(onNavTap: (i) {}));
      case Routes.workout:
        return MaterialPageRoute(builder: (_) => WorkoutPage(onNavTap: (i) {}));
      case Routes.profile:
        return MaterialPageRoute(builder: (_) => ProfilePage(onNavTap: (i) {}));
      case Routes.bmi:
        return MaterialPageRoute(
          builder: (_) => BMICalculatorScreen(onNavTap: (i) {}),
        );
      default:
        return MaterialPageRoute(builder: (_) => const SplashPage());
    }
  }
}
