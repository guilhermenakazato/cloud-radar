import 'package:cloud_radar/components/filled_cloud_button.dart';
import 'package:cloud_radar/components/outlined_cloud_button.dart';
import 'package:cloud_radar/theme/application_colors.dart';
import 'package:cloud_radar/theme/cloud_radar_icons.dart';
import 'package:flutter/material.dart';

class CloudRadarDialog {
  CloudRadarDialog._();

  static void showDialog({
    required BuildContext context,
    required String titleText,
    required String contentText,
    required String confirmButtonText,
    required String declineButtonText,
    required Function()? onConfirm,
    required Function()? onDecline,
  }) {
    showGeneralDialog(
      transitionBuilder: (
        context,
        animation,
        secondaryAnimation,
        dialogWidget,
      ) {
        final screenHeight = MediaQuery.of(context).size.height;
        final curvedAnimation = CurvedAnimation(
          parent: animation,
          curve: Curves.easeInOut,
        );

        final translateY = (1 - curvedAnimation.value) * screenHeight;

        return Transform.translate(
          offset: Offset(0, translateY),
          child: Opacity(
            opacity: curvedAnimation.value,
            child: dialogWidget,
          ),
        );
      },
      transitionDuration: const Duration(milliseconds: 400),
      barrierDismissible: false,
      context: context,
      pageBuilder: (context, animation1, animation2) {
        return AlertDialog(
          contentPadding: const EdgeInsets.all(20),
          backgroundColor: ApplicationColors.blue900,
          title: Center(
            child: Text(
              titleText,
              style: const TextStyle(
                color: ApplicationColors.orange500,
                fontFamily: "DM Sans",
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          content: Text(
            contentText,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: ApplicationColors.white,
              fontFamily: "DM Sans",
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          actions: <Widget>[
            Row(
              spacing: 10,
              children: [
                Expanded(
                  child: FilledCloudButton(
                    onPressed: onConfirm,
                    text: "Ver planos",
                    icon: const Icon(
                      CloudRadarIcons.assinatura,
                    ),
                  ),
                ),
                Expanded(
                  child: OutlinedCloudButton(
                    text: declineButtonText,
                    onPressed: onDecline,
                    textColor: ApplicationColors.white,
                  ),
                ),
              ],
            )
          ],
        );
      },
    );
  }
}
