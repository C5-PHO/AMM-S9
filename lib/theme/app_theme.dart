import 'package:flutter/material.dart';

const maxBlue = Color(0xFF003BFF);
const pageColor = Color(0xFF08091B);

final appTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: pageColor,
  fontFamily: 'Lato',
  colorScheme: const ColorScheme.dark(
    primary: maxBlue,
    surface: Color(0xFF14162C),
  ),
  cardTheme: const CardThemeData(color: Color(0xFF14162C)),
  filledButtonTheme: FilledButtonThemeData(
    style: FilledButton.styleFrom(
      backgroundColor: maxBlue,
      foregroundColor: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      textStyle: const TextStyle(
        fontFamily: 'OpenSans',
        fontWeight: FontWeight.bold,
        letterSpacing: 1,
      ),
    ),
  ),
);
