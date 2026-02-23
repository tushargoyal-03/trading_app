import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_app/Application_layer/constants/app_color.dart';
import 'package:trading_app/Application_layer/constants/app_font.dart';
import 'package:trading_app/Application_layer/constants/app_images.dart';
import 'package:trading_app/Application_layer/constants/app_text.dart';
import 'package:trading_app/Application_layer/constants/common_button.dart';
import 'package:trading_app/Application_layer/utils/padding.dart';
import 'package:trading_app/Presentation_layer/screens/dashboard_screens/bottom_navigation_screen.dart';
import 'package:trading_app/Presentation_layer/screens/welcome_screens/second_screen.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
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
              SizedBox(height: 20,),
      
              // Trade Text
              text("The chart shows price trends of asset - EUR/USD. If the chart goes up, the price rises. If it goes down, the price falls.", textColor: whiteColor, fontSize: 16, isCentered: true),
              SizedBox(height: 20,),
      
      
              // Next button
              ElevatedButton(
                onPressed: () {
                  Get.to(() => SecondScreen());
                },
                style: ElevatedButton.styleFrom(backgroundColor: buttonColor),
                child: text("Done", textColor: whiteColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
