import 'package:get/get.dart';
import 'package:online_courses/main_screen.dart';
import 'package:online_courses/routes/app_routes.dart';
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

class AppPages {
  static final List<GetPage> pages = [
    GetPage(name: AppRoutes.splash, page: () => const SplashScreen()),
    GetPage(name: AppRoutes.onboarding, page: () => const OnboardingScreen()),
    GetPage(name: AppRoutes.home, page: () => const HomeScreen()),
    GetPage(name: AppRoutes.login, page: () => const LoginScreen()),
    GetPage(name: AppRoutes.register, page: () => const RegisterScreen()),
    GetPage(
      name: AppRoutes.forgotPassword,
      page: () => const ForgotPasswordScreen(),
    ),
    GetPage(name: AppRoutes.teacherHome, page: () => const TeacherHomeScreen()),
    GetPage(name: AppRoutes.courseList, page: () => const CourseListScreen()),
    GetPage(name: AppRoutes.quizList, page: () => const QuizListScreen()),
    GetPage(name: AppRoutes.profile, page: () => const ProfileScreen()),
    GetPage(
      name: AppRoutes.main,
      page:
          () => MainScreen(
            initialIndex:
                Get.arguments is Map<String, dynamic>
                    ? Get.arguments['initialIndex'] as int?
                    : null,
          ),
    ),
  ];
}
