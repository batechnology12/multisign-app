import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multisign_app/src/const/app_colors.dart';
import 'package:multisign_app/src/views/history_view/history_view.dart';
import 'package:multisign_app/src/views/home_view/home_view.dart';
import 'package:multisign_app/src/views/installation_customer_view/installation_customer_view.dart';
import 'package:multisign_app/src/views/profile/user_profile.dart';
import 'package:multisign_app/src/views/recce_customer_view/recce_customer_view.dart';
import 'package:multisign_app/src/views/user_view/user_view.dart';

class BottomNaviBar extends StatefulWidget {
  int index;
  BottomNaviBar({super.key, this.index = 0});

  @override
  State<BottomNaviBar> createState() => _BottomNaviBarState();
}

class _BottomNaviBarState extends State<BottomNaviBar> {
  int bottomIndex = 0;
  List iconsList = [
    "assets/icons/home.png",
    "assets/icons/customer.png",
    "assets/icons/installcustomer.png",
    "assets/icons/history.png",
    "assets/icons/user.png",
  ];
  List screens = [
    HomeScreen(),
    RecceCustomer(),
    InstallationCustomer(),
    HistoryScreen(),
    ProfileScreen(),
  ];

  @override
  void initState() {
    super.initState();
    setDefault();
  }

  setDefault() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        bottomIndex = widget.index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[bottomIndex],
      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
          height: 40.h,
          leftCornerRadius: 8,
          rightCornerRadius: 8,
          gapLocation: GapLocation.none,
          backgroundColor: AppColors.yellowAccent,
          itemCount: iconsList.length,
          tabBuilder: ((index, isActive) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 39.h,
                  width: 39.w,
                  decoration: BoxDecoration(
                      color: bottomIndex == index
                          ? AppColors.white
                          : AppColors.yellowAccent,
                      shape: BoxShape.circle),
                  child: Image.asset(iconsList[index],
                      height: 26.h,
                      width: 26.w,
                      color: bottomIndex == index
                          ? AppColors.yellowAccent
                          : AppColors.black),
                ),
              ],
            );
          }),
          activeIndex: bottomIndex,
          onTap: (index) {
            setState(() {
              bottomIndex = index;
            });
          }),
    );
  }
}
