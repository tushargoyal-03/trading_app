import 'package:flutter/material.dart';
import 'package:trading_app/Application_layer/constants/app_color.dart';
import 'package:trading_app/Application_layer/constants/app_font.dart';
import 'package:trading_app/Application_layer/constants/app_images.dart';
import 'package:trading_app/Application_layer/constants/app_text.dart';
import 'package:trading_app/Application_layer/utils/padding.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
            "News feed",
            textColor: whiteColor,
            fontWeight: FontWeight.w600,
            fontFamily: AppFontFamily.poppinsBold,
            fontSize: 22,
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: AppPadding.screenPadding,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: 10,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (_, index){
                return Container(
                  padding: AppPadding.loginContainerPadding,
                  margin: EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                    color: buttonColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(11),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(Icons.format_textdirection_l_to_r, color: whiteColor,),
                          SizedBox(width: 10,),
                          text("Action Forex", textColor: whiteColor, fontSize: 16),
                        ],
                      ),
                      SizedBox(height: 10,),
          
                      Image.asset(AppImages.graphImage),
                      SizedBox(height: 10,),
          
                      text(
                        "GBP/JPY marks a major top - will it revert to 200.00?",
                        textColor: whiteColor,
                        fontWeight: FontWeight.w600,
                        fontFamily: AppFontFamily.poppinsBold,
                        fontSize: 22,
                      ),
                      SizedBox(height: 10,),
          
                      text(
                        "GBP/JPY us a historically popular pair in forex trading, as it is one of the most volatile products to trade and captures",
                        textColor: whiteColor,
                        fontWeight: FontWeight.w300,
                        fontFamily: AppFontFamily.poppinsRegular,
                        fontSize: 16,
                      ),
                      SizedBox(height: 20,),
          
                      // Captions
                      Row(
                        children: [
                          Container(
                            padding: AppPadding.loginContainerPadding,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(21),
                              color: buttonColor.withOpacity(0.2),
                            ),
                            child: text("Japan", textColor: whiteColor),
                          ),
                          SizedBox(width: 10,),
          
          
                          Container(
                            padding: AppPadding.loginContainerPadding,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(21),
                              color: buttonColor.withOpacity(0.2),
                            ),
                            child: text("United Kingdom", textColor: whiteColor),
                          ),
                          Spacer(),
          
                          text("4 hours ago", textColor: iconColor),
                        ],
                      ),
                      SizedBox(height: 20,),
          
                      // Like and views details
                      Row(
                        children: [
                          Icon(Icons.thumb_up_alt_rounded, color: iconColor,),
                          SizedBox(width: 10,),
                          text("Like it", textColor: whiteColor),
                          Spacer(),
          
          
                          Icon(Icons.remove_red_eye, color: iconColor,),
                          SizedBox(width: 10,),
                          text("2113", textColor: whiteColor),
                        ],
                      ),
          
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
