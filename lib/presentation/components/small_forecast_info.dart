import 'package:cloud_radar/presentation/components/bold_half.dart';
import 'package:cloud_radar/presentation/theme/application_colors.dart';
import 'package:flutter/material.dart';

class SmallForecastInfo extends StatelessWidget {
  final String normalText, boldText;
  final IconData icon;

  const SmallForecastInfo({
    super.key,
    required this.normalText,
    required this.boldText,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
       Icon(
          icon,
          applyTextScaling: true,
          size: 24,
        ),
        BoldHalf(
          normalText: normalText,
          boldText: boldText,
          style: const TextStyle(
            fontFamily: "Inter",
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: ApplicationColors.white,
          ),
          textScaler: const TextScaler.linear(0.8),
        ),
      ],
    );
  }
}
