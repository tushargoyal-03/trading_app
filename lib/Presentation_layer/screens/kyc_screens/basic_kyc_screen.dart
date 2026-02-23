import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:trading_app/Application_layer/utils/padding.dart';

import '../../../Application_layer/constants/app_color.dart';
import '../../../Application_layer/constants/app_font.dart';
import '../../../Application_layer/constants/app_text.dart';
import '../../../Application_layer/constants/custom_textfield.dart';

class BasicKycScreen extends StatefulWidget {
  const BasicKycScreen({super.key});

  @override
  State<BasicKycScreen> createState() => _BasicKycScreenState();
}

class _BasicKycScreenState extends State<BasicKycScreen> {
  // Declare Controller
  var _phoneCardController = TextEditingController();
  var _nameController = TextEditingController();
  var _aadharCardController = TextEditingController();
  int activeStep = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: bgColor,
        appBar: AppBar(
          backgroundColor: bgColor,
          centerTitle: true,
          title: text("Personal Details",
              fontSize: 22,
              fontWeight: FontWeight.w700,
              fontFamily: AppFontFamily.poppinsBold,
              textColor: whiteColor),
        ),
        body: Padding(
          padding: AppPadding.screenPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Stepper
              EasyStepper(
                activeStep: activeStep,
                activeStepTextColor: Colors.black87,
                finishedStepTextColor: Colors.black87,
                showLoadingAnimation: false,
                stepRadius: 8,
                steps: [
                  EasyStep(
                    customStep: CircleAvatar(
                      radius: 8,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 7,
                        backgroundColor:
                            activeStep >= 0 ? Colors.orange : Colors.white,
                      ),
                    ),
                    title: '1',
                  ),
                  EasyStep(
                    customStep: CircleAvatar(
                      radius: 8,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 7,
                        backgroundColor:
                            activeStep >= 1 ? Colors.orange : Colors.white,
                      ),
                    ),
                    title: '2',
                  ),
                  EasyStep(
                    customStep: CircleAvatar(
                      radius: 8,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 7,
                        backgroundColor:
                            activeStep >= 2 ? Colors.orange : Colors.white,
                      ),
                    ),
                    title: '3',
                  ),
                ],
                onStepReached: (index) => setState(() => activeStep = index),
              ),

              activeStep == 0
                  ? text(
                      "Start with your mobile number",
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      fontFamily: AppFontFamily.poppinsBold,
                      textColor: whiteColor,
                    )
                  : activeStep == 1
                      ? text(
                          "Set your full name",
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          fontFamily: AppFontFamily.poppinsBold,
                          textColor: whiteColor,
                        )
                      : text(
                          "Set your Aadhar number",
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          fontFamily: AppFontFamily.poppinsBold,
                          textColor: whiteColor,
                        ),
              SizedBox(
                height: 20,
              ),

              // Mobile Number TextField
              activeStep == 0
                  ? CustomTextFormField(
                      controller: _phoneCardController,
                      labelText: "Mobile Number",
                      keyboardType: TextInputType.phone,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(10),
                      ],
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Mobile Number is required";
                        }
                        return null;
                      },
                    )
                  : activeStep == 1
                      ? CustomTextFormField(
                          controller: _nameController,
                          labelText: "Name",
                          keyboardType: TextInputType.name,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Name is required";
                            }
                            return null;
                          },
                        )
                      : CustomTextFormField(
                          controller: _aadharCardController,
                          labelText: "Enter Aadhar Number",
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(12),
                          ],
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Aadhar Number is required";
                            }
                            return null;
                          },
                        ),
              SizedBox(
                height: 40,
              ),

              // Submit Button
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    activeStep++;
                    if(activeStep == 3){
                      Get.back();
                    }
                    setState(() {});
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: buttonColor),
                  child: activeStep == 2
                      ? text("Submit",
                          textColor: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          fontFamily: AppFontFamily.poppinsBold)
                      : text("Next",
                          textColor: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          fontFamily: AppFontFamily.poppinsBold),
                ),
              ),
              Spacer(),

              // Declaimer
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.security, color: Colors.green),
                  text("100% Secure", textColor: whiteColor),
                ],
              ),
              SizedBox(height: 10),
              Center(
                child: text(
                    "As required by RBI, your information will only be used for KYC verification when depositing money.",
                    textColor: iconColor,
                    isCentered: true,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    fontFamily: AppFontFamily.poppinsRegular),
              )
            ],
          ),
        ),
      ),
    );
  }
}
