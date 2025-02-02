import 'package:flutter/material.dart';

class Dialog {
  Dialog._();

  void showDialog(BuildContext context) {
    showGeneralDialog(
    transitionBuilder: (context, a1, a2, widget) {
      final curvedValue = Curves.easeInOutBack.transform(a1.value) -   1.0;
      return Transform(
        transform: Matrix4.translationValues(0.0, curvedValue * 200, 0.0),
        child: Opacity(
          opacity: a1.value,
          child: AlertDialog(
            shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.0),),
            title: Text('Hello!!'),
            content: Text('How are you?'),
          ),
        ),
      );
    },
    transitionDuration: Duration(milliseconds: 200),
    barrierDismissible: true,
    barrierLabel: '',
    context: context,
    pageBuilder: (context, animation1, animation2) {});
  }
}
