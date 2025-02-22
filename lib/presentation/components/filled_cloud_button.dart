import 'package:cloud_radar/presentation/theme/application_colors.dart';
import 'package:flutter/material.dart';

class FilledCloudButton extends StatelessWidget {
  const FilledCloudButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.icon, this.textColor = ApplicationColors.white,
  });

  final Function()? onPressed;
  final String text;
  final Icon? icon;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return FilledButton.icon(
      onPressed: onPressed,
      label: Text(
        text,
        style: const TextStyle(
          color: ApplicationColors.white,
          fontSize: 16,
          fontWeight: FontWeight.w400,
          fontFamily: "DM Sans",
        ),
      ),
      iconAlignment: IconAlignment.end,
      icon: icon,
    );
  }
}
