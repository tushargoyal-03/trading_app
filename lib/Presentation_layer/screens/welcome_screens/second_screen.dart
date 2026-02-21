import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_app/Application_layer/constants/common_button.dart';
import 'package:trading_app/Presentation_layer/screens/welcome_screens/third_screen.dart';

import '../../../Application_layer/constants/app_color.dart';
import '../../../Application_layer/constants/app_font.dart';
import '../../../Application_layer/constants/app_images.dart';
import '../../../Application_layer/constants/app_text.dart';
import '../../../Application_layer/utils/padding.dart';
import '../dashboard_screens/bottom_navigation_screen.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {

  // Timer Declaration
  Timer? timer;

  void startTimer(){
    timer = Timer(Duration(seconds: 10), (){
      Get.to(ThirdScreen());
    });
  }


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
            InkWell(
              onTap: (){
                Get.to(BottomNavigationScreen());
              },
              child: Align(
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
                    Icon(Icons.flag, color: whiteColor),
                    SizedBox(width: 10),
                    text("EUR/USD", textColor: whiteColor, fontSize: 16),
                    SizedBox(width: 20),
                    text("80%", textColor: buttonColor),
                  ],
                ),
              ),
            ),
            SizedBox(height: 40),

            // Graph Alignment
            Image.asset(AppImages.graphImage),
            SizedBox(height: 20),

            // Trade Text
            text(
              "You should predict whether the char will rise or fall in one minute and buy up or down according to your prediction. If you have prediction, you'll get 80% profit.",
              textColor: whiteColor,
              fontSize: 16,
              isCentered: true,
            ),
            SizedBox(height: 20,),

            // Next button
            Row(
              children: [
                Expanded(child: CustomButton(textHeading: "Put", onTap: (){
                  startTimer();
                }, btnColor: Colors.red, isImage: false, isIcon: true, icon: Icons.arrow_downward,),),
                SizedBox(width: 10,),
                Expanded(child: CustomButton(textHeading: "Call", onTap: (){
                  startTimer();
                }, btnColor: Colors.green, isImage: false, isIcon: true, icon: Icons.arrow_upward,),)
              ],
            ),

          ],
        ),
      ),
    );
  }
}
