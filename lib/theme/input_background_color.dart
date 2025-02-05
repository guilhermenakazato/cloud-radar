import 'package:flutter/material.dart';

class InputBackgroundColor extends WidgetStateColor {
  const InputBackgroundColor() : super(_defaultColor);

  static const int _defaultColor = 0xff1D236B;
  static const int _pressedColor = 0xff1B2164;
  static const int _focusedColor = 0xff262E8C;
  static const int _hoveredColor = 0xff313BB5;
  static const int _disabledColor = 0xff595959;

  @override
  Color resolve(Set<WidgetState> states) {
    if (states.contains(WidgetState.pressed)) return const Color(_pressedColor);
    if (states.contains(WidgetState.focused)) return const Color(_focusedColor);
    if (states.contains(WidgetState.hovered)) return const Color(_hoveredColor);
    if (states.contains(WidgetState.disabled)) return const Color(_disabledColor);
    return const Color(_defaultColor);
  }
}
