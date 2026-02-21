import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Application_layer/constants/app_color.dart';
import '../../../Application_layer/constants/app_font.dart';
import '../../../Application_layer/constants/app_text.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  // DECLARING VARIABLES
  bool isNotification = false;
  bool isTakeTrade = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(55),
        child: Padding(
          padding:
              const EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 10),
          child: SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: const Icon(
                      Icons.arrow_back_ios,
                      color: whiteColor,
                    )),
                Expanded(
                    child: text("Settings",
                        textColor: whiteColor,
                        isCentered: true,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        fontFamily: AppFontFamily.poppinsBold)),
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            text("Platform",
                textColor: whiteColor,
                isCentered: true,
                fontSize: 18,
                fontWeight: FontWeight.w600,
                fontFamily: AppFontFamily.poppinsBold),

            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: whiteColor),
              child: Row(
                children: [
                  Icon(
                    Icons.message,
                    color: iconColor,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      text("Notification",
                          textColor: blackColor,
                          isCentered: true,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          fontFamily: AppFontFamily.poppinsRegular),
                      text(
                          "Notifiy me on anything about \npromo events, accounts activities \nmarket data online support chats and etc.",
                          textColor: iconColor,
                          maxLine: 3,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          fontFamily: AppFontFamily.poppinsRegular),
                    ],
                  ),
                  Spacer(),
                  Switch(
                      value: isNotification,
                      activeColor: buttonColor,
                      onChanged: (notificationValue) {
                        setState(() {
                          isNotification = notificationValue;
                        });
                      }),
                ],
              ),
            ),

            SizedBox(height: 40,),

            // Trade
            text("Trade",
                textColor: whiteColor,
                isCentered: true,
                fontSize: 18,
                fontWeight: FontWeight.w600,
                fontFamily: AppFontFamily.poppinsBold),

            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: whiteColor),
              child: Row(
                children: [
                  Icon(
                    Icons.area_chart,
                    color: iconColor,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      text("Buy in one click",
                          textColor: blackColor,
                          isCentered: true,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          fontFamily: AppFontFamily.poppinsRegular),
                      text(
                          "Open a trade without confirmation.",
                          textColor: iconColor,
                          maxLine: 3,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          fontFamily: AppFontFamily.poppinsRegular),
                    ],
                  ),
                  Spacer(),
                  Switch(
                      value: isTakeTrade,
                      activeColor: buttonColor,
                      onChanged: (takeTradeValue) {
                        setState(() {
                          isTakeTrade = takeTradeValue;
                        });
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
