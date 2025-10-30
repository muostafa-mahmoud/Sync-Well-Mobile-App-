import '../widgets/logo_chip.dart';
import '../widgets/segmented_toggle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/auth_cubit.dart';
import '../cubit/auth_state.dart';
import 'login_screen.dart';
import 'signup_screen.dart';
import '../../../main_shell.dart';
import '../../../../core/app/di.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  String _formatErrorMessage(String error) {
    // Convert Firebase error messages to user-friendly messages
    if (error.contains('credential') && error.contains('malformed')) {
      return 'Invalid email or password. Please check and try again.';
    }
    if (error.contains('user-not-found')) {
      return 'No account found with this email.';
    }
    if (error.contains('wrong-password')) {
      return 'Incorrect password. Please try again.';
    }
    if (error.contains('email-already-in-use')) {
      return 'This email is already registered.';
    }
    if (error.contains('weak-password')) {
      return 'Password is too weak. Use at least 6 characters.';
    }
    if (error.contains('invalid-email')) {
      return 'Please enter a valid email address.';
    }
    // Return a simplified version of other errors
    return error.replaceAll(RegExp(r'\[.*?\]'), '').trim();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AuthCubit>(),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state.status == AuthStatus.success && state.user != null) {
            // Navigate to main app after successful login/signup
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => const MainShell()),
            );
          } else if (state.status == AuthStatus.error && state.error != null) {
            // Hide any existing snackbars
            ScaffoldMessenger.of(context).hideCurrentSnackBar();

            // Show the error message
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Row(
                  children: [
                    const Icon(Icons.error_outline, color: Colors.white),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: Text(
                        _formatErrorMessage(state.error!),
                        style: TextStyle(color: Colors.white, fontSize: 14.sp),
                      ),
                    ),
                  ],
                ),
                backgroundColor: Colors.red.shade700,
                behavior: SnackBarBehavior.floating,
                margin: EdgeInsets.all(16.w),
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
                duration: const Duration(
                  seconds: 4,
                ), // Auto-dismiss after 4 seconds
                action: SnackBarAction(
                  label: 'Dismiss',
                  textColor: Colors.white,
                  onPressed: () {
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  },
                ),
              ),
            );

            // Clear error state after showing
            final cubit = context.read<AuthCubit>();
            if (context.mounted) {
              Future.microtask(() => cubit.resetError());
            }
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: const Color(0xFF0B0B0B),
            body: SafeArea(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 20.h),
                    const LogoChip(),
                    SizedBox(height: 18.h),
                    Text(
                      'Welcome to SyncWell',
                      style: TextStyle(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 6.h),
                    Text(
                      'Your fitness journey starts here',
                      style: TextStyle(fontSize: 12.sp, color: Colors.white70),
                    ),
                    SizedBox(height: 18.h),
                    SegmentedToggle(
                      value: state.isLogin,
                      onChanged: (value) =>
                          context.read<AuthCubit>().toggleAuthMode(),
                    ),
                    SizedBox(height: 18.h),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(16.w),
                      decoration: BoxDecoration(
                        color: const Color(0xFF0D0D0D),
                        borderRadius: BorderRadius.circular(12.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.4),
                            blurRadius: 8.r,
                            offset: Offset(0, 4.h),
                          ),
                        ],
                      ),
                      child: AnimatedCrossFade(
                        duration: const Duration(milliseconds: 250),
                        crossFadeState: state.isLogin
                            ? CrossFadeState.showFirst
                            : CrossFadeState.showSecond,
                        firstChild: const LoginView(),
                        secondChild: const SignUpView(),
                      ),
                    ),
                    SizedBox(height: 18.h),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
