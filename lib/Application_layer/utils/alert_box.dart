import 'package:flutter/material.dart';
import '../constants/app_color.dart';
import '../constants/app_text.dart';

void showMyAlertDialog(BuildContext context, String titleText, VoidCallback onPressed) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: whiteColor,
        title: Text(
          'Alert!',
          style: TextStyle(color: Colors.black),
        ),
        content: Text(
          '$titleText',
          style: TextStyle(color: Colors.black54),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: onPressed,
            child: text(
              'OK',
              textColor: buttonColor,
            ),
          ),
        ],
      );
    },
  );
}
