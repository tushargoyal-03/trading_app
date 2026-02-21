import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:trading_app/Presentation_layer/screens/profile_view/settings_screen.dart';

import '../../../Application_layer/constants/app_color.dart';
import '../../../Application_layer/constants/app_font.dart';
import '../../../Application_layer/constants/app_text.dart';
import 'deposit_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
                text("Account",textColor: whiteColor,fontSize: 18,fontWeight: FontWeight.w600,fontFamily: AppFontFamily.poppinsBold),
                const Icon(Icons.notifications_outlined,color: buttonColor,),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: buttonColor
                    ),
                    child: Icon(Icons.person,size: 30,color: whiteColor,),
                  ),
                  SizedBox(width: 20,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      text("Vikash Pradhan",textColor: whiteColor,fontSize: 18,fontWeight: FontWeight.w600,
                          fontFamily: AppFontFamily.poppinsBold),
                      text("9969969696",textColor: whiteColor,fontSize: 15,fontWeight: FontWeight.w400,
                          fontFamily: AppFontFamily.poppinsRegular),
                      text("View Profile ",textColor: buttonColor,fontSize: 16,fontWeight: FontWeight.w600,
                          fontFamily: AppFontFamily.poppinsBold),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 30,),
              Card(
                color: whiteColor,
                elevation: .5,
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.account_balance_wallet,color: buttonColor,),
                              SizedBox(width: 20,),
                              text("Balance",textColor: blackColor,fontSize: 16,fontWeight: FontWeight.w500,
                                  fontFamily: AppFontFamily.poppinsSansMedium),
                            ],
                          ),
                          text("₹0.00",textColor: blackColor,fontSize: 16,fontWeight: FontWeight.w500,
                              fontFamily: AppFontFamily.poppinsSansMedium),
                          ],
                      ),
                      SizedBox(height: 10,),
                      Divider(thickness: 1,),
                      InkWell(
                        onTap: (){
                          Get.to(DepositScreen());
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.balance_outlined,color: buttonColor,),
                                SizedBox(width: 20,),
                                text("Deposit",textColor: blackColor,fontSize: 16,fontWeight: FontWeight.w500,
                                    fontFamily: AppFontFamily.poppinsSansMedium),
                              ],
                            ),
                            Icon(Icons.arrow_forward_ios_outlined,color: buttonColor,),
                          ],
                        ),
                      ),
                      SizedBox(height: 10,),
                      Divider(thickness: 1,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.monetization_on_outlined,color: buttonColor,),
                              SizedBox(width: 20,),
                              text("Transactions",textColor: blackColor,fontSize: 16,fontWeight: FontWeight.w500,
                                  fontFamily: AppFontFamily.poppinsSansMedium),
                            ],
                          ),
                          Icon(Icons.arrow_forward_ios_outlined,color: buttonColor,),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 30,),
              Card(
                color: whiteColor,
                elevation: .5,
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.info_outline,color: buttonColor,),
                              SizedBox(width: 20,),
                              text("About",textColor: blackColor,fontSize: 16,fontWeight: FontWeight.w500,
                                  fontFamily: AppFontFamily.poppinsSansMedium),
                            ],
                          ),
                          Icon(Icons.arrow_forward_ios_outlined,color: buttonColor,),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Divider(thickness: 1,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.feedback_outlined,color: buttonColor,),
                              SizedBox(width: 20,),
                              text("Feedback",textColor: blackColor,fontSize: 16,fontWeight: FontWeight.w500,
                                  fontFamily: AppFontFamily.poppinsSansMedium),
                            ],
                          ),
                          Icon(Icons.arrow_forward_ios_outlined,color: buttonColor,),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Divider(thickness: 1,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.watch_later,color: buttonColor,),
                              SizedBox(width: 20,),
                              text("Tutorials",textColor: blackColor,fontSize: 16,fontWeight: FontWeight.w500,
                                  fontFamily: AppFontFamily.poppinsSansMedium),
                            ],
                          ),
                          Icon(Icons.arrow_forward_ios_outlined,color: buttonColor,),
                        ],
                      ),

                      SizedBox(height: 10,),
                      Divider(thickness: 1,),
                      InkWell(
                        onTap: (){
                          Get.to(SettingsScreen());
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.settings,color: buttonColor,),
                                SizedBox(width: 20,),
                                text("Settings",textColor: blackColor,fontSize: 16,fontWeight: FontWeight.w500,
                                    fontFamily: AppFontFamily.poppinsSansMedium),
                              ],
                            ),
                            Icon(Icons.arrow_forward_ios_outlined,color: buttonColor,),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),


              SizedBox(height: 20,),
              Container(
                width: MediaQuery.sizeOf(context).width,
                padding: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: buttonColor.withOpacity(.1),

                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.logout,color: buttonColor,),
                    SizedBox(width: 20,),
                    text("Logout",textColor: whiteColor,fontSize: 18,fontWeight: FontWeight.w500,
                        fontFamily: AppFontFamily.poppinsSansMedium),
                  ],
                ),

              )
            ],
          ),
        ),
      ),
    );
  }
}
