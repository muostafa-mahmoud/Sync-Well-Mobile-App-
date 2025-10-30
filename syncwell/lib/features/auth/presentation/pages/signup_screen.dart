// lib/features/auth/presentation/pages/signup_page.dart
import 'package:flutter/material.dart';
import '../../../../core/app/theme.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    final name = TextEditingController();
    final email = TextEditingController();
    final phone = TextEditingController();
    final dob = TextEditingController();
    final password = TextEditingController();

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SizedBox(
            width: 360,
            child: ListView(
              shrinkWrap: true,
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
                const Text('Create Account',
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 20),
                TextField(
                  controller: name,
                  decoration: const InputDecoration(
                      labelText: 'Full Name', hintText: 'Enter your full name'),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: email,
                  decoration: const InputDecoration(
                      labelText: 'Email', hintText: 'Enter your email'),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: phone,
                  decoration: const InputDecoration(
                      labelText: 'Phone Number',
                      hintText: 'Enter your phone number'),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: dob,
                  decoration: const InputDecoration(
                      labelText: 'Date of Birth', hintText: 'mm/dd/yyyy'),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: password,
                  obscureText: true,
                  decoration: const InputDecoration(
                      labelText: 'Password', hintText: 'Create a password'),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // TODO: Hook up signup logic
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryGreen),
                  child: const Text('Create Account'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
