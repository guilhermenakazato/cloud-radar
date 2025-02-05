import 'package:flutter/material.dart';

class InputSearchIconColor extends WidgetStateColor {
  const InputSearchIconColor() : super(_defaultColor);

  static const int _defaultColor = 0x40ffffff;
  static const int _mainColor = 0xffffffff;
  static const int _disabledColor = 0xff737373;

  @override
  Color resolve(Set<WidgetState> states) {
    if (states.contains(WidgetState.pressed) || states.contains(WidgetState.focused) || states.contains(WidgetState.hovered)) {
      return const Color(_mainColor);
    }
  
    if (states.contains(WidgetState.disabled)) return const Color(_disabledColor);
    return const Color(_defaultColor);
  }
}
