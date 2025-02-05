import 'package:flutter/material.dart';

class InputMapIconColor extends WidgetStateColor {
  const InputMapIconColor() : super(_defaultColor);

  static const int _defaultColor = 0xffffffff;
  static const int _disabledColor = 0xff737373;

  @override
  Color resolve(Set<WidgetState> states) {
    if (states.contains(WidgetState.disabled)) return const Color(_disabledColor);
    return const Color(_defaultColor);
  }
}
