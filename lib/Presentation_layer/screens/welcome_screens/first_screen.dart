import 'package:flutter/material.dart';
import 'package:trading_app/Application_layer/constants/app_color.dart';
import 'package:trading_app/Application_layer/constants/app_font.dart';
import 'package:trading_app/Application_layer/constants/app_images.dart';
import 'package:trading_app/Application_layer/constants/app_text.dart';
import 'package:trading_app/Application_layer/utils/padding.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: bgColor,
        title: text(
          "How to trade",
          textColor: whiteColor,
          fontWeight: FontWeight.w600,
          fontFamily: AppFontFamily.poppinsBold,
          fontSize: 22,
        ),
      ),
      body: Padding(
        padding: AppPadding.screenPadding,
        child: Column(
          children: [

            // Skip Button
            Align(
              alignment: Alignment.topRight,
              child: Container(
                padding: AppPadding.loginContainerPadding,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(21),
                  border: Border.all(color: whiteColor, width: 2),
                ),
                child: text("Skip", textColor: whiteColor),
              ),
            ),

            // Trade Details
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                padding: AppPadding.loginContainerPadding,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(11),
                  border: Border.all(color: whiteColor, width: 2),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.flag, color: whiteColor,),
                    SizedBox(width: 10,),
                    text("Skip", textColor: whiteColor, fontSize: 16),
                    SizedBox(width: 20,),
                    text("80%", textColor: buttonColor),
                  ],
                ),
              ),
            ),
            SizedBox(height: 40,),

            // Graph Alignment
            Image.asset(AppImages.graphImage),

            // Trade Text
            text("The chart shows price trends of asset - EUR/USD. If the chart goes up, the price", textColor: whiteColor, fontSize: 16),

          ],
        ),
      ),
    );
  }
}
