import 'package:flutter/material.dart';
import 'package:transviti_test/core/constants/app_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    cardTheme: const CardTheme(color: AppColors.background),
    brightness: Brightness.light,
    primaryColor: AppColors.primary,
    primaryColorLight: AppColors.primary,
    primaryColorDark: AppColors.primaryVariant,
    appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.primaryVariant,
        elevation: 0,
        titleTextStyle: TextStyle(color: AppColors.background)),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 57,
        fontWeight: FontWeight.bold,
        color: AppColors.textPrimary,
      ),
      displayMedium: TextStyle(
        fontSize: 45,
        fontWeight: FontWeight.bold,
        color: AppColors.textPrimary,
      ),
      displaySmall: TextStyle(
        fontSize: 35,
        fontWeight: FontWeight.bold,
        color: AppColors.textPrimary,
      ),
      headlineLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: AppColors.textPrimary,
      ),
      headlineMedium: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: AppColors.textPrimary,
      ),
      headlineSmall: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: AppColors.textPrimary,
      ),
      titleLarge: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimary,
      ),
      titleMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimary,
      ),
      titleSmall: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimary,
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: AppColors.textPrimary,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: AppColors.textPrimary,
      ),
      bodySmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.normal,
        color: AppColors.textPrimary,
      ),
      labelLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: AppColors.textPrimary,
      ),
      labelMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: AppColors.textPrimary,
      ),
      labelSmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.bold,
        color: AppColors.textPrimary,
      ),
    ),
    iconTheme: const IconThemeData(color: Colors.black),
    buttonTheme: const ButtonThemeData(
      buttonColor: AppColors.primary,
      textTheme: ButtonTextTheme.primary,
    ),
    cardColor: AppColors.background,
    scaffoldBackgroundColor: AppColors.background,
  );

  static ThemeData darkTheme = ThemeData(
    cardTheme: const CardTheme(color: AppColors.primaryVariant),
    brightness: Brightness.dark,
    primaryColor: AppColors.primaryVariant,
    primaryColorLight: AppColors.primary,
    primaryColorDark: AppColors.primaryVariant,
    appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.primaryVariant,
        elevation: 0,
        titleTextStyle: TextStyle(color: AppColors.background)),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 57,
        fontWeight: FontWeight.bold,
        color: AppColors.background,
      ),
      displayMedium: TextStyle(
        fontSize: 45,
        fontWeight: FontWeight.bold,
        color: AppColors.background,
      ),
      displaySmall: TextStyle(
        fontSize: 35,
        fontWeight: FontWeight.bold,
        color: AppColors.background,
      ),
      headlineLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: AppColors.background,
      ),
      headlineMedium: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: AppColors.background,
      ),
      headlineSmall: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: AppColors.background,
      ),
      titleLarge: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        color: AppColors.background,
      ),
      titleMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: AppColors.background,
      ),
      titleSmall: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: AppColors.background,
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: AppColors.background,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: AppColors.background,
      ),
      bodySmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.normal,
        color: AppColors.background,
      ),
      labelLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: AppColors.background,
      ),
      labelMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: AppColors.background,
      ),
      labelSmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.bold,
        color: AppColors.background,
      ),
    ),
    iconTheme: const IconThemeData(color: Colors.white),
    buttonTheme: const ButtonThemeData(
      buttonColor: AppColors.primary,
      textTheme: ButtonTextTheme.primary,
    ),
    cardColor: Colors.black,
    scaffoldBackgroundColor: Colors.black,
  );
}
