import 'package:flutter/material.dart';

class CloudRadarDialog {
  CloudRadarDialog._();

  static void showDialog({
    required BuildContext context,
    required Widget title,
    required Widget content,
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
          title: title,
          content: content,
          actions: <Widget>[
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: onConfirm,
                    child: Text(confirmButtonText),
                  ),
                ),
                Expanded(
                  child: TextButton(
                    onPressed: onDecline,
                    child: Text(declineButtonText),
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
