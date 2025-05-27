import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_clinic/core/config/app_config.dart';
import 'package:smart_clinic/features/auth/application/notifiers/auth_notifier.dart';
import 'package:smart_clinic/features/auth/application/states/auth_state.dart';

// Placeholder for your AppAssets and AppColors if you integrate them
// For now, we'll use standard Flutter widgets.

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Listen to authState changes to navigate.
    // The AuthNotifier's _initialize method is already attempting to load user.
    ref.listen<AuthState>(authNotifierProvider, (previous, next) {
      // Ensure context is still mounted before navigating
      if (!context.mounted) return;

      // Delay navigation slightly to allow splash to be visible for a moment
      Future.delayed(Duration.zero, () {
        // Adjust delay as needed
        if (!context.mounted) return;

        if (shouldUseMockData) {
          Navigator.of(context).pushReplacementNamed('/home');

          return;
        }

        if (next is Authenticated) {
          Navigator.of(context).pushReplacementNamed('/home');
        } else if (next is Unauthenticated || next is AuthError) {
          Navigator.of(context).pushReplacementNamed('/login');
        }
        // If AuthLoading or AuthInitial, we stay on the splash screen.
        // The AuthNotifier should eventually transition out of these states.
      });
    });

    // The UI of the splash screen
    // Replace this with your desired branding/logo from AppAssets
    return Scaffold(
      // backgroundColor: isDarkMode ? AppColors.black : AppColors.white, // Example from your code
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Placeholder for your logo/branding
            const Icon(Icons.local_hospital, size: 100, color: Colors.teal),
            const SizedBox(height: 24),
            const Text(
              'Smart Clinic',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'Your Health, Simplified',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 48),
            const CircularProgressIndicator(color: Colors.teal),
          ],
        ),
      ),
    );
  }
}
