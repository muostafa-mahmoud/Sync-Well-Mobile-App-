// lib/features/auth/presentation/pages/login_page.dart
import 'package:flutter/material.dart';
import '../../../../core/app/theme.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final email = TextEditingController();
    final password = TextEditingController();

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SizedBox(
            width: 360,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [AppColors.primaryGreen, AppColors.accentBlue],
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Center(
                    child: Text('SW',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20)),
                  ),
                ),
                const SizedBox(height: 12),
                const Text('Welcome to SyncWell',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const Text('Your fitness journey starts here'),
                const SizedBox(height: 20),
                TextField(
                  controller: email,
                  decoration: const InputDecoration(
                      labelText: 'Email', hintText: 'Enter your email'),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: password,
                  obscureText: true,
                  decoration: const InputDecoration(
                      labelText: 'Password', hintText: 'Enter your password'),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                      onPressed: () {}, child: const Text('Forgot Password?')),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryGreen),
                  child: const Text('Login'),
                ),
                const SizedBox(height: 12),
                const Text('Or continue with'),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    OutlinedButton(onPressed: () {}, child: const Text('Google')),
                    const SizedBox(width: 8),
                    OutlinedButton(
                        onPressed: () {}, child: const Text('Facebook')),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
