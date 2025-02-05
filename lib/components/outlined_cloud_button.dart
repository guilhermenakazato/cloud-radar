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
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          fontFamily: "DM Sans",
        ),
      ),
      iconAlignment: IconAlignment.end,
      icon: icon,
      onPressed: onPressed,
    );
  }
}
