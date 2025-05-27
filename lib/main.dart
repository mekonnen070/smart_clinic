import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_clinic/core/themes/app_theme_controller.dart';
import 'package:smart_clinic/features/appointments/presentation/screens/book_appointment_screen.dart';
import 'package:smart_clinic/features/auth/presentation/screens/login_screen.dart';
import 'package:smart_clinic/features/auth/presentation/screens/signup_screen.dart';
import 'package:smart_clinic/features/home_screen.dart';
import 'package:smart_clinic/features/profile/presentation/screens/profile_screen.dart';
import 'package:smart_clinic/features/splash_screen.dart';

Future<void> main() async {
  // Ensure that the Flutter binding is initialized before running the app
  WidgetsFlutterBinding.ensureInitialized();
  final themeData = await ThemeControllerProvider().initialize();
  runApp(ProviderScope(child: MyApp(themeData)));
}

class MyApp extends ConsumerWidget {
  const MyApp(this.themeData, {super.key});

  final ThemeData themeData;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ThemeProvider(
      initTheme: themeData,
      duration: const Duration(seconds: 1),
      builder: (_, theme) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Smart Clinic App',
          theme: theme,
          // Define named routes
          routes: {
            '/login': (context) => const LoginScreen(),
            '/signup': (context) => const SignupScreen(),
            '/home': (context) => const HomeScreen(),
            '/book-appointment': (context) => const BookAppointmentScreen(),
            '/profile': (context) => const ProfileScreen(),
          },
          home: const SplashScreen(),
        );
      },
    );
  }
}
