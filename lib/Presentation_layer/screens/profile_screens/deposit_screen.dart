import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Application_layer/constants/app_color.dart';
import '../../../Application_layer/constants/app_font.dart';
import '../../../Application_layer/constants/app_text.dart';

class DepositScreen extends StatefulWidget {
  const DepositScreen({super.key});

  @override
  State<DepositScreen> createState() => _DepositScreenState();
}

class _DepositScreenState extends State<DepositScreen> {
  int selectedAmount = 100;
  int selectedUpi = 2;

  final List<int> amounts = [
    100,
    300,
    500,
    1000,
    2000,
    3000,
    5000,
    8000,
    10000,
  ];
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
                  InkWell(
                      onTap: (){
                        Get.back();
                      },
                      child: const Icon(Icons.arrow_back_ios,color: whiteColor,)),
                  Expanded(
                      child: text("Deposit",textColor: whiteColor,
                          isCentered: true,
                          fontSize: 18,fontWeight: FontWeight.w600,
                          fontFamily: AppFontFamily.poppinsBold)),

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
                text("Payment Method",textColor: whiteColor,
                    isCentered: true,
                    fontSize: 18,fontWeight: FontWeight.w600,
                    fontFamily: AppFontFamily.poppinsSansMedium),

                text("Try other payment methods when facing failures",
                    textColor: iconColor,
                    isCentered: true,
                    fontSize: 13,fontWeight: FontWeight.w400,
                    fontFamily: AppFontFamily.poppinsRegular),

                SizedBox(height: 20,),
                const SizedBox(height: 15),

                _upiTile("UPI QR1", 1),
                const SizedBox(height: 12),
                _upiTile("UPI QR2", 2),

                const SizedBox(height: 25),

                /// Deposit Amount
                 text(
                  "Deposit amount",
                  textColor: whiteColor,
                     fontSize: 15,
                     fontFamily: AppFontFamily.poppinsSansMedium,
                ),
                const SizedBox(height: 15),

                GridView.builder(
                  shrinkWrap: true,
                  itemCount: amounts.length,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 15,
                    childAspectRatio: 2.2,
                  ),
                  itemBuilder: (context, index) {
                    final amount = amounts[index];
                    final isSelected = selectedAmount == amount;

                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedAmount = amount;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xff10273F),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: isSelected
                                ? Colors.blue
                                : Colors.white24,
                            width: 2,
                          ),
                        ),
                        child: Center(
                          child: text(
                            "₹$amount",
                            textColor: isSelected
                                ? Colors.white
                                : Colors.white70,
                            fontFamily: AppFontFamily.poppinsBold,
                            fontSize: 16
                          ),
                        ),
                      ),
                    );
                  },
                ),

               SizedBox(height: 30,),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 14),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white24),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child:  text(
                        "₹ INR",
                        textColor: whiteColor,
                          fontSize: 15,fontFamily: AppFontFamily.poppinsRegular,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        keyboardType: TextInputType.number,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: "Enter amount",
                          hintStyle:
                          const TextStyle(color: Colors.white38),
                          filled: true,
                          fillColor: const Color(0xff10273F),
                          border: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.circular(8),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 40),

                /// Button
                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {},
                    child:  text(
                      "Open real account and deposit",
                      textColor: whiteColor,fontFamily: AppFontFamily.poppinsBold,
                      fontSize: 16
                    ),
                  ),
                ),

              ],

            ),
          ),
        ),
      ),
    );
  }
  Widget _upiTile(String title, int value) {
    final isSelected = selectedUpi == value;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedUpi = value;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color(0xff10273F),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? Colors.blue : Colors.white24,
            width: 2,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              color: Colors.white,
              child: const Icon(Icons.qr_code),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    "₹100 - ₹50,000",
                    style: TextStyle(
                        color: Colors.white54),
                  ),
                ],
              ),
            ),
            Radio(
              value: value,
              groupValue: selectedUpi,
              onChanged: (val) {
                setState(() {
                  selectedUpi = value;
                });
              },
              activeColor: Colors.blue,
            )
          ],
        ),
      ),
    );
  }
}



