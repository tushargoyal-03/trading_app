import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:trading_app/Application_layer/constants/app_color.dart';
import 'package:trading_app/Application_layer/constants/app_font.dart';
import 'package:trading_app/Application_layer/constants/app_text.dart';
import 'package:trading_app/Application_layer/utils/padding.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({super.key});

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  var format = DateFormat.MONTH_DAY;
  late String dayAndDate;
  late String dayAndDate2;
  late String time;

  @override
  void initState() {
    super.initState();

    DateTime now = DateTime.now();
    dayAndDate = DateFormat('EEEE, d').format(now);
    dayAndDate2 = DateFormat('EEEE, d').format(now);
    time = DateFormat('HH:mm').format(now);
  }

  @override
  Widget build(BuildContext context) {

    print("TIME : $time");

    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: bgColor,
        appBar: AppBar(
          backgroundColor: bgColor,
          centerTitle: true,
          title: text("Transactions",
              fontSize: 22,
              fontWeight: FontWeight.w700,
              fontFamily: AppFontFamily.poppinsBold,
              textColor: whiteColor),
        ),
        body: Column(
          children: [
            // Period
            Container(
              width: Get.width,
              child: Card(
                color: buttonColor.withOpacity(0.1),
                child: Padding(
                  padding: AppPadding.loginContainerPadding,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      text("Period", textColor: iconColor),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: AppPadding.loginContainerPadding,
                            decoration: BoxDecoration(
                              border: Border.all(color: buttonColor),
                              borderRadius: BorderRadius.circular(11),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.calendar_month,
                                  color: whiteColor,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                text("$dayAndDate", textColor: whiteColor),
                              ],
                            ),
                          ),
                          Container(
                            padding: AppPadding.loginContainerPadding,
                            decoration: BoxDecoration(
                              border: Border.all(color: buttonColor),
                              borderRadius: BorderRadius.circular(11),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.calendar_month,
                                  color: whiteColor,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                text("$dayAndDate2", textColor: whiteColor),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
      
            // Transaction type
            Container(
              width: Get.width,
              child: Card(
                color: buttonColor.withOpacity(0.1),
                child: Padding(
                  padding: AppPadding.loginContainerPadding,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      text("Transaction Type", textColor: iconColor),
                      SizedBox(
                        height: 20,
                      ),
      
                      Container(
                        padding: AppPadding.loginContainerPadding,
                        decoration: BoxDecoration(
                          border: Border.all(color: buttonColor),
                          borderRadius: BorderRadius.circular(11),
                        ),
                        child: Row(
                          children: [
                            text('All transactions', textColor: whiteColor, fontSize: 16),
                            Spacer(),
                            IconButton(onPressed: (){}, icon: Icon(Icons.arrow_drop_down, color: whiteColor,)),
                          ],
                        ),
                      ),
                      SizedBox(height: 20,),
      
      
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: 3,
                          itemBuilder: (_, index){
                          return Container(
                            margin: EdgeInsets.only(bottom: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                    flex: 1,
                                    child: Column(
                                      children: [
                                        text("$time", textColor: whiteColor),
                                        text("$dayAndDate", textColor: iconColor, fontSize: 12),
                                      ],
                                    )),
                                Expanded(
                                  flex: 5,
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 18.0),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            text("Deposit", textColor: whiteColor),
                                            Spacer(),
                                            Column(
                                              children: [
                                                text('+₹100.00', textColor: whiteColor, fontSize: 18, fontWeight: FontWeight.w700, fontFamily: AppFontFamily.poppinsBold),
                                                text('Pending', textColor: Colors.orange,),
                                              ],
                                            ),
                                            IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios, color: iconColor,)),
                                          ],
                                        ),
                                        Divider(color: iconColor),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );
                        }
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
