import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:multisign_app/src/const/app_colors.dart';
import 'package:multisign_app/src/const/app_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:multisign_app/src/const/bottom_navi_bar.dart';
import 'package:multisign_app/src/controllers/home_controller.dart';
import 'package:multisign_app/src/controllers/profile_controller.dart';
import 'package:multisign_app/src/views/installation_customer_view/installation_report_Details.dart';
import 'package:multisign_app/src/views/notification/notification_epty_screen.dart';
import 'package:multisign_app/src/views/recce_customer_view/recce_report_details.dart';
import 'package:shimmer_pro/shimmer_pro.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Color bgColor;
  bool isThemeDark = true;

  late ShimmerProLight shimmerlight;
  // var projectDetails = ProjectDetails();
  final controller = Get.find<ProfileController>();
  final multisign = Get.find<HomeController>();
  int activeIndex = 0;
  @override
  void initState() {
    super.initState();
    getdata();
    _themeMode();
  }

  getdata() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
       controller.getprofile();
    multisign.getRecee();
    multisign.getinstallation();
    });
   
  }



  void _themeMode() {
    isThemeDark = !isThemeDark;
    if (isThemeDark) {
      setState(() {
        bgColor = const Color.fromARGB(255, 50, 50, 50);
        shimmerlight = ShimmerProLight.lighter;
      });
    } else {
      setState(() {
        bgColor = const Color.fromARGB(255, 240, 240, 240);
        shimmerlight = ShimmerProLight.darker;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 8),
        child: SafeArea(
          child: RefreshIndicator(
            onRefresh: () => getdata(),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: GetBuilder<ProfileController>(builder: (_) {
                return controller.getprofileData == null
                    ? Center(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                            const SizedBox(height: 20),
                            ShimmerPro.text(
                              light: shimmerlight,
                              width: 450,
                              scaffoldBackgroundColor: bgColor,
                            ),
                            ksizedbox10,
                            ShimmerPro.text(
                              light: shimmerlight,
                              width: 450,
                              scaffoldBackgroundColor: bgColor,
                            ),
                            ksizedbox10,
                            ShimmerPro.text(
                              light: shimmerlight,
                              width: 450,
                              scaffoldBackgroundColor: bgColor,
                            ),
                            ksizedbox10,
                            ShimmerPro.text(
                              light: shimmerlight,
                              width: 450,
                              scaffoldBackgroundColor: bgColor,
                            ),
                            // ShimmerPro.generated(
                            //     light: shimmerlight,
                            //     scaffoldBackgroundColor: bgColor,
                            //     child: Row(
                            //       children: [
                            //         ShimmerPro.sized(
                            //           light: shimmerlight,
                            //           scaffoldBackgroundColor: bgColor,
                            //           height: 100,
                            //           width: 100,
                            //           borderRadius: 50,
                            //         ),
                            //         ShimmerPro.text(
                            //           light: shimmerlight,
                            //           scaffoldBackgroundColor: bgColor,
                            //           width: 270,
                            //         )
                            //       ],
                            //     ))
                          ]))
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    backgroundImage: AssetImage(
                                      'assets/images/blank-profile-picture-973460_1920.png',
                                    ),
                                    radius: 26,
                                  )
                                  //     Image.asset("assets/images/profile.png"),
                                  ,
                                  ksizedbox10w,
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Hello,",
                                        style: primaryFonts.copyWith(
                                            color: AppColors.black,
                                            fontSize: 19,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      controller.getprofileData == null
                                          ? Text('No Name ')
                                          : Text(
                                              controller.getprofileData!.name,
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
                                    color: Colors.grey,
                                    activeColor: Colors.orange),
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
                          controller.getprofileData == null
                              ? Center(
                                  child: CircularProgressIndicator(
                                    color: AppColors.red,
                                  ),
                                )
                              : Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    controller.getprofileData!.roleId == '2'
                                        ? Expanded(
                                            child: GestureDetector(
                                              onTap: () {
                                                Get.offAll(BottomNaviBar(
                                                  index: 1,
                                                ));
                                              },
                                              child: Container(
                                                margin:
                                                    EdgeInsets.only(right: 8),
                                                padding: EdgeInsets.all(5),
                                                height: 50.h,
                                                decoration: BoxDecoration(
                                                    color: AppColors.blue,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                child: Row(
                                                  children: [
                                                    Container(
                                                        height: 40.h,
                                                        width: 40.w,
                                                        decoration: BoxDecoration(
                                                            color:
                                                                AppColors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8)),
                                                        child: Image.asset(
                                                            "assets/icons/recce.png")),
                                                    ksizedbox20w,
                                                    Text(
                                                      "Recce",
                                                      style:
                                                          primaryFonts.copyWith(
                                                              color: AppColors
                                                                  .white,
                                                              fontSize: 16.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          )
                                        : Expanded(
                                            child: GestureDetector(
                                              onTap: () {
                                                Get.offAll(BottomNaviBar(
                                                  index: 1,
                                                ));
                                              },
                                              child: Container(
                                                padding: EdgeInsets.all(5),
                                                height: 50.h,
                                                decoration: BoxDecoration(
                                                    color: AppColors.blue,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                child: Row(
                                                  children: [
                                                    Container(
                                                        height: 40.h,
                                                        width: 40.w,
                                                        decoration: BoxDecoration(
                                                            color:
                                                                AppColors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8)),
                                                        child: Image.asset(
                                                            "assets/icons/install.png")),
                                                    ksizedbox20w,
                                                    Text(
                                                      "Installation",
                                                      style:
                                                          primaryFonts.copyWith(
                                                              color: AppColors
                                                                  .white,
                                                              fontSize: 16.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
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
                              // GestureDetector(
                              //   onTap: () {
                              //     Get.offAll(BottomNaviBar(
                              //       index: 2,
                              //     ));
                              //   },
                              //   child: Text(
                              //     "See All",
                              //     style: primaryFonts.copyWith(
                              //         color: AppColors.black.withOpacity(.43),
                              //         fontSize: 12,
                              //         fontWeight: FontWeight.w400),
                              //   ),
                              // ),
                            ],
                          ),
                          ksizedbox10,
                          controller.getprofileData!.roleId == '2'
                              ? GetBuilder<HomeController>(builder: (context) {
                                  return multisign.getreceelistData == null
                                      ? Center(
                                          child: Image.asset(
                                              'assets/icons/fi_6598519.png'))
                                      : RefreshIndicator(onRefresh: ()=>  multisign.getRecee(),
                                        child: ListView.builder(
                                            physics: BouncingScrollPhysics(),
                                            shrinkWrap: true,
                                            itemCount:
                                                multisign.getreceelistData.length,
                                            itemBuilder: ((context, index) {
                                              return Card(
                                                child: Column(
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () {
                                                        Get.to(RecceReportDetails(
                                                          id: multisign
                                                              .getreceelistData[
                                                                  index]
                                                              .id
                                                              .toString(),
                                                        ));
                                                      },
                                                      child: Container(
                                                        margin: EdgeInsets.only(
                                                            bottom: 10, top: 4),
                                                        height: 80,
                                                        width: double.infinity,
                                                        decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                          // color: AppColors.darkGrey
                                                          //     .withOpacity(.05
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Row(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Row(
                                                                children: [
                                                                  ksizedbox10w,
                                                                  Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Text(
                                                                        multisign
                                                                            .getreceelistData[
                                                                                index]
                                                                            .clientName,
                                                                        style: primaryFonts.copyWith(
                                                                            fontSize:
                                                                                15,
                                                                            fontWeight: FontWeight
                                                                                .w600,
                                                                            color:
                                                                                AppColors.black),
                                                                      ),
                                                                      // Text(
                                                                      //     controller
                                                                      //         .getreceelistData[index]
                                                                      //         .address,
                                                                      //     style: primaryFonts.copyWith(
                                                                      //         fontSize: 14,
                                                                      //         fontWeight: FontWeight.w400,
                                                                      //         color: AppColors.black
                                                                      //             .withOpacity(.70))),
                                                                      Text(
                                                                          multisign
                                                                              .getreceelistData[
                                                                                  index]
                                                                              .jobcard,
                                                                          style: primaryFonts.copyWith(
                                                                              fontSize:
                                                                                  12,
                                                                              fontWeight:
                                                                                  FontWeight.w400,
                                                                              color: AppColors.black.withOpacity(.50))),
                                                                      if (multisign
                                                                              .getreceelistData[index]
                                                                              .isReceeVerrified ==
                                                                          "1")
                                                                        Text(
                                                                          "completed",
                                                                          style: TextStyle(
                                                                              color:
                                                                                  Colors.green),
                                                                        )
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                              Row(
                                                                children: [
                                                                  Column(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .end,
                                                                    children: [
                                                                      GestureDetector(
                                                                        onTap:
                                                                            () {
                                                                          Get.to(
                                                                              RecceReportDetails(
                                                                            id: multisign
                                                                                .getreceelistData[index]
                                                                                .id
                                                                                .toString(),
                                                                          ));
                                                                        },
                                                                        child: Text(
                                                                            'Full View',
                                                                            style: primaryFonts.copyWith(
                                                                                decoration: TextDecoration.underline,
                                                                                fontSize: 12,
                                                                                fontWeight: FontWeight.w600,
                                                                                color: AppColors.green)),
                                                                      ),
                                                                      Text(
                                                                          multisign
                                                                              .getreceelistData[
                                                                                  index]
                                                                              .createdAt
                                                                              .toString(),
                                                                          style: primaryFonts.copyWith(
                                                                              fontSize:
                                                                                  12,
                                                                              fontWeight:
                                                                                  FontWeight.w300,
                                                                              color: AppColors.black)),
                                                                      Text(
                                                                          multisign
                                                                              .getreceelistData[
                                                                                  index]
                                                                              .address,
                                                                          style: primaryFonts.copyWith(
                                                                              fontSize:
                                                                                  12,
                                                                              fontWeight:
                                                                                  FontWeight.w300,
                                                                              color: AppColors.black)),
                                                                    ],
                                                                  ),
                                                                ],
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            })),
                                      );
                                })
                              : GetBuilder<HomeController>(builder: (context) {
                                  return multisign.installerListdata.isEmpty
                                      ? Center(
                                          child: CircularProgressIndicator(
                                          color: AppColors.green,
                                        ))
                                      : RefreshIndicator(
                                          onRefresh: () =>
                                              multisign.getinstallation(),
                                          child: ListView.builder(
                                              shrinkWrap: true,
                                              itemCount:
                                                  //4,
                                                  multisign
                                                      .installerListdata.length,
                                              itemBuilder: ((context, index) {
                                                return Card(
                                                  child: Column(
                                                    children: [
                                                      GestureDetector(
                                                        onTap: () {
                                                          Get.to(
                                                              InstallationReportDetails(
                                                            beforeImages: multisign
                                                                .installerListdata[
                                                                    index]
                                                                .receeVerifications.last
                                                                    
                                                                .beforeImages
                                                                ,
                                                            id: multisign
                                                                .installerListdata[
                                                                    index]
                                                                .id
                                                                .toString(),
                                                          ));
                                                        },
                                                        child: Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  bottom: 10,
                                                                  top: 4),
                                                          height: 80,
                                                          width:
                                                              double.infinity,
                                                          decoration: BoxDecoration(
                                                              // color: AppColors.darkGrey
                                                              //     .withOpacity(.05)
                                                              ),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child: Row(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Row(
                                                                  children: [
                                                                    // Container(
                                                                    //   height: 65,
                                                                    //   width: 65,
                                                                    //   alignment: Alignment.center,
                                                                    //   decoration: BoxDecoration(
                                                                    //     color: AppColors.blue,
                                                                    //     borderRadius: BorderRadius.circular(8),
                                                                    //   ),
                                                                    //   child: Text(
                                                                    //     "PN",
                                                                    //     style: primaryFonts.copyWith(
                                                                    //         fontSize: 26,
                                                                    //         fontWeight: FontWeight.w700,
                                                                    //         color: AppColors.white),
                                                                    //   ),
                                                                    // ),
                                                                    ksizedbox10w,
                                                                    Column(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Text(multisign.installerListdata[index].clientName,
                                                                            style: primaryFonts.copyWith(
                                                                                fontSize: 15,
                                                                                fontWeight: FontWeight.w600,
                                                                                color: AppColors.black)),
                                                                        Text(
                                                                            "${multisign.installerListdata[index].address}, ${multisign.installerListdata[index].city}",
                                                                            style: primaryFonts.copyWith(
                                                                                fontSize: 14,
                                                                                fontWeight: FontWeight.w400,
                                                                                color: AppColors.black.withOpacity(.70))),
                                                                        Text(
                                                                            'Job Id:${multisign.installerListdata[index].jobcard}}',
                                                                            style: primaryFonts.copyWith(
                                                                                fontSize: 12,
                                                                                fontWeight: FontWeight.w400,
                                                                                color: AppColors.black.withOpacity(.50))),
                                                                        if (multisign.installerListdata[index].installerStatus ==
                                                                            "1")
                                                                          Text(
                                                                            'Completed',
                                                                            style:
                                                                                TextStyle(color: Colors.green),
                                                                          )
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                                Row(
                                                                  children: [
                                                                    Column(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .end,
                                                                      children: [
                                                                        GestureDetector(
                                                                          onTap:
                                                                              () {
                                                                            Get.to(InstallationReportDetails(
                                                                              id: multisign.installerListdata[index].id.toString(),
                                                                              beforeImages: multisign.installerListdata[index].receeVerifications.last.beforeImages,
                                                                            ));
                                                                          },
                                                                          child: Text(
                                                                              'Full View',
                                                                              style: primaryFonts.copyWith(decoration: TextDecoration.underline, fontSize: 12, fontWeight: FontWeight.w600, color: AppColors.green)),
                                                                        ),
                                                                        // Text(
                                                                        //     controller
                                                                        //         .installerListdata[index]
                                                                        //         .poDate
                                                                        //         .toString(),
                                                                        //     style: primaryFonts.copyWith(
                                                                        //         fontSize: 12,
                                                                        //         fontWeight: FontWeight.w300,
                                                                        //         color: AppColors.black)),
                                                                        // Text(
                                                                        //     controller
                                                                        //         .installerListdata[index]
                                                                        //         .production,
                                                                        //     style: primaryFonts.copyWith(
                                                                        //         fontSize: 12,
                                                                        //         fontWeight: FontWeight.w300,
                                                                        //         color: AppColors.black)),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              })),
                                        );
                                }),
                        ],
                      );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
