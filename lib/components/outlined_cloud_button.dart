import 'package:cloud_radar/theme/application_colors.dart';
import 'package:flutter/material.dart';

class OutlinedCloudButton extends StatelessWidget {
  const OutlinedCloudButton({
    super.key,
    this.icon,
    required this.onPressed,
    required this.text,
  });

  final Widget? icon;
  final Function()? onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      label: Text(
        text,
        style: TextStyle(
          color: ApplicationColors.black,
          fontSize: 16,
          fontWeight: FontWeight.w400,
          fontFamily: "DM Sans",
        ),
      ),
      iconAlignment: IconAlignment.end,
      icon: icon,
      style: ButtonStyle(
        side: WidgetStateProperty.all(
          BorderSide(
            color: ApplicationColors.blue,
          ),
        ),
        padding: WidgetStateProperty.all(
          EdgeInsets.all(20),
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      onPressed: onPressed,
    );
  }
}
