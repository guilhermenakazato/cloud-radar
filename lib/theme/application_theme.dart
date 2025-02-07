import 'package:cloud_radar/theme/input_background_color.dart';
import 'package:cloud_radar/theme/input_map_icon_color.dart';
import 'package:cloud_radar/theme/input_search_icon_color.dart';
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
    iconTheme: const IconThemeData(
      color: ApplicationColors.white,
    ),
    inputDecorationTheme: InputDecorationTheme(
      prefixIconColor: const InputMapIconColor(),
      suffixIconColor: const InputSearchIconColor(),
      hintStyle: TextStyle(
        color: ApplicationColors.white.withValues(alpha: 0.3),
        fontSize: 16,
        fontFamily: "DM Sans",
        fontWeight: FontWeight.w400,
      ),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: ApplicationColors.blue,
          )),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(
          color: ApplicationColors.blue,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(
          color: ApplicationColors.blue600,
        ),
      ),
      disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: ApplicationColors.black600,
          )),
      fillColor: const InputBackgroundColor(),
      hoverColor: ApplicationColors.blue500,
      filled: true,
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: ButtonStyle(
        backgroundColor: const WidgetStateProperty.fromMap(
          <WidgetStatesConstraint, Color>{
            WidgetState.hovered: ApplicationColors.blue500,
            WidgetState.focused: ApplicationColors.blue600,
            WidgetState.pressed: ApplicationColors.blue700,
            WidgetState.disabled: ApplicationColors.black600,
            WidgetState.any: ApplicationColors.blue,
          },
        ),
        padding: WidgetStateProperty.all(
          const EdgeInsets.all(20),
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
        foregroundColor: const WidgetStateProperty.fromMap(
          <WidgetStatesConstraint, Color>{
            WidgetState.pressed: ApplicationColors.white,
            WidgetState.any: ApplicationColors.black,
          },
        ),
        backgroundColor: const WidgetStateProperty.fromMap(
          <WidgetStatesConstraint, Color>{
            WidgetState.pressed: ApplicationColors.blue700,
            WidgetState.any: Colors.transparent,
          },
        ),
        side: const WidgetStateProperty.fromMap(
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
          const EdgeInsets.all(20),
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
        backgroundColor: const WidgetStateProperty.fromMap(
          <WidgetStatesConstraint, Color>{
            WidgetState.hovered: ApplicationColors.blue500,
            WidgetState.focused: ApplicationColors.blue600,
            WidgetState.pressed: ApplicationColors.blue700,
            WidgetState.disabled: ApplicationColors.black600,
            WidgetState.any: ApplicationColors.blue,
          },
        ),
        foregroundColor: const WidgetStateProperty.fromMap(
          <WidgetStatesConstraint, Color>{
            WidgetState.disabled: ApplicationColors.white500,
            WidgetState.any: ApplicationColors.white,
          },
        ),
        padding: WidgetStateProperty.all(
          const EdgeInsets.all(
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
    listTileTheme: const ListTileThemeData(
      contentPadding: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),
      tileColor: ApplicationColors.black800,
      selectedTileColor: ApplicationColors.green,
      titleTextStyle: TextStyle(
        color: ApplicationColors.white,
        height: 1,
        fontSize: 16,
      ),
      subtitleTextStyle: TextStyle(
        color: ApplicationColors.white,
        height: 1,
        fontSize: 12,
      ),
    ),
  );
}
