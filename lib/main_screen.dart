// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_courses/bloc/navigation/navigation_bloc.dart';
import 'package:online_courses/bloc/navigation/navigation_event.dart';
import 'package:online_courses/bloc/navigation/navigation_state.dart';
import 'package:online_courses/core/theme/app_colors.dart';
import 'package:online_courses/views/course/course_list/course_list_screen.dart';
import 'package:online_courses/views/home/home_screen.dart';
import 'package:online_courses/views/profile/profile_screen.dart';
import 'package:online_courses/views/quiz/quiz_list/quiz_list_screen.dart';

class MainScreen extends StatelessWidget {
  final int? initialIndex;
  const MainScreen({super.key, this.initialIndex});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              NavigationBloc()..add(NavigationToTab(initialIndex ?? 0)),
      child: BlocBuilder<NavigationBloc, NavigationState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: AppColors.lightBackground,
            body: IndexedStack(
              index: state.currentIndex,
              children: const [
                HomeScreen(),
                CourseListScreen(),
                QuizListScreen(),
                ProfileScreen(),
              ],
            ),
            bottomNavigationBar: NavigationBar(
              backgroundColor: AppColors.accent,
              indicatorColor: AppColors.primary.withOpacity(0.1),
              destinations: const [
                NavigationDestination(
                  icon: Icon(Icons.home_outlined),
                  selectedIcon: Icon(Icons.home),
                  label: "Home",
                ),
                NavigationDestination(
                  icon: Icon(Icons.play_lesson_outlined),
                  selectedIcon: Icon(Icons.play_lesson),
                  label: "My Courses",
                ),
                NavigationDestination(
                  icon: Icon(Icons.quiz_outlined),
                  selectedIcon: Icon(Icons.quiz),
                  label: "Quizzes",
                ),
                NavigationDestination(
                  icon: Icon(Icons.person_outlined),
                  selectedIcon: Icon(Icons.person),
                  label: "Profile",
                ),
              ],
              selectedIndex: state.currentIndex,
              onDestinationSelected: (index) {
                context.read<NavigationBloc>().add(NavigationToTab(index));
              },
            ),
          );
        },
      ),
    );
  }
}
