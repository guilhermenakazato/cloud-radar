import 'package:flutter/material.dart';

class Prediction extends StatelessWidget {
  const Prediction({
    super.key,
    required this.iconPath,
    required this.day,
    required this.temperature,
    required this.temperatureScale,
  });

  final String iconPath;
  final String day;
  final int temperature;
  final String temperatureScale;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(day),
        Image.asset(iconPath),
        Text("$temperature °$temperatureScale"),
      ],
    );
  }
}
