import 'package:flutter/material.dart';

class CColors {
  CColors._();

  // App Colors
  static const Color primary = Color(0xFFFFE24B);
  static const Color secondary = Color.fromRGBO(75, 104, 255, 1);
  static const Color accent = Color(0xFFb0c7ff);

  static const dividerLine = Color(0xffE4E4EE);
  static const cardColor = Color(0xffE9ECF1);
  static const textColorBlack = Color(0xff171717);
  static const firstGradientColor = Color(0xff408ADE);
  static const secondGradientColor = Color(0xff5286CD);

  // Gradient Colors
  static const Gradient linearGradient = LinearGradient(
      begin: Alignment(0, 0),
      end: Alignment(0.707, -0.707),
      colors: [Color(0xffff9a9e), Color(0xfffad0c4), Color(0xfffad0c0)]);

  // Text Colors
  static const Color textPrimary = Color(0xFF333333);
  static const Color textSecondary = Color(0xFF6c7570);
  static const Color textWhite = Colors.white;

  // Background Colors
  static const Color light = Color(0xFFF6F6F6);
  static const Color dark = Color(0xFF272727);
  static const Color primaryBackground = Color(0xFFF3F5FF);

  // Background Container Colors
  static const Color ligntContainer = Color(0xFFF6F6F6);
  static Color darkContainer = CColors.textWhite.withOpacity(0.1);

  // Button Colors
  static const Color buttonPrimary = Color(0xFFFFE24B);
  static const Color buttonSecondary = Color(0xFF6C757D);
  static const Color buttonDisabled = Color(0xFFC4C4C4);

  // Border Colors
  static const Color borderPrimary = Color(0xFFD9D9D9);
  static const Color borderSecondary = Color(0xFFE6E6E6);

  // Error and Validation Colors
  static const Color error = Color(0xFFD32F2F);
  static const Color success = Color(0xFF388E3C);
  static const Color warning = Color(0xFFF57C00);
  static const Color info = Color(0xFF1976D2);

  // Neutral Shades
  static const Color black = Color(0xFF232323);
  static const Color darkerGrey = Color(0xFF4F4F4F);
  static const Color darkGrey = Color(0xFF939393);
  static const Color grey = Color(0xFFE0E0E0);
  static const Color sofrGrey = Color(0xFFF4F4F4);
  static const Color lightGrey = Color(0xFFF9F9F9);
  static const Color white = Color(0xFFFFFFFF);
}
