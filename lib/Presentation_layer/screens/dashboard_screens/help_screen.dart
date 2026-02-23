import 'package:flutter/material.dart';
import 'package:trading_app/Application_layer/constants/app_color.dart';

import '../../../Application_layer/constants/app_font.dart';
import '../../../Application_layer/constants/app_text.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({super.key});

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
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
                  Expanded(
                      child: text("Help",textColor: whiteColor,
                          isCentered: true,
                          fontSize: 18,fontWeight: FontWeight.w600,
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
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: whiteColor
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.message,color: bgColor,),
                    SizedBox(width: 20,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        text("Email",textColor: blackColor,
                            isCentered: true,
                            fontSize: 18,fontWeight: FontWeight.w600,
                            fontFamily: AppFontFamily.poppinsSansMedium),
                        SizedBox(height: 5,),
                        text("support@jigrotech.com",textColor: blackColor,
                            isCentered: true,
                            fontSize: 18,fontWeight: FontWeight.w600,
                            fontFamily: AppFontFamily.poppinsBold),
      
                        SizedBox(height: 10,),
                        text("You will get a response within 1 business day",
                            textColor: iconColor,
                            isCentered: true,
                            fontSize: 13,fontWeight: FontWeight.w400,
                            fontFamily: AppFontFamily.poppinsRegular),
                      ],
                    )
                  ],
                ),
      
              ),
              SizedBox(height: 15,),
      
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: whiteColor
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.online_prediction,color: bgColor,),
                    SizedBox(width: 20,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        text("Online Support",textColor: blackColor,
                            isCentered: true,
                            fontSize: 18,fontWeight: FontWeight.w600,
                            fontFamily: AppFontFamily.poppinsSansMedium),
                        SizedBox(height: 5,),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: buttonColor)
                          ),
                          child: text("Ask a question online",textColor: buttonColor,
                              isCentered: true,
                              fontSize: 18,fontWeight: FontWeight.w600,
                              fontFamily: AppFontFamily.poppinsBold),
                        ),
      
                        SizedBox(height: 10,),
                        text("Avaliable from 9.00 to 17.00",
                            textColor: iconColor,
                            isCentered: true,
                            fontSize: 13,fontWeight: FontWeight.w400,
                            fontFamily: AppFontFamily.poppinsRegular),
                      ],
                    )
                  ],
                ),
      
              ),
              SizedBox(height: 15,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: whiteColor
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.help_outline,color: bgColor,),
                    SizedBox(width: 20,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        text("FAQ",textColor: blackColor,
                            isCentered: true,
                            fontSize: 18,fontWeight: FontWeight.w600,
                            fontFamily: AppFontFamily.poppinsSansMedium),
                        SizedBox(height: 5,),
      
                        text("Open knowledge base",
                            textColor: iconColor,
                            isCentered: true,
                            fontSize: 13,fontWeight: FontWeight.w400,
                            fontFamily: AppFontFamily.poppinsRegular),
                      ],
                    )
                  ],
                ),
      
              ),
            ],
          ),
        ),
      ),
    );
  }
}