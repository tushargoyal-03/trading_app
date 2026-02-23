import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trading_app/Application_layer/constants/app_color.dart';
import 'package:trading_app/Application_layer/constants/app_font.dart';
import 'package:trading_app/Application_layer/constants/app_text.dart';
import 'package:trading_app/Application_layer/constants/common_button.dart';
import 'package:trading_app/Application_layer/utils/padding.dart';

import '../../../Application_layer/constants/custom_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  // Declaring email
  var _emailController = TextEditingController();
  var _passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: bgColor,
        appBar: AppBar(
          backgroundColor: bgColor,
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: text(
              "Login in Real account",
              fontSize: 22,
              fontFamily: AppFontFamily.poppinsBold,
              fontWeight: FontWeight.w700,
            textColor: whiteColor,
          ),
        ),
        body: Padding(
          padding: AppPadding.screenPadding,
          child: Column(
            children: [
      
      
              // Email TextField
              CustomTextFormField(
                controller: _emailController,
                labelText: "EMAIL ADDRESS",
                keyboardType: TextInputType.emailAddress,
      
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "This field cannot be empty";
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
      
              // Password TextField
              CustomTextFormField(
                controller: _passwordController,
                labelText: "PASSWORD",
                keyboardType: TextInputType.visiblePassword,
      
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "This field cannot be empty";
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
      
              // Login
              CustomButton(textHeading: "Login", onTap: (){}, btnColor: buttonColor)
            ],
          ),
        ),
      ),
    );
  }
}
