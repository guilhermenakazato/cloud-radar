import 'package:flutter/material.dart';
import 'application_colors.dart';

class ApplicationThemes {
  static final defaultTheme = ThemeData(
    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: ApplicationColors.white,
      onPrimary: ApplicationColors.white,
      secondary: ApplicationColors.green,
      onSecondary: ApplicationColors.black,
      error: ApplicationColors.red,
      onError: Colors.white,
      surface: Colors.white,
      onSurface: ApplicationColors.black,
    ),
    iconTheme: IconThemeData(
      color: ApplicationColors.white,
    )
  );
}