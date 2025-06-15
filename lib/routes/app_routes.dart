import 'package:flutter/material.dart';
import 'package:online_courses/views/auth/forgot_password_screen.dart';
import 'package:online_courses/views/auth/login_screen.dart';
import 'package:online_courses/views/auth/register_screen.dart';
import 'package:online_courses/views/home/home_screen.dart';
import 'package:online_courses/views/onboarding/onboarding_screen.dart';
import 'package:online_courses/views/splash/splash_screen.dart';

class AppRoutes {
  static const String splash = '/splash';
  static const String onboarding = '/onboarding';
  static const String home = '/home';
  static const String login = '/login';
  static const String register = '/register';
  static const String forgotPassword = '/forgot-password';


  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
        case onboarding:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
        case home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
        case login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
        case register:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
        case forgotPassword:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordScreen());
      default:
        return MaterialPageRoute(
          builder:
              (_) => const Scaffold(
                body: Center(child: Text('Route Not found !')),
              ),
        );
    }
  }
}
