import 'package:flutter/material.dart';
import 'application_colors.dart';

class ApplicationThemes {
  static final defaultTheme = ThemeData(
    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: ApplicationColors.primary,
      onPrimary: Colors.white,
      secondary: ApplicationColors.secondary,
      onSecondary: Colors.black,
      error: ApplicationColors.error,
      onError: Colors.white,
      surface: Colors.white,
      onSurface: ApplicationColors.primary,
    ),
    fontFamily: "Roboto",
  );
}