import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static final light = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: const Color(0xFFF4F4F4),
    colorScheme: const ColorScheme.light(
      primary: Color(0xFF4A90E2),
      secondary: Color(0xFF27AE60),
      surface: Color(0xFFF4F4F4),
      onSurface: Color(0xFF2E2E2E),
    ),
    textTheme: GoogleFonts.montserratTextTheme().copyWith(
      headlineLarge: GoogleFonts.montserrat(
        fontWeight: FontWeight.bold,
        fontSize: 40,
        color: const Color(0xFF2E2E2E),
      ),
      bodyMedium: GoogleFonts.montserrat(
        fontSize: 18,
        color: const Color(0xFF222A36),
      ),
    ),
    useMaterial3: true,
  );
  static final dark = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: const Color(0xFF121826),
    colorScheme: const ColorScheme.dark(
      primary: Color(0xFF4A90E2),
      secondary: Color(0xFF27AE60),
      surface: Color(0xFF121826),
      onSurface: Colors.white,
    ),
    textTheme: GoogleFonts.montserratTextTheme(
            ThemeData(brightness: Brightness.dark).textTheme)
        .copyWith(
      headlineLarge: GoogleFonts.montserrat(
        fontWeight: FontWeight.bold,
        fontSize: 40,
        color: Colors.white,
      ),
      bodyMedium: GoogleFonts.montserrat(
        fontSize: 18,
        color: Colors.white70,
      ),
    ),
    useMaterial3: true,
  );
}
