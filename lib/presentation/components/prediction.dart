import 'package:cloud_radar/presentation/theme/application_colors.dart';
import 'package:flutter/material.dart';

class Prediction extends StatelessWidget {
  const Prediction({
    super.key,
    required this.icon,
    required this.day,
    required this.temperature,
    required this.temperatureScale,
    this.color = ApplicationColors.blue,
  });

  final IconData icon;
  final String day;
  final int temperature;
  final String temperatureScale;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.2,
      height: MediaQuery.sizeOf(context).height * 0.11,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            day,
            style: const TextStyle(
              fontFamily: "DM Sans",
              fontWeight: FontWeight.w500,
              color: ApplicationColors.white,
              fontSize: 13,
            ),
          ),
          Icon(icon),
          Text(
            "$temperature°$temperatureScale",
            style: const TextStyle(
              fontFamily: "DM Sans",
              fontWeight: FontWeight.w500,
              color: ApplicationColors.white,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
