import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:trading_app/Application_layer/constants/app_color.dart';
import 'package:trading_app/Application_layer/constants/app_font.dart';
import 'package:trading_app/Application_layer/constants/app_images.dart';
import 'package:trading_app/Application_layer/constants/app_text.dart';
import 'package:trading_app/Application_layer/utils/padding.dart';

import '../dashboard_screens/bottom_navigation_screen.dart';

class FifthScreen extends StatefulWidget {
  const FifthScreen({super.key});

  @override
  State<FifthScreen> createState() => _FifthScreenState();
}

class _FifthScreenState extends State<FifthScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: bgColor,
        appBar: AppBar(backgroundColor: bgColor),
      
        body: Padding(
          padding: AppPadding.screenPadding,
          child: Column(
            children: [
              Center(
                child: text(
                  "Demo",
                  textColor: buttonColor,
                  fontWeight: FontWeight.w800,
                  fontFamily: AppFontFamily.poppinsBold,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: text(
                  "₹ 10000.00",
                  textColor: whiteColor,
                  fontWeight: FontWeight.w600,
                  fontFamily: AppFontFamily.poppinsBold,
                  fontSize: 25,
                ),
              ),
              SizedBox(height: 40),
      
              Center(
                child: text(
                  "You have received ₹ 10000.00 free practice funds in your demo account. Quickly go and practise more to improve your trading skills.",
                  textColor: whiteColor,
                  fontWeight: FontWeight.w400,
                  fontFamily: AppFontFamily.poppinsSansMedium,
                  fontSize: 18,
                  isCentered: true,
                ),
              ),
              SizedBox(height: 20),
      
      
              // Go to trade
              ElevatedButton(
                onPressed: () {
                  Get.to(() => BottomNavigationScreen());
                },
                style: ElevatedButton.styleFrom(backgroundColor: buttonColor),
                child: text("Done", textColor: whiteColor),
              ),
              SizedBox(height: 40),
      
      
      
              Center(
                child: text(
                  "New to trading and want to learn about it? Please check and watch the video below.",
                  textColor: whiteColor,
                  fontWeight: FontWeight.w500,
                  fontFamily: AppFontFamily.poppinsSansMedium,
                  fontSize: 18,
                  isCentered: true
                ),
              ),
              SizedBox(height: 40),
      
              Center(child: Image.asset(AppImages.tradeVideo)),
            ],
          ),
        ),
      ),
    );
  }
}
