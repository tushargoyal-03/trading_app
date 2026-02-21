import 'package:flutter/material.dart';
import 'package:trading_app/Application_layer/constants/app_color.dart';
import 'package:trading_app/Application_layer/constants/app_font.dart';
import 'package:trading_app/Application_layer/constants/app_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Center(child: text("Vikash",textColor: blackColor,fontSize: 16,fontFamily: AppFontFamily.poppinsBold)),
          ],
        ),
      ),
    );
  }
}
