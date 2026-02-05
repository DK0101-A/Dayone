import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // Primary palette - warm orange/gold (hope + energy)
  static const Color primary = Color(0xFFFF6B35);
  static const Color primaryLight = Color(0xFFFF9B6B);
  static const Color primaryDark = Color(0xFFCC4E00);

  // Background - deep dark (参考 quittr)
  static const Color background = Color(0xFF0D0D0D);
  static const Color surface = Color(0xFF1A1A1A);
  static const Color surfaceLight = Color(0xFF2A2A2A);

  // Text
  static const Color textPrimary = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFFB0B0B0);
  static const Color textTertiary = Color(0xFF666666);

  // Status
  static const Color success = Color(0xFF4ADE80);
  static const Color warning = Color(0xFFFBBF24);
  static const Color error = Color(0xFFEF4444);

  // Gamification
  static const Color xpGold = Color(0xFFFFD700);
  static const Color streakFire = Color(0xFFFF4500);
  static const Color levelPurple = Color(0xFF8B5CF6);

  // Gradient colors
  static const List<Color> primaryGradient = [
    Color(0xFFFF6B35),
    Color(0xFFFF9B6B),
  ];

  static const List<Color> successGradient = [
    Color(0xFF4ADE80),
    Color(0xFF22C55E),
  ];
}
