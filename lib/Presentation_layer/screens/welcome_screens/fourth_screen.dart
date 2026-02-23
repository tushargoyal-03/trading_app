import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:trading_app/Presentation_layer/screens/welcome_screens/fifth_screen.dart';
import 'package:trading_app/Presentation_layer/screens/welcome_screens/second_screen.dart';
import '../../../Application_layer/constants/app_color.dart';
import '../../../Application_layer/constants/app_font.dart';
import '../../../Application_layer/constants/app_images.dart';
import '../../../Application_layer/constants/app_text.dart';
import '../../../Application_layer/utils/padding.dart';
import '../dashboard_screens/bottom_navigation_screen.dart';

class FourthScreen extends StatefulWidget {
  const FourthScreen({super.key});

  @override
  State<FourthScreen> createState() => _FourthScreenState();
}

class _FourthScreenState extends State<FourthScreen> {
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
              SizedBox(height: 20,),
      
              // Trade Details
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
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
                  Column(
                    children: [
                      text(
                        "Investment amount",
                        textColor: iconColor,
                        isCentered: true,
                      ),
                      Row(
                        children: [
                          Icon(Icons.arrow_upward, color: Colors.green,),
                          text(
                            "+₹1,000",
                            textColor: whiteColor,
                            isCentered: true,
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                          ),
                        ],
                      ),
                    ],
                  )
      
                ],
              ),
              SizedBox(height: 40),
      
              // Graph Alignment
              Image.asset(AppImages.graphImage),
              SizedBox(height: 20),
      
      
              // Details 1st row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
      
                  // Opening Price
                  Column(
                    children: [
                      text(
                        "Opening Price",
                        textColor: iconColor,
                        isCentered: true,
                      ),
                      text(
                        "1.15555555",
                        textColor: whiteColor,
                        isCentered: true,
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                      ),
                    ],
                  ),
      
      
                  // Opening time
                  Column(
                    children: [
                      text(
                        "Opening time",
                        textColor: iconColor,
                        isCentered: true,
                      ),
                      text(
                        "14:33:02:387",
                        textColor: whiteColor,
                        isCentered: true,
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                      ),
                    ],
                  ),
      
                  // Profit
                  Column(
                    children: [
                      text(
                        "Profit",
                        textColor: iconColor,
                        isCentered: true,
                      ),
                      text(
                        "+₹8,000",
                        textColor: Colors.green,
                        isCentered: true,
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
      
              // Details 2nd row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
      
                  // Closing Price
                  Column(
                    children: [
                      text(
                        "Closing Price",
                        textColor: iconColor,
                        isCentered: true,
                      ),
                      text(
                        "1.15555555",
                        textColor: whiteColor,
                        isCentered: true,
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
      
                  // Closing time
                  Column(
                    children: [
                      text(
                        "Closing time",
                        textColor: iconColor,
                        isCentered: true,
                      ),
                      text(
                        "14:37:02:387",
                        textColor: whiteColor,
                        isCentered: true,
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                      ),
                    ],
                  ),
      
                  // Income
                  Column(
                    children: [
                      text(
                        "Income",
                        textColor: iconColor,
                        isCentered: true,
                      ),
                      text(
                        "₹18,00",
                        textColor: whiteColor,
                        isCentered: true,
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
      
              // Closed Status
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
      
                  // Status
                  Column(
                    children: [
                      text(
                        "Status",
                        textColor: iconColor,
                        isCentered: true,
                      ),
                      text(
                        "Closed with profit",
                        textColor: whiteColor,
                        isCentered: true,
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                      ),
                    ],
                  ),
      
                  // Track Id
                  Column(
                    children: [
                      text(
                        "Track Id",
                        textColor: iconColor,
                        isCentered: true,
                      ),
                      text(
                        "410233848833912",
                        textColor: whiteColor,
                        isCentered: true,
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                      ),
                    ],
                  ),
                ],
              ),
      
              SizedBox(height: 20),
      
      
              // Trade Text
              text(
                "First trade complete know you know how to put a trade.",
                textColor: whiteColor,
                fontSize: 16,
                isCentered: true,
              ),
              SizedBox(height: 20,),
      
      
              // Done button
              ElevatedButton(
                onPressed: () {
                  Get.to(() => FifthScreen());
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
