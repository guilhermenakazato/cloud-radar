import 'package:cloud_radar/presentation/theme/application_colors.dart';
import 'package:flutter/material.dart';

class CurrentTemperatureText extends StatelessWidget {
  final String temperatureScale;
  final int currentTemperature;

  const CurrentTemperatureText({
    super.key,
    required this.currentTemperature,
    required this.temperatureScale,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "$currentTemperature°",
          style: const TextStyle(
            color: ApplicationColors.white,
            fontFamily: "DM Sans",
            fontSize: 80,
            fontWeight: FontWeight.w500,
            height: 1,
          ),
        ),
        Text(
          temperatureScale,
          style: const TextStyle(
            color: ApplicationColors.orange500,
            fontFamily: "DM Sans",
            fontSize: 40,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
