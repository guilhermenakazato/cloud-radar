import 'package:cloud_radar/presentation/theme/application_colors.dart';
import 'package:flutter/material.dart';

class GradientLine extends StatelessWidget {
  const GradientLine({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Align(
        alignment: Alignment.center,
        child: Container(
          width: MediaQuery.sizeOf(context).width * 0.3,
          height: 1,
          decoration: ShapeDecoration(
            gradient: const LinearGradient(
              colors: [ApplicationColors.blue700, ApplicationColors.orange300],
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(1),
            ),
          ),
        ),
      ),
    );
  }
}
