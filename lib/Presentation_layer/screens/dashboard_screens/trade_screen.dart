import 'package:flutter/material.dart';
import 'package:trading_app/Application_layer/constants/app_color.dart';
import 'package:trading_app/Application_layer/constants/app_text.dart';
import 'package:trading_app/Application_layer/utils/padding.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../Application_layer/constants/app_font.dart';
import '../../../Application_layer/constants/common_button.dart';

class TradeScreen extends StatefulWidget {
  const TradeScreen({super.key});

  @override
  State<TradeScreen> createState() => _TradeScreenState();
}

class _TradeScreenState extends State<TradeScreen> {
  // DECLARATION
  int selectedIndex = 1;
  int selectedGraphTime = 3;
  late CrosshairBehavior _crosshairBehavior;

  final List<ChartData> data = [
    ChartData(DateTime(2000, 1), 100),
    ChartData(DateTime(2001, 6), 95),
    ChartData(DateTime(2002, 1), 80),
    ChartData(DateTime(2003, 6), 90),
    ChartData(DateTime(2004, 1), 110),
    ChartData(DateTime(2005, 6), 100),
    ChartData(DateTime(2006, 1), 115),
    ChartData(DateTime(2007, 9), 120),
  ];

  @override
  void initState() {
    _crosshairBehavior = CrosshairBehavior(
      enable: true,
      activationMode: ActivationMode.singleTap,
      lineType: CrosshairLineType.vertical,
      lineColor: Colors.black,
      lineWidth: 1.2,
      shouldAlwaysShow: true,

      // 👇 LABEL SETTINGS YAHAN KARTE HAIN
      lineDashArray: null,
      hideDelay: 0,
      //tooltipDisplayMode: CrosshairTooltipDisplayMode.always,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
      ),
      body: Padding(
        padding: AppPadding.screenPadding,
        child: Column(
          children: [
            // Account switcher
            Container(
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
                        color: selectedIndex == 0
                            ? whiteColor
                            : Colors.transparent,
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
                        color: selectedIndex == 1
                            ? whiteColor
                            : Colors.transparent,
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
            SizedBox(
              height: 20,
            ),

            // Amount and money deposit
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Center(
                  child: text(
                    "₹ 10000.00",
                    textColor: whiteColor,
                    fontWeight: FontWeight.w600,
                    fontFamily: AppFontFamily.poppinsBold,
                    fontSize: 25,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  padding: AppPadding.loginContainerPadding,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(color: Colors.green),
                  ),
                  child: text("Deposit Real Money", textColor: Colors.green),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),

            // Stock name and graph time
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: AppPadding.loginContainerPadding,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: buttonColor.withOpacity(0.1)),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            text("Assets", textColor: iconColor, fontSize: 10),
                            text("Profitability",
                                textColor: iconColor, fontSize: 10),
                          ],
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.supervised_user_circle,
                              color: whiteColor,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            text("SHIB/USD",
                                textColor: whiteColor,
                                fontWeight: FontWeight.w600,
                                fontFamily: AppFontFamily.poppinsSansMedium,
                                fontSize: 14),
                            Spacer(),
                            text("85%",
                                textColor: buttonColor,
                                fontWeight: FontWeight.w600,
                                fontFamily: AppFontFamily.poppinsSansMedium,
                                fontSize: 14),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Container(
                    padding: AppPadding.loginContainerPadding,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: buttonColor.withOpacity(0.1)),
                    child: Column(
                      children: [
                        text("Graph Time Frame",
                            textColor: iconColor, fontSize: 10),
                        SizedBox(
                          height: 4,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                                onTap: () {
                                  selectedGraphTime = 0;
                                  setState(() {});
                                },
                                child: text("30m",
                                    textColor: selectedGraphTime == 0
                                        ? whiteColor
                                        : iconColor,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: AppFontFamily.poppinsSansMedium,
                                    fontSize: 14)),
                            InkWell(
                                onTap: () {
                                  selectedGraphTime = 1;
                                  setState(() {});
                                },
                                child: text("15m",
                                    textColor: selectedGraphTime == 1
                                        ? whiteColor
                                        : iconColor,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: AppFontFamily.poppinsSansMedium,
                                    fontSize: 14)),
                            InkWell(
                                onTap: () {
                                  selectedGraphTime = 2;
                                  setState(() {});
                                },
                                child: text("5m",
                                    textColor: selectedGraphTime == 2
                                        ? whiteColor
                                        : iconColor,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: AppFontFamily.poppinsSansMedium,
                                    fontSize: 14)),
                            InkWell(
                                onTap: () {
                                  selectedGraphTime = 3;
                                  setState(() {});
                                },
                                child: text("3m",
                                    textColor: selectedGraphTime == 3
                                        ? whiteColor
                                        : iconColor,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: AppFontFamily.poppinsSansMedium,
                                    fontSize: 14)),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),

            // Graph
            SfCartesianChart(
              plotAreaBorderWidth: 0,
              crosshairBehavior: _crosshairBehavior,
              primaryXAxis: DateTimeAxis(
                majorGridLines: const MajorGridLines(width: 0),
              ),
              primaryYAxis: NumericAxis(
                minimum: 0,
                maximum: 140,
                interval: 20,
                axisLine: const AxisLine(width: 0),
                majorGridLines: const MajorGridLines(width: 0),
                minorGridLines: const MinorGridLines(width: 0),
              ),
              series: <CartesianSeries>[
                LineSeries<ChartData, DateTime>(
                  dataSource: data,
                  xValueMapper: (data, _) => data.x,
                  yValueMapper: (data, _) => data.y,
                  width: 2.5,
                  color: Colors.blue,
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),

            // Money and time
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                      padding: AppPadding.loginContainerPadding,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: buttonColor.withOpacity(0.1)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.remove,
                                color: whiteColor,
                              )),
                          Column(
                            children: [
                              text("Invest", textColor: iconColor),
                              text("₹20",
                                  textColor: whiteColor,
                                  fontWeight: FontWeight.w600),
                            ],
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.add,
                                color: whiteColor,
                              )),
                        ],
                      )),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                      padding: AppPadding.loginContainerPadding,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: buttonColor.withOpacity(0.1)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.remove,
                                color: whiteColor,
                              )),
                          Column(
                            children: [
                              text("Time", textColor: iconColor),
                              text("1 min",
                                  textColor: whiteColor,
                                  fontWeight: FontWeight.w600),
                            ],
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.add),
                            color: whiteColor,
                          ),
                        ],
                      )),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),

            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    textHeading: "Put",
                    onTap: () {},
                    btnColor: Colors.red,
                    isImage: false,
                    isIcon: true,
                    icon: Icons.arrow_downward,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: CustomButton(
                    textHeading: "Call",
                    onTap: () {},
                    btnColor: Colors.green,
                    isImage: false,
                    isIcon: true,
                    icon: Icons.arrow_upward,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ChartData {
  final DateTime x;
  final double y;

  ChartData(this.x, this.y);
}
