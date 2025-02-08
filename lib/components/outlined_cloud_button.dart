import 'package:cloud_radar/theme/application_colors.dart';
import 'package:flutter/material.dart';

class OutlinedCloudButton extends StatelessWidget {
  const OutlinedCloudButton({
    super.key,
    this.icon,
    required this.onPressed,
    required this.text, this.textColor = ApplicationColors.black,  
  });

  final Widget? icon;
  final Function()? onPressed;
  final String text;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      label: Text(
        text,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          fontFamily: "DM Sans",
          color: textColor,
        ),
      ),
      iconAlignment: IconAlignment.end,
      icon: icon,
      onPressed: onPressed,
    );
  }
}
