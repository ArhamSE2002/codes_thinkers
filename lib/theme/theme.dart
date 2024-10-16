import 'package:flutter/material.dart';

class AppColors {
  static const primaryColor = Color(0xFF121225);
  static const secondaryColor = Color(0xFFFFA500);
  static const textColor = Color(0xFFFFFFFF);
  static const redColor = Color(0xFFE70C0C);
  static const greenColor = Color(0xFF24DA09);
static var backgroundImage;
  static var backgroundColor;
}
//images
class Images {
 static const backgroundImage = AssetImage('assets/images/background thinker.jpg') ;
  
  
}

// app primary theme
ThemeData primaryTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),

  // Scaffold theme
  // scaffoldBackgroundColor: AppColors.primaryColor,

  // Elevated Button Theme
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.secondaryColor,
      foregroundColor: Colors.white,
    ),
  ),

  // Text Theme
  textTheme: const TextTheme(
    bodyMedium: TextStyle(
      color: Colors.white,
      fontSize: 16,
      letterSpacing: 1,
    ),
    headlineMedium: TextStyle(
      color: Colors.white,
      fontSize: 18,
      fontWeight: FontWeight.bold,
      letterSpacing: 1,
    ),
    titleMedium: TextStyle(
      color: Colors.white,
      fontSize: 18,
      letterSpacing: 1,
      fontWeight: FontWeight.bold,
    ),
    bodyLarge: TextStyle(
      color: AppColors.primaryColor,
      fontSize: 18,
      letterSpacing: 1,
    ),
  ),

  // Input Theme
  inputDecorationTheme: InputDecorationTheme(
    fillColor: Colors.white,
    filled: true,
    labelStyle: const TextStyle(color: AppColors.primaryColor),
    border: UnderlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        color: AppColors.secondaryColor,
      ),
    ),
    focusedBorder: UnderlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        color: AppColors.secondaryColor,
      ),
    ),
    enabledBorder: UnderlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        color: AppColors.secondaryColor,
      ),
    ),
    errorBorder: UnderlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        color: Colors.red,
      ),
    ),
  ),

  // icons
  iconTheme: const IconThemeData(
    color: Colors.white,
  ),

  //app bar
  appBarTheme: const AppBarTheme(
      elevation: 10,
      shadowColor: AppColors.primaryColor,
      color: AppColors.primaryColor,
      foregroundColor: AppColors.textColor,
      surfaceTintColor: Colors.transparent),
  cardTheme: CardTheme(
    color: AppColors.secondaryColor.withOpacity(0.8),
  ),

  //circular indicator
  progressIndicatorTheme:
      const ProgressIndicatorThemeData(color: AppColors.textColor),

  //floating action button
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: AppColors.textColor,
    foregroundColor: AppColors.primaryColor,
  ),
);
