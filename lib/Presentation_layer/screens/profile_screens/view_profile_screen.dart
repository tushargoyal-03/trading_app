import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:trading_app/Application_layer/constants/app_color.dart';
import 'package:trading_app/Application_layer/utils/padding.dart';
import 'package:trading_app/Presentation_layer/screens/kyc_screens/basic_kyc_screen.dart';

import '../../../Application_layer/constants/app_font.dart';
import '../../../Application_layer/constants/app_text.dart';
import '../kyc_screens/pan_kyc_screen.dart';

class ViewProfileScreen extends StatefulWidget {
  const ViewProfileScreen({super.key});

  @override
  State<ViewProfileScreen> createState() => _ViewProfileScreenState();
}

class _ViewProfileScreenState extends State<ViewProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: bgColor,
        appBar: AppBar(
          backgroundColor: bgColor,
          centerTitle: true,
          title: text("Profile Settings",
              fontSize: 22,
              fontWeight: FontWeight.w700,
              fontFamily: AppFontFamily.poppinsBold,
              textColor: whiteColor),
        ),
        body: Column(
          children: [
            Card(
              color: buttonColor.withOpacity(0.1),
              child: Padding(
                padding: AppPadding.screenPadding,
                child: Column(
                  children: [
                    Center(
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            color: buttonColor),
                        child: Icon(
                          Icons.person,
                          size: 30,
                          color: whiteColor,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    text("User Profile",
                        textColor: whiteColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        fontFamily: AppFontFamily.poppinsBold),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              text('User ID',
                                  fontSize: 10,
                                  fontFamily: AppFontFamily.poppinsRegular,
                                  textColor: iconColor),
                              text('899987238331',
                                  fontFamily: AppFontFamily.poppinsRegular,
                                  textColor: whiteColor),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              text('Register Date',
                                  fontSize: 10,
                                  fontFamily: AppFontFamily.poppinsRegular,
                                  textColor: iconColor),
                              text('21 Feb 2026',
                                  fontFamily: AppFontFamily.poppinsRegular,
                                  textColor: whiteColor),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
      
            // Basic KYC
            Card(
              color: buttonColor.withOpacity(0.1),
              child: Padding(
                padding: AppPadding.screenPadding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.supervised_user_circle,
                          color: whiteColor,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        text('Basic KYC',
                            fontFamily: AppFontFamily.poppinsRegular,
                            textColor: whiteColor),
                        Spacer(),
                        text('Not certified',
                            fontFamily: AppFontFamily.poppinsRegular,
                            textColor: buttonColor),
                      ],
                    ),
                    Divider(),
                    text("You have not completed Basic KYC.",
                        textColor: whiteColor,
                        fontWeight: FontWeight.w600,
                        fontFamily: AppFontFamily.poppinsBold),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 4,
                          child: text(
                              'You should complete Basic KYC to start trading.',
                              fontSize: 12,
                              fontFamily: AppFontFamily.poppinsRegular,
                              textColor: iconColor),
                        ),
                        Expanded(
                          flex: 3,
                          child: ElevatedButton(
                            onPressed: () {
                              Get.to(() => BasicKycScreen());
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: buttonColor),
                            child: text("Go to Complete",
                                textColor: whiteColor, fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
      
            // Pan card
            Card(
              color: buttonColor.withOpacity(0.1),
              child: Padding(
                padding: AppPadding.screenPadding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.supervised_user_circle,
                          color: whiteColor,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        text('KYC Based on PAN Card',
                            fontFamily: AppFontFamily.poppinsRegular,
                            textColor: whiteColor),
                        Spacer(),
                        text('Not certified',
                            fontFamily: AppFontFamily.poppinsRegular,
                            textColor: buttonColor),
                      ],
                    ),
                    Divider(),
                    text("You have not completed PAN Card KYC.",
                        textColor: whiteColor,
                        fontWeight: FontWeight.w600,
                        fontFamily: AppFontFamily.poppinsBold),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 4,
                          child: text(
                              'You should complete PAN Card KYC to get withdraw.',
                              fontSize: 12,
                              fontFamily: AppFontFamily.poppinsRegular,
                              textColor: iconColor),
                        ),
                        Expanded(
                          flex: 3,
                          child: ElevatedButton(
                            onPressed: () {
                              Get.to(() => PanKycScreen());
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: buttonColor),
                            child: text("Go to Complete",
                                textColor: whiteColor, fontSize: 12),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
