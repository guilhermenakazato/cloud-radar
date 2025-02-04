import 'package:cloud_radar/theme/input_background_color.dart';
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
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: ApplicationColors.blue,
        )
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: ApplicationColors.blue,
        ),
      ),
      focusedBorder:  OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: ApplicationColors.blue600,
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: ApplicationColors.black600,
        )
      ),
      fillColor: InputBackgroundColor(),
      hoverColor: ApplicationColors.blue500,
      filled: true,
    )
  );
}