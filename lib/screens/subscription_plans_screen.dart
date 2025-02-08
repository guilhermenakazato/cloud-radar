import 'package:cloud_radar/components/cloud_appbar.dart';
import 'package:cloud_radar/theme/application_colors.dart';
import 'package:flutter/material.dart';

class SubscriptionPlansScreen extends StatelessWidget {
  const SubscriptionPlansScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ApplicationColors.black800,
      appBar: CloudAppbar(titleText: "Planos"),
      body: Center(
        child: Text(
          "Hello World",
          style: TextStyle(
            color: ApplicationColors.white,
            fontFamily: "DM Sans",
            fontWeight: FontWeight.w800,
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}
