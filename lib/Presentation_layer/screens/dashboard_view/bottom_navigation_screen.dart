import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../Application_layer/constants/app_color.dart';
import '../../../Application_layer/constants/app_font.dart';
import '../../../Application_layer/constants/app_text.dart';
import '../profile_view/profile_screen.dart';
import 'home_screen.dart';

class BottomNavigationScreen extends StatefulWidget {
  String? id;
  bool? isFromHome;
  int? index;

  BottomNavigationScreen({
    Key? key,
    this.id,
    this.isFromHome = false,
    this.index,
  }) : super(key: key);

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  late int _selectedIndex;
  final PageController _pageController = PageController();
  int cartCount = 2;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.index ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: SafeArea(
        top: false,
        child: Scaffold(
          backgroundColor: whiteColor,
          body: PageView(
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(),
            children:  [
               HomeScreen(),
               HomeScreen(),
               HomeScreen(),
               HomeScreen(),
              ProfileScreen(),
            ],
          ),
          bottomNavigationBar: _buildBottomNavigation(),
        ),
      ),
    );
  }

  // 🔙 Back press dialog
  Future<bool> _onWillPop() async {
    final shouldPop = await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            'Do you want to quit app?',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: blackColor,
              fontSize: 18,
              fontFamily: AppFontFamily.poppinsRegular,
            ),
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () => SystemNavigator.pop(),
                  child: Container(
                    height: 40,
                    width: MediaQuery.sizeOf(context).width / 3,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: buttonColor),
                    ),
                    child: const Text(
                      'Yes',
                      style: TextStyle(
                        color: whiteColor,
                        fontSize: 18,
                        fontFamily: AppFontFamily.poppinsRegular,
                      ),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context, false),
                  child: Container(
                    height: 40,
                    width: MediaQuery.sizeOf(context).width / 3,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: buttonColor,
                    ),
                    child: const Text(
                      'No',
                      style: TextStyle(
                        color: whiteColor,
                        fontSize: 18,
                        fontFamily: AppFontFamily.poppinsRegular,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
    return shouldPop ?? false;
  }

  // 🔥 CUSTOM BOTTOM BAR
  Widget _buildBottomNavigation() {
    return Container(
      height: 65,
      // margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: bgColor,
        //borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _navItem(Icons.receipt_long, "News", 0),
          _navItem(Icons.help_center_outlined, "Help", 1),
          _navItem(Icons.graphic_eq, "Trade", 2),
          _navItem(Icons.history, "History", 3),
          _navItem(Icons.person, "PROFILE", 4),
        ],
      ),
    );
  }

  // 🔹 Nav item widget
  Widget _navItem(IconData icon, String label, int index) {
    final isSelected = _selectedIndex == index;

    return GestureDetector(
      onTap: () => _onTappedBar(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: Matrix4.identity()..scale(isSelected ? 1.1 : 1.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 22,
              color: isSelected ? buttonColor : whiteColor,
            ),
            const SizedBox(height: 4),
            text(
              label,
              textColor: isSelected ? buttonColor : whiteColor,
              fontSize: 10,
              fontFamily: AppFontFamily.poppinsBold,
              fontWeight: FontWeight.bold,
            ),
          ],
        ),
      ),
    );
  }

  // 🔄 Navigation handler
  void _onTappedBar(int index) {
    FocusScope.of(context).unfocus();
    setState(() => _selectedIndex = index);
    _pageController.jumpToPage(index);
  }
}
