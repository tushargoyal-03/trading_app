import 'package:flutter/material.dart';
import 'app_color.dart';
import 'app_font.dart';


Widget text(
    String text, {
      double fontSize = 14.0,
      Color textColor = blackColor,
      String fontFamily = AppFontFamily.poppinsRegular,
      FontWeight fontWeight = FontWeight.normal,
      FontStyle fontStyle = FontStyle.normal,
      TextAlign textAlign = TextAlign.center,
      bool isCentered = false,
      int maxLine = 200,
      bool lineThrough = false,
      double latterSpacing = 0.0,
      bool textAllCaps = false,
      bool isLongText = false,
    }) {
  return Text(
    textAllCaps ? text.toUpperCase() : text,
    textAlign: isCentered ? TextAlign.center : TextAlign.start,
    maxLines: isLongText ? null : maxLine,
    overflow: TextOverflow.ellipsis,
    softWrap: true,
    style: TextStyle(
      color: textColor,
      fontFamily: fontFamily,
      fontSize: fontSize,
      fontWeight: fontWeight,
      fontStyle: fontStyle,
      decoration: lineThrough ? TextDecoration.lineThrough : TextDecoration.none,
      // height: 1.5,
      letterSpacing: latterSpacing,
    ),
  );
}