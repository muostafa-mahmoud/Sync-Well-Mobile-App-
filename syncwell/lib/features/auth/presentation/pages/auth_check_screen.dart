import 'package:flutter/material.dart';
import '../../data/repositories/local_auth_service.dart';
import '../../../main_shell.dart';
import 'auth_screen.dart';

/// Widget to check if user is logged in on app startup
class AuthCheckScreen extends StatefulWidget {
  const AuthCheckScreen({super.key});

  @override
  State<AuthCheckScreen> createState() => _AuthCheckScreenState();
}

class _AuthCheckScreenState extends State<AuthCheckScreen> {
  final LocalAuthService _authService = LocalAuthService();

  @override
  void initState() {
    super.initState();
    _checkAuth();
  }

  Future<void> _checkAuth() async {
    try {
      print('AuthCheckScreen: Starting auth check...');
      // Give a brief moment for splash-like effect
      await Future.delayed(const Duration(milliseconds: 500));

      print('AuthCheckScreen: Loading current user profile...');
      final user = await _authService.loadCurrentUserProfile();
      print(
        'AuthCheckScreen: User loaded: ${user != null ? "logged in" : "not logged in"}',
      );

      if (mounted) {
        if (user != null) {
          print('AuthCheckScreen: Navigating to MainShell...');
          // User is logged in, go to main app
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) => const MainShell()),
          );
        } else {
          print('AuthCheckScreen: Navigating to AuthPage...');
          // User not logged in, go to auth screen
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) => const AuthPage()),
          );
        }
      }
    } catch (e, stackTrace) {
      print('AuthCheckScreen ERROR: $e');
      print('StackTrace: $stackTrace');
      // If there's an error, go to auth page
      if (mounted) {
        Navigator.of(
          context,
        ).pushReplacement(MaterialPageRoute(builder: (_) => const AuthPage()));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // Show a simple loading screen
    return Scaffold(
      backgroundColor: const Color(0xFF0B0B0B),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF00F260), Color(0xFF0575E6)],
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Center(
                child: Text(
                  'SW',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'SyncWell',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Your fitness journey starts here',
              style: TextStyle(fontSize: 14, color: Colors.white70),
            ),
            const SizedBox(height: 32),
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF00F260)),
            ),
          ],
        ),
      ),
    );
  }
}
