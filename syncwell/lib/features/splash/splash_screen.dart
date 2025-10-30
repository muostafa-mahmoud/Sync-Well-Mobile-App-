// lib/features/splash/presentation/pages/splash_page.dart
import 'package:flutter/material.dart';
import '../../../../core/app/theme.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF0F172A), Color(0xFF1E293B)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 90,
                height: 90,
                decoration: BoxDecoration(
                  color: AppColors.primaryGreen,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Icon(Icons.monitor_heart,
                    color: Colors.white, size: 48),
              ),
              const SizedBox(height: 16),
              const Text('SyncWell',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              const Text('Health & Fitness'),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _dot(false),
                  _dot(true),
                  _dot(false),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _dot(bool active) => Container(
        width: 8,
        height: 8,
        margin: const EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: active ? AppColors.primaryGreen : Colors.grey,
        ),
      );
}
