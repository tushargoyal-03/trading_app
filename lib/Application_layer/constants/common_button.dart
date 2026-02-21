import 'package:flutter/material.dart';

import 'app_color.dart';
import 'app_font.dart';
import 'app_images.dart';
import 'app_text.dart';

class CustomButton extends StatelessWidget {
  final String textHeading;
  final VoidCallback onTap;
  final Color btnColor;
  bool? isImage;
  bool? isBorder;

  CustomButton({
    super.key,
    required this.textHeading,
    required this.onTap,
    this.isImage,
    required this.btnColor,
    this.isBorder,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        decoration: BoxDecoration(
          color: btnColor,
          border: isBorder == true ? Border.all(color: whiteColor, width: 2) : Border.all(color: Colors.transparent),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image
            isImage == true ? Image.asset(AppImages.googleIcon) : Container(),
            SizedBox(width: 15),
            text(
              "$textHeading",
              textColor: whiteColor,
              fontWeight: FontWeight.w800,
              fontFamily: AppFontFamily.poppinsBold,
              fontSize: 18,
              textAlign: TextAlign.start,
            ),
          ],
        ),
      ),
    );
  }
}
