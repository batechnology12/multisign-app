import 'dart:io';

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multisign_app/src/const/app_colors.dart';
import 'package:multisign_app/src/views/history_view/history_view.dart';
import 'package:multisign_app/src/views/home_view/home_view.dart';
import 'package:multisign_app/src/views/installation_customer_view/installation_customer_view.dart';
import 'package:multisign_app/src/views/notification/notification_epty_screen.dart';
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
  //  "assets/icons/installcustomer.png",
    "assets/icons/notification.png",
    "assets/icons/user.png",
  ];
  List screens = [
    HomeScreen(),
    RecceCustomer(),
  //  InstallationCustomer(),
   EmptyNotification(),
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
    return WillPopScope( onWillPop: () {
        return showExitPopup(context);
      },
      child: Scaffold(
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
      ),
    );
  }
   Future<bool> showExitPopup(context) async {
    return await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Container(
              height: 90,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Do you want to exit ?",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15),),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            print('yes selected');
                            exit(0);
                          },
                          // style: ElevatedButton.styleFrom(
                          //     textStyle:
                          //         primaryfont.copyWith(color: Colors.white),
                          //     primary: Colors.red.shade800),
                          child: Text(
                            "Yes",
                          //  style: primaryfont.copyWith(color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(width: 15),
                      Expanded(
                          child: ElevatedButton(
                        onPressed: () {
                          print('no selected');
                          Navigator.of(context).pop();
                        },
                        child:
                            Text("No", style: TextStyle(color: Colors.black)),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                        ),
                      ))
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }
}
