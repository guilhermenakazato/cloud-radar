import 'package:cloud_radar/theme/application_colors.dart';
import 'package:flutter/material.dart';

class FilledCloudButton extends StatelessWidget {
  const FilledCloudButton({
    super.key,
    required this.onPressed,
    required this.text,
  });

  final Function()? onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(
          ApplicationColors.blue,
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
      child: Text(
        text,
        style: TextStyle(
          color: ApplicationColors.white,
          fontSize: 16,
          fontWeight: FontWeight.w400,
          fontFamily: "DM Sans",
        ),
      ),
    );
  }
}
