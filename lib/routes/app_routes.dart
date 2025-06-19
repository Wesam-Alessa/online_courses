import 'package:flutter/material.dart';
import 'package:online_courses/main_screen.dart';
import 'package:online_courses/views/auth/forgot_password_screen.dart';
import 'package:online_courses/views/auth/login_screen.dart';
import 'package:online_courses/views/auth/register_screen.dart';
import 'package:online_courses/views/course/course_list/course_list_screen.dart';
import 'package:online_courses/views/home/home_screen.dart';
import 'package:online_courses/views/onboarding/onboarding_screen.dart';
import 'package:online_courses/views/profile/profile_screen.dart';
import 'package:online_courses/views/quiz/quiz_list/quiz_list_screen.dart';
import 'package:online_courses/views/splash/splash_screen.dart';
import 'package:online_courses/views/teacher/teacher_home_screen.dart';

class AppRoutes {
  static const String main = '/main';
  static const String splash = '/splash';
  static const String onboarding = '/onboarding';
  static const String home = '/home';
  static const String login = '/login';
  static const String register = '/register';
  static const String forgotPassword = '/forgot-password';
  static const String teacherHome = '/teacher/home';
  static const String courseList = '/courses';
  static const String quizList = '/quizzes';
  static const String profile = '/profile';


  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case main:
        return MaterialPageRoute(
          builder:
              (_) => MainScreen(
                initialIndex:
                    settings.arguments is Map
                        ? (settings.arguments
                                as Map<String, dynamic>)['initialIndex']
                            as int?
                        : null,
              ),
        );
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
      case teacherHome:
        return MaterialPageRoute(builder: (_) => const TeacherHomeScreen());
        case courseList:
        return MaterialPageRoute(builder: (_) => const CourseListScreen());
        case quizList:
        return MaterialPageRoute(builder: (_) => const QuizListScreen());
        case profile:
        return MaterialPageRoute(builder: (_) => const ProfileScreen());
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
