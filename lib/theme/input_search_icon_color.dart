import 'package:flutter/material.dart';

class InputSearchIconColor extends WidgetStateColor {
  const InputSearchIconColor() : super(_defaultColor);

  // TODO: arrumar default
  static const int _defaultColor = 0xff394076;

  static const int _mainColor = 0xffffffff;
  static const int _disabledColor = 0xff737373;

  @override
  Color resolve(Set<WidgetState> states) {
    if (states.contains(WidgetState.pressed) || states.contains(WidgetState.focused) || states.contains(WidgetState.hovered)) {
      return Color(_mainColor);
    }
  
    if (states.contains(WidgetState.disabled)) return Color(_disabledColor);
    return const Color(_defaultColor);
  }
}
