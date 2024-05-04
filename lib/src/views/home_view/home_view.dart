import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:multisign_app/src/const/app_colors.dart';
import 'package:multisign_app/src/const/app_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:multisign_app/src/const/bottom_navi_bar.dart';
import 'package:multisign_app/src/controllers/home_controller.dart';
import 'package:multisign_app/src/controllers/profile_controller.dart';
import 'package:multisign_app/src/views/installation_customer_view/get_installer_sub_job.dart';

import 'package:multisign_app/src/views/notification/notification_epty_screen.dart';
import 'package:multisign_app/src/views/recce_customer_view/get_recce_sub_job.dart';
import 'package:multisign_app/src/views/recce_customer_view/recce_customer_view.dart';
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
  final controller = Get.find<ProfileController>();
  final multisign = Get.find<HomeController>();
  int activeIndex = 0;

  @override
  void initState() {
    super.initState();
    getdata();
    _themeMode();
    multisign.getreceelistData.clear();
    multisign.installerListdata.clear();
  }

  getdata() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await controller.getprofile();

      if (controller.getprofileData!.roleId == '2') {
        multisign.getRecee();
      } else {
        multisign.getinstallation();
      }
    });
  }

  refreshData() async {
    await controller.getprofile();
    if (controller.getprofileData!.roleId == '2') {
      multisign.getRecee();
    } else {
      multisign.getinstallation();
    }
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

  // String selectdt1 = formatDate(
  //     DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day),
  //     [yyyy, "-", mm, "-", dd]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 8),
            child: SafeArea(
              child: GetBuilder<ProfileController>(builder: (_) {
                return controller.getprofileData == null
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: [
                                ShimmerPro.sized(
                                  light: shimmerlight,
                                  scaffoldBackgroundColor: bgColor,
                                  height: 80,
                                  width: 80,
                                  borderRadius: 50,
                                ),
                                ShimmerPro.text(
                                  light: shimmerlight,
                                  width: 250,
                                  scaffoldBackgroundColor: bgColor,
                                ),
                              ],
                            ),
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
                            ShimmerPro.sized(
                              light: shimmerlight,
                              scaffoldBackgroundColor: bgColor,
                              height: 60,
                              width: 450,
                            ),
                            ksizedbox10,
                            ShimmerPro.text(
                              light: shimmerlight,
                              width: 450,
                              scaffoldBackgroundColor: bgColor,
                            ),
                            ShimmerPro.generated(
                              light: shimmerlight,
                              scaffoldBackgroundColor: bgColor,
                              child: Row(
                                children: [
                                  ShimmerPro.text(
                                    light: shimmerlight,
                                    scaffoldBackgroundColor: bgColor,
                                    width: 270,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
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
                                      InkWell(
                                        onTap: () {
                                          Get.offAll(BottomNaviBar(
                                            index: 3,
                                          ));

                                          //        Get.to(()=> FlutterPainterExample());
                                        },
                                        child: Text(
                                          "Hello,",
                                          style: primaryFonts.copyWith(
                                              color: AppColors.black,
                                              fontSize: 19,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ),
                                      controller.getprofileData == null
                                          ? Text('No Data')
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
                              ),
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
                            items: [
                              Image.asset("assets/images/printer.png"),
                              Image.asset("assets/images/Rectangle 36.png"),
                              Image.asset("assets/images/Rectangle 37.png"),
                            ],
                          ),
                          ksizedbox5,
                          // Center(
                          //   child: DotsIndicator(
                          //       decorator: DotsDecorator(
                          //           color: Colors.grey,
                          //           activeColor: Colors.orange),
                          //       dotsCount: 3,
                          //       onTap: (index) {
                          //         setState(() {
                          //           activeIndex = index;
                          //         });
                          //       },
                          //       position: activeIndex),
                          // ),
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
                              ? RefreshIndicator(
                                  onRefresh: () => multisign.getRecee(),
                                  child: Container(
                                    height: 430,
                                    child: ListView(
                                      children: [
                                        GetBuilder<HomeController>(
                                            builder: (_) {
                                          return multisign
                                                  .getreceelistData.isEmpty
                                              ? Center(
                                                  child: Image.asset(
                                                      'assets/icons/fi_6598519.png'))
                                              : multisign.isLoading.isTrue
                                                  ? Column(
                                                      children: [
                                                        ksizedbox10,
                                                        ShimmerPro.text(
                                                          light: shimmerlight,
                                                          width: 450,
                                                          scaffoldBackgroundColor:
                                                              bgColor,
                                                        ),
                                                        ksizedbox10,
                                                        ShimmerPro.sized(
                                                          light: shimmerlight,
                                                          scaffoldBackgroundColor:
                                                              bgColor,
                                                          height: 60,
                                                          width: 450,
                                                        )
                                                      ],
                                                    )
                                                  : RefreshIndicator(
                                                      onRefresh: () =>
                                                          multisign.getRecee(),
                                                      child: ListView.builder(
                                                          physics:
                                                              BouncingScrollPhysics(),
                                                          shrinkWrap: true,
                                                          itemCount: multisign
                                                                      .getreceelistData
                                                                      .length >=
                                                                  3
                                                              ? 3
                                                              : multisign
                                                                  .getreceelistData
                                                                  .length,
                                                          //  multisign
                                                          //     .getreceelistData.length,
                                                          itemBuilder:
                                                              ((context,
                                                                  index) {
                                                            final reversedIndex =
                                                                multisign
                                                                        .getreceelistData
                                                                        .length -
                                                                    1 -
                                                                    index;
                                                            final item = multisign
                                                                    .getreceelistData[
                                                              reversedIndex];
                                                            return Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .symmetric(
                                                                      vertical:
                                                                          8),
                                                              child: InkWell(
                                                                onTap: () {
                                                                  print('?????????????>>>>>>>${item.id}');
                                                                  Get.to(
                                                                    
                                                                      GetReceeSubJob(
                                                                    id: item.id
                                                                        .toString(),
                                                                    storename: item
                                                                        .storeName,
                                                                  ));
                                                                },
                                                                child:
                                                                    ContainerCustom(
                                                                  id: item.id
                                                                      .toString(),
                                                                  name: item
                                                                      .clientName
                                                                      .toString(),
                                                                  city:
                                                                      item.storeName,
                                                                  jobcard: item
                                                                      .jobcard
                                                                      .toString(),
                                                                  day: formatDate(DateTime.parse(item
                                                                      .createdAt!
                                                                      
                                                                      .toString()), [yyyy,'-',mm,'-',dd]),
                                                                  address: '',
                                                                  month: '',
                                                                  year:'',
                                                                ),
                                                              ),
                                                            );
                                                          })),
                                                    );
                                        }),
                                      ],
                                    ),
                                  ),
                                )
                              : RefreshIndicator(
                                  onRefresh: () => multisign.getinstallation(),
                                  child: Container(
                                    height: 430,
                                    child: ListView(
                                      children: [
                                        GetBuilder<HomeController>(
                                            builder: (context) {
                                          return multisign
                                                  .installerListdata.isEmpty
                                              ? Center(
                                                  child: Image.asset(
                                                      'assets/icons/fi_6598519.png'))
                                              : multisign.isLoading.isTrue
                                                  ? Column(
                                                      children: [
                                                        ksizedbox10,
                                                        ShimmerPro.text(
                                                          light: shimmerlight,
                                                          width: 450,
                                                          scaffoldBackgroundColor:
                                                              bgColor,
                                                        ),
                                                        ksizedbox10,
                                                        ShimmerPro.sized(
                                                          light: shimmerlight,
                                                          scaffoldBackgroundColor:
                                                              bgColor,
                                                          height: 60,
                                                          width: 450,
                                                        )
                                                      ],
                                                    )
                                                  : RefreshIndicator(
                                                      onRefresh: () => multisign
                                                          .getinstallation(),
                                                      child: ListView.builder(
                                                          shrinkWrap: true,
                                                          itemCount: 
                                                          multisign
                                                                      .installerListdata
                                                                      .length
                                                                       >=
                                                                  3
                                                              ? 3
                                                              :
                                                               multisign
                                                                  .installerListdata
                                                                  .length,
                                                          itemBuilder:
                                                              ((context,
                                                                  index) {
                                                            final reversedIndex =
                                                                multisign
                                                                        .installerListdata
                                                                        .length -
                                                                    1 -
                                                                    index;
                                                            final item1 = multisign
                                                                    .installerListdata[
                                                                reversedIndex];
                                                            return Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .symmetric(
                                                                      vertical:
                                                                          8),
                                                              child: InkWell(
                                                                onTap: () {
                                                                  
                                                                  Get.to(GetInstallerSubJob(
                                                                      storename:
                                                                          item1
                                                                              .storeName,
                                                                      id: item1
                                                                          .id
                                                                          .toString()));
                                                                },
                                                                child:
                                                                    ContainerCustom(
                                                                  id: item1.id
                                                                      .toString(),
                                                                  name: item1
                                                                      .clientName.toString(),
                                                                  city: item1
                                                                      .shopName.toString(),
                                                                  jobcard: item1
                                                                      .shopcode.toString(),
                                                                  day:formatDate(DateTime.parse(item1.subjobDate.toString()), [yyyy,'-',mm,'-',dd]),
                                                                  address: '',
                                                                  month: '',
                                                                  year: '',
                                                                ),
                                                              ),
                                                            );
                                                          })),
                                                    );
                                        }),
                                      ],
                                    ),
                                  ),
                                ),
                          // const SizedBox(
                          //   height: 250,
                          // )
                        ],
                      );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
