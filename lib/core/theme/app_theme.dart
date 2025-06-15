// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:online_courses/bloc/font/font_state.dart';
import 'package:online_courses/core/theme/app_colors.dart';
import 'package:online_courses/core/theme/app_typography.dart';
import 'package:online_courses/services/font_services.dart';

class AppTheme {
  static ThemeData getLightTheme(FontState fontState) {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.lightBackground,
      colorScheme: const ColorScheme.light(
        primary: AppColors.primary,
        secondary: AppColors.secondary,
        error: AppColors.error,
        background: AppColors.lightBackground,
        surface: AppColors.lightSurface,
      ),
      textTheme: FontServices.getCustomTextTheme(AppTypography.lightTextTheme, fontState.fontScale, fontState.fontFamily),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)
          ),
          padding: EdgeInsets.symmetric(vertical: 16)
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.lightSurface,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColors.lightDivider)
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColors.lightDivider)
        ),
      ),  
    );
  }
}
