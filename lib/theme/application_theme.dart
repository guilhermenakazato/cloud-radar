import 'package:cloud_radar/theme/input_background_color.dart';
import 'package:flutter/material.dart';
import 'application_colors.dart';

// nem uso esse colorScheme direito lol
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
          )),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: ApplicationColors.blue,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: ApplicationColors.blue600,
        ),
      ),
      disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: ApplicationColors.black600,
          )),
      fillColor: InputBackgroundColor(),
      hoverColor: ApplicationColors.blue500,
      filled: true,
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.fromMap(
          <WidgetStatesConstraint, Color>{
            WidgetState.hovered: ApplicationColors.blue500,
            WidgetState.focused: ApplicationColors.blue600,
            WidgetState.pressed: ApplicationColors.blue700,
            WidgetState.disabled: ApplicationColors.black600,
            WidgetState.any: ApplicationColors.blue,
          },
        ),
        padding: WidgetStateProperty.all(
          EdgeInsets.all(20),
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        foregroundColor: WidgetStateProperty.fromMap(
          <WidgetStatesConstraint, Color>{
            WidgetState.pressed: ApplicationColors.white,
            WidgetState.any: ApplicationColors.black,
          },
        ),
        backgroundColor: WidgetStateProperty.fromMap(
          <WidgetStatesConstraint, Color>{
            WidgetState.pressed: ApplicationColors.blue700,
            WidgetState.any: Colors.transparent,
          },
        ),
        side: WidgetStateProperty.fromMap(
          <WidgetStatesConstraint, BorderSide>{
            WidgetState.hovered: BorderSide(
              color: ApplicationColors.blue500,
            ),
            WidgetState.focused: BorderSide(
              color: ApplicationColors.blue600,
            ),
            WidgetState.pressed: BorderSide(
              color: ApplicationColors.blue,
            ),
            WidgetState.disabled: BorderSide(
              color: ApplicationColors.black600,
            ),
            WidgetState.any: BorderSide(
              color: ApplicationColors.blue,
            ),
          },
        ),
        padding: WidgetStateProperty.all(
          EdgeInsets.all(20),
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    ),
    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.fromMap(
          <WidgetStatesConstraint, Color>{
            WidgetState.hovered: ApplicationColors.blue500,
            WidgetState.focused: ApplicationColors.blue600,
            WidgetState.pressed: ApplicationColors.blue700,
            WidgetState.disabled: ApplicationColors.black600,
            WidgetState.any: ApplicationColors.blue,
          },
        ),
        foregroundColor: WidgetStateProperty.fromMap(
          <WidgetStatesConstraint, Color>{
            WidgetState.disabled: ApplicationColors.white500,
            WidgetState.any: ApplicationColors.white,
          },
        ),
        padding: WidgetStateProperty.all(
          EdgeInsets.all(
            16,
          ),
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              8,
            ),
          ),
        ),
      ),
    ),
  );
}
