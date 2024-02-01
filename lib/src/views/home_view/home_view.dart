import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:multisign_app/src/const/app_colors.dart';
import 'package:multisign_app/src/const/app_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:multisign_app/src/const/bottom_navi_bar.dart';
import 'package:multisign_app/src/controllers/home_controller.dart';
import 'package:multisign_app/src/views/installation_customer_view/installation_customer_view.dart';
import 'package:multisign_app/src/views/notification/notification_epty_screen.dart';
import 'package:multisign_app/src/views/recce_customer_view/recce_customer_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // var projectDetails = ProjectDetails();
  final HomeController multisign = Get.find<HomeController>();
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 8),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset("assets/images/profile.png"),
                        ksizedbox10w,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Hello,",
                              style: primaryFonts.copyWith(
                                  color: AppColors.black,
                                  fontSize: 19,
                                  fontWeight: FontWeight.w700),
                            ),
                            Text(
                              "Prakash Mp",
                              style: primaryFonts.copyWith(
                                  color: AppColors.black,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w300),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.to(EmptyNotification());
                          },
                          child: Image.asset(
                            "assets/icons/notification.png",
                            height: 22,
                            width: 22,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                ksizedbox10,
                CarouselSlider(
                  options: CarouselOptions(
                    initialPage: 0,
                    height: 130,
                    aspectRatio: 2.0,
                    enlargeCenterPage: true,
                    scrollDirection: Axis.horizontal,
                    autoPlay: true,
                    onPageChanged: (index, reason) {
                      setState(() {
                        activeIndex = index;
                      });
                    },
                  ),
                  items: [Image.asset("assets/images/printer.png")],
                ),
                ksizedbox5,
                Center(
                  child: DotsIndicator(
                      decorator: DotsDecorator(
                          color: Colors.grey, activeColor: Colors.orange),
                      dotsCount: 3,
                      onTap: (index) {
                        setState(() {
                          activeIndex = index;
                        });
                      },
                      position: activeIndex),
                ),
                Text(
                  "Print Details",
                  style: primaryFonts.copyWith(
                      color: AppColors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
                ksizedbox10,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Get.offAll(BottomNaviBar(
                            index: 1,
                          ));
                        },
                        child: Container(
                          margin: EdgeInsets.only(right: 8),
                          padding: EdgeInsets.all(5),
                          height: 50.h,
                          decoration: BoxDecoration(
                              color: AppColors.blue,
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            children: [
                              Container(
                                  height: 40.h,
                                  width: 40.w,
                                  decoration: BoxDecoration(
                                      color: AppColors.white,
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Image.asset("assets/icons/recce.png")),
                              ksizedbox20w,
                              Text(
                                "Recce",
                                style: primaryFonts.copyWith(
                                    color: AppColors.white,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Get.offAll(BottomNaviBar(
                            index: 2,
                          ));
                        },
                        child: Container(
                          padding: EdgeInsets.all(5),
                          height: 50.h,
                          decoration: BoxDecoration(
                              color: AppColors.blue,
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            children: [
                              Container(
                                  height: 40.h,
                                  width: 40.w,
                                  decoration: BoxDecoration(
                                      color: AppColors.white,
                                      borderRadius: BorderRadius.circular(8)),
                                  child:
                                      Image.asset("assets/icons/install.png")),
                              ksizedbox20w,
                              Text(
                                "Installation",
                                style: primaryFonts.copyWith(
                                    color: AppColors.white,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                ksizedbox20,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Recent Project Details",
                      style: primaryFonts.copyWith(
                          color: AppColors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.offAll(BottomNaviBar(
                          index: 3,
                        ));
                      },
                      child: Text(
                        "See All",
                        style: primaryFonts.copyWith(
                            color: AppColors.black.withOpacity(.43),
                            fontSize: 12,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
                ksizedbox10,
                Container(
                  height: 400,
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: multisign.projectDetails.length,
                      itemBuilder: ((context, index) {
                        return Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(bottom: 10),
                              height: 80,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: AppColors.darkGrey.withOpacity(.05)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(left: 10),
                                        height: 65,
                                        width: 65,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          color: multisign.colors[index],
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: Text(
                                          multisign
                                              .projectDetails[index].letters
                                              .toString(),
                                          style: primaryFonts.copyWith(
                                              fontSize: 26,
                                              fontWeight: FontWeight.w700,
                                              color: AppColors.white),
                                        ),
                                      ),
                                      ksizedbox10w,
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                              multisign
                                                  .projectDetails[index].name
                                                  .toString(),
                                              style: primaryFonts.copyWith(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w600,
                                                  color: AppColors.black)),
                                          Text(
                                              multisign
                                                  .projectDetails[index].place
                                                  .toString(),
                                              style: primaryFonts.copyWith(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                  color: AppColors.black
                                                      .withOpacity(.70))),
                                          Text(
                                              multisign
                                                  .projectDetails[index].jobId
                                                  .toString(),
                                              style: primaryFonts.copyWith(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400,
                                                  color: AppColors.black
                                                      .withOpacity(.50))),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                              multisign
                                                  .projectDetails[index].date
                                                  .toString(),
                                              style: primaryFonts.copyWith(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w300,
                                                  color: AppColors.black)),
                                          Text(
                                              multisign
                                                  .projectDetails[index].day
                                                  .toString(),
                                              style: primaryFonts.copyWith(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w300,
                                                  color: AppColors.black)),
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        );
                      })),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
