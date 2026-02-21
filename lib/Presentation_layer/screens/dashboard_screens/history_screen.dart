import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_app/Presentation_layer/screens/dashboard_screens/trade_screen.dart';

import '../../../Application_layer/constants/app_color.dart';
import '../../../Application_layer/constants/app_font.dart';
import '../../../Application_layer/constants/app_images.dart';
import '../../../Application_layer/constants/app_text.dart';
import '../../../Application_layer/utils/padding.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  int selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        title: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: whiteColor, width: 2),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    selectedIndex = 0;
                    setState(() {});
                  },
                  child: Container(
                    color: selectedIndex == 0 ? whiteColor : Colors.transparent,
                    child: Center(
                        child: text("REAL ACCOUNT",
                            textColor:
                                selectedIndex == 0 ? bgColor : whiteColor)),
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    selectedIndex = 1;
                    setState(() {});
                  },
                  child: Container(
                    color: selectedIndex == 1 ? whiteColor : Colors.transparent,
                    child: Center(
                        child: text("DEMO ACCOUNT",
                            textColor:
                                selectedIndex == 0 ? whiteColor : bgColor)),
                  ),
                ),
              ),
            ],
          ),
        ),
        automaticallyImplyLeading: false,
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
                        Container(
                          child: Row(
                            children: [
                              Icon(Icons.format_textdirection_l_to_r, color: whiteColor,),
                              SizedBox(width: 10,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  text("EUR/THB (OTC)", textColor: whiteColor, fontSize: 16),
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal: 10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(color: buttonColor),
                                    ),
                                    child: text("82%", textColor: whiteColor, fontSize: 12),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        Container(
                          child: Column(
                            children: [
                              text("Investment Amount", textColor: iconColor, fontSize: 12),
                              Row(
                                children: [
                                  Icon(Icons.arrow_upward, color: Colors.green,),
                                  text("₹ 5,000.00", textColor: whiteColor, fontSize: 16),
                                  SizedBox(width: 10,),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30,),

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

                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
