import 'package:flutter/material.dart';

class BoldHalf extends StatelessWidget {
  final String normalText, boldText;
  final TextStyle style;
  final TextScaler textScaler;

  const BoldHalf(
      {super.key,
      required this.normalText,
      required this.boldText,
      required this.style,
      this.textScaler = TextScaler.noScaling,});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: normalText,
          ),
          TextSpan(
            text: " $boldText",
            style: const TextStyle(
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
        style: style,
      ),
      textScaler: textScaler,
    );
  }
}
