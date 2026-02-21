import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:trading_app/Presentation_layer/screens/welcome_screens/fourth_screen.dart';

import '../../../Application_layer/constants/app_color.dart';
import '../../../Application_layer/constants/app_font.dart';
import '../../../Application_layer/constants/app_images.dart';
import '../../../Application_layer/constants/app_text.dart';
import '../../../Application_layer/utils/padding.dart';
import '../dashboard_screens/bottom_navigation_screen.dart';
import 'fifth_screen.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({super.key});

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {


  // Timer Declaration
  int timer = 30;
  Timer? _timer;
  bool isTimer = false;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timerInstance) {
      if (timer > 0) {
        setState(() {
          timer --;
        });
      } else {
        _timer?.cancel();
      }
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
              "Trade in progress please wait for results",
              textColor: whiteColor,
              fontSize: 16,
              isCentered: true,
            ),
            SizedBox(height: 20,),

            timer == 0 ?
            ElevatedButton(
              onPressed: () {
                Get.to(FourthScreen());
              },
              style: ElevatedButton.styleFrom(backgroundColor: buttonColor),
              child: text("Done", textColor: whiteColor),
            ) : Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: buttonColor),
              ),
              child: Center(child: text("${timer}", textColor: whiteColor)),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

}
