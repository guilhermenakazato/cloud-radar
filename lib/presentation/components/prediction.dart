import 'package:cloud_radar/presentation/theme/application_colors.dart';
import 'package:flutter/material.dart';

class Prediction extends StatelessWidget {
  const Prediction({
    super.key,
    required this.icon,
    required this.day,
    required this.minTemperature,
    required this.maxTemperature,
    this.color = ApplicationColors.blue,
  });

  final IconData icon;
  final String day;
  final int minTemperature, maxTemperature;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.23,
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
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "$minTemperature° ",
                  style: const TextStyle(
                    color: ApplicationColors.blue100,
                  ),
                ),
                TextSpan(
                  text: "- $maxTemperature°",
                  style: const TextStyle(
                    color: ApplicationColors.orange100,
                  ),
                ),
              ],
              style: const TextStyle(
                fontFamily: "DM Sans",
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
