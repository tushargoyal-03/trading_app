import 'dart:io';
import 'package:flutter/material.dart';
import 'package:trading_app/Application_layer/utils/image_utils.dart';
import 'package:trading_app/Application_layer/utils/padding.dart';
import '../../../Application_layer/constants/app_color.dart';
import '../../../Application_layer/constants/app_font.dart';
import '../../../Application_layer/constants/app_images.dart';
import '../../../Application_layer/constants/app_text.dart';
import '../../../Application_layer/constants/custom_textfield.dart';

class PanKycScreen extends StatefulWidget {
  const PanKycScreen({super.key});

  @override
  State<PanKycScreen> createState() => _PanKycScreenState();
}

class _PanKycScreenState extends State<PanKycScreen> {
  final _formKey = GlobalKey<FormState>(); // Form Key
  var _panCardController = TextEditingController();
  File? _selectedImages;

  Future<void> selectImage(int index) async {
    final File? image = await ImageUtils.pickImage(0);
    if (image != null) {
      setState(() {
        _selectedImages = image;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: bgColor,
        appBar: AppBar(
          backgroundColor: bgColor,
          centerTitle: true,
          title: Text(
            "Personal Details",
            style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                fontFamily: AppFontFamily.poppinsBold,
                color: Colors.white),
          ),
        ),
        body: Padding(
          padding: AppPadding.screenPadding,
          child: Form(
            key: _formKey, // Form wrap
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Your Pan is your identity.",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      fontFamily: AppFontFamily.poppinsBold,
                      color: Colors.white),
                ),
                SizedBox(height: 20),

                // PAN Card Field with Validation
                CustomTextFormField(
                  controller: _panCardController,
                  labelText: "PAN Card",
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'PAN Card is required';
                    }

                    String pan = value.toUpperCase();

                    // PAN regex
                    final panRegex = RegExp(r'^[A-Z]{5}[0-9]{4}[A-Z]$');
                    if (!panRegex.hasMatch(pan)) {
                      return 'Enter a valid PAN Card number';
                    }

                    return null; // valid
                  },
                ),
                SizedBox(height: 40),

                // Upload Photo Section
                Text(
                  "Please upload the photo of your pan card.",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      fontFamily: AppFontFamily.poppinsBold,
                      color: Colors.white),
                ),
                SizedBox(height: 20),
                InkWell(
                  onTap: () {
                    selectImage(0);
                  },
                  child: Center(
                      child: _selectedImages != null
                          ? Image.file(
                              _selectedImages!,
                              width: 250,
                              height: 130,
                              fit: BoxFit.cover,
                            )
                          : Container(
                              width: 250,
                              height: 130,
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: buttonColor.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Icon(
                                Icons.add_photo_alternate,
                                color: Colors.grey,
                              ),
                            )),
                ),
                SizedBox(height: 40),

                // Example Image
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Image.asset(
                          AppImages.panCardImage,
                          width: 80,
                          height: 60,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Icon(
                          Icons.check_circle,
                          color: Colors.green,
                          size: 20,
                        ),
                        text("Standard", textColor: Colors.green),
                      ],
                    ),
                    Column(
                      children: [
                        Image.asset(
                          AppImages.panCardImage,
                          width: 80,
                          height: 60,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Icon(
                          Icons.close,
                          color: Colors.red,
                          size: 20,
                        ),
                        text("Incomplete", textColor: Colors.red),
                      ],
                    ),
                    Column(
                      children: [
                        Image.asset(
                          AppImages.panCardImage,
                          width: 80,
                          height: 60,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Icon(
                          Icons.close,
                          color: Colors.red,
                          size: 20,
                        ),
                        text("Not clear", textColor: Colors.red),
                      ],
                    ),
                    Column(
                      children: [
                        Image.asset(
                          AppImages.panCardImage,
                          width: 80,
                          height: 60,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Icon(
                          Icons.close,
                          color: Colors.red,
                          size: 20,
                        ),
                        text("Strong flash", textColor: Colors.red),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 40),

                // Submit Button
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      // PAN Validation Check
                      if (_formKey.currentState!.validate()) {
                        if (_selectedImages == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text('Please upload PAN card photo')),
                          );
                        } else {
                          // All good, proceed next
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text('PAN validated successfully!')),
                          );
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: buttonColor,
                    ),
                    child: Text(
                      "Submit",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          fontFamily: AppFontFamily.poppinsBold),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),

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
      ),
    );
  }
}
