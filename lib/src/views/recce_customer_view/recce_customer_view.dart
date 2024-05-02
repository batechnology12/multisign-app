import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multisign_app/src/const/app_colors.dart';
import 'package:multisign_app/src/const/app_fonts.dart';
import 'package:multisign_app/src/controllers/home_controller.dart';
import 'package:multisign_app/src/controllers/profile_controller.dart';
import 'package:multisign_app/src/views/installation_customer_view/get_installer_sub_job.dart';
import 'package:multisign_app/src/views/recce_customer_view/get_recce_sub_job.dart';
import 'package:shimmer_pro/shimmer_pro.dart';
import 'package:svg_flutter/svg.dart';

class RecceCustomer extends StatefulWidget {
  RecceCustomer({super.key});

  @override
  State<RecceCustomer> createState() => _RecceCustomerState();
}

class _RecceCustomerState extends State<RecceCustomer> {

  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _themeMode();
    setDefau();
  }

  setDefau() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.getRecee();
      prfilecontroller.getprofile();
      
    });
  }


  late Color bgColor;
  bool isThemeDark = true;

  late ShimmerProLight shimmerlight;

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



  final controller = Get.find<HomeController>();
  final prfilecontroller = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(126),
          child: Column(
            children: [
              AppBar(
                backgroundColor: Colors.grey[100],
                centerTitle: true,
                title: prfilecontroller.getprofileData!.roleId == '2'
                    ? Text("Recce Customer",
                        style: primaryFonts.copyWith(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: AppColors.black))
                    : Text("Installer Customer",
                        style: primaryFonts.copyWith(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: AppColors.black)),
                // actions: [
                //   Padding(
                //     padding: const EdgeInsets.all(8.0),
                //     child: GestureDetector(
                //       onTap: () {
                //         Get.to(EmptyNotification());
                //       },
                //       child: Image.asset(
                //         "assets/icons/notification.png",
                //         height: 22,
                //         width: 22,
                //       ),
                //     ),
                //   ),
                // ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                ),
                child: GetBuilder<HomeController>(builder: (_) {
                  return Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                              color: const Color.fromARGB(255, 216, 216, 216)
                                  .withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 5,
                              offset: const Offset(0, 5))
                        ]),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        SvgPicture.asset('assets/images/Vector.svg'),
                        // Image(image: kimgsearch),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: TextField(
                            onChanged: (query) {
                              controller.searchcustomers(query: query);
                            },
                            controller: searchController,
                            decoration: InputDecoration.collapsed(
                              hintText: "Search",
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: prfilecontroller.getprofileData == null
              ? Column(
                  children: [
                    ShimmerPro.text(
                      light: shimmerlight,
                      scaffoldBackgroundColor: bgColor,
                      width: 450,
                    ),
                    ksizedbox10,
                    ShimmerPro.sized(
                      light: shimmerlight,
                      scaffoldBackgroundColor: bgColor,
                      width: 450,
                      height: 50,
                    ),
                    ksizedbox10,
                  ],
                )
              : prfilecontroller.getprofileData!.roleId == '2'
                  ? GetBuilder<HomeController>(builder: (_) {
                      return controller.getreceelistData.isEmpty
                          ? Center(
                              child: Image.asset('assets/icons/fi_6598519.png'))
                          : controller.isLoading.isTrue
                              ? Column(
                                  children: [
                                    ShimmerPro.text(
                                      light: shimmerlight,
                                      scaffoldBackgroundColor: bgColor,
                                      width: 450,
                                    ),
                                    ksizedbox10,
                                    ShimmerPro.sized(
                                      light: shimmerlight,
                                      scaffoldBackgroundColor: bgColor,
                                      width: 450,
                                      height: 50,
                                    ),
                                    ksizedbox10,
                                    ShimmerPro.text(
                                      light: shimmerlight,
                                      scaffoldBackgroundColor: bgColor,
                                      width: 450,
                                    ),
                                    ksizedbox10,
                                    ShimmerPro.sized(
                                      light: shimmerlight,
                                      scaffoldBackgroundColor: bgColor,
                                      width: 450,
                                      height: 50,
                                    ),
                                    ksizedbox10,
                                    ShimmerPro.text(
                                      light: shimmerlight,
                                      scaffoldBackgroundColor: bgColor,
                                      width: 450,
                                    ),
                                    ksizedbox10,
                                    ShimmerPro.sized(
                                      light: shimmerlight,
                                      scaffoldBackgroundColor: bgColor,
                                      width: 450,
                                      height: 50,
                                    ),
                                    ksizedbox10,
                                  ],
                                )
                              : RefreshIndicator(
                                  onRefresh: () => controller.getRecee(),
                                  child: ListView.builder(
                                      // physics: BouncingScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount:
                                          controller.getreceelistData.length,
                                      itemBuilder: ((context, index) {
                                        return Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 8),
                                          child: InkWell(
                                            onTap: () {
                                              Get.to(GetReceeSubJob(
                                                id: controller
                                                    .getreceelistData[index].id
                                                    .toString(), storename: controller
                                                    .getreceelistData[index].storeName ,
                                              ));
                                            },
                                            child: ContainerCustom(
                                              id: controller
                                                  .getreceelistData[index].id
                                                  .toString(),
                                              name: controller
                                                  .getreceelistData[index]
                                                  .clientName.toString(),
                                              city: controller
                                                  .getreceelistData[index].city,
                                              jobcard: controller
                                                  .getreceelistData[index]
                                                  .jobcard.toString(),
                                              day: controller
                                                  .getreceelistData[index]
                                                  .createdAt!
                                                  .day
                                                  .toString(),
                                              address: controller
                                                  .getreceelistData[index]
                                                  .address,
                                              month: controller
                                                  .getreceelistData[index]
                                                  .createdAt!
                                                  .month
                                                  .toString(),
                                              year: controller
                                                  .getreceelistData[index]
                                                  .createdAt!
                                                  .year
                                                  .toString(),
                                            ),
                                          ),
                                        );
                                      })),
                                );
                    })
                  : GetBuilder<HomeController>(builder: (_) {
                      return controller.installerListdata.isEmpty
                          ? Center(
                              child: Image.asset('assets/icons/fi_6598519.png'))
                          : controller.isLoading.isTrue
                              ?
                              // filteredList.isEmpty?
                              Column(
                                  children: [
                                    ShimmerPro.text(
                                      light: shimmerlight,
                                      scaffoldBackgroundColor: bgColor,
                                      width: 450,
                                    ),
                                    ksizedbox10,
                                    ShimmerPro.sized(
                                      light: shimmerlight,
                                      scaffoldBackgroundColor: bgColor,
                                      width: 450,
                                      height: 50,
                                    ),
                                    ksizedbox10,
                                    ShimmerPro.text(
                                      light: shimmerlight,
                                      scaffoldBackgroundColor: bgColor,
                                      width: 450,
                                    ),
                                    ksizedbox10,
                                    ShimmerPro.sized(
                                      light: shimmerlight,
                                      scaffoldBackgroundColor: bgColor,
                                      width: 450,
                                      height: 50,
                                    ),
                                    ksizedbox10,
                                    ShimmerPro.text(
                                      light: shimmerlight,
                                      scaffoldBackgroundColor: bgColor,
                                      width: 450,
                                    ),
                                    ksizedbox10,
                                    ShimmerPro.sized(
                                      light: shimmerlight,
                                      scaffoldBackgroundColor: bgColor,
                                      width: 450,
                                      height: 50,
                                    ),
                                    ksizedbox10,
                                  ],
                                )
                              : RefreshIndicator(
                                  onRefresh: () => controller.getinstallation(),
                                  child: ListView.builder(
                                      shrinkWrap: true,
                                      itemCount:
                                          controller.installerListdata.length,
                                      itemBuilder: ((context, index) {
                                        return Padding(
                                          padding: const EdgeInsets.symmetric(vertical: 8),
                                          child: InkWell(
                                            onTap: () {
                                              Get.to(GetInstallerSubJob(storename:controller
                                                      .installerListdata[index].storeName,
                                                  id: controller
                                                      .installerListdata[index].id
                                                      .toString()));
                                            },
                                            child: ContainerCustom(
                                              id: controller
                                                  .installerListdata[index].id
                                                  .toString(),
                                              name: controller
                                                  .installerListdata[index]
                                                  .clientName.toString(),
                                              city: controller
                                                  .installerListdata[index].city,
                                              jobcard: controller
                                                  .installerListdata[index]
                                                  .jobcard.toString(),
                                              day: controller
                                                  .installerListdata[index]
                                                  .createdAt!
                                                  .day
                                                  .toString(),
                                              address: controller
                                                  .installerListdata[index]
                                                  .address,
                                              month: controller
                                                  .installerListdata[index]
                                                  .createdAt!
                                                  .month
                                                  .toString(),
                                              year: controller
                                                  .installerListdata[index]
                                                  .createdAt!
                                                  .year
                                                  .toString(),
                                            ),
                                          ),
                                        );
                                      })),
                                );
                    }),
        ));
  }

  popUp() {
    return showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: Container(
              padding:
                  EdgeInsets.only(left: 14, top: 13, right: 13, bottom: 30),
              height: 345,
              width: 385,
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(8)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Recce Customer Filters",
                        style: primaryFonts.copyWith(
                            fontSize: 15,
                            color: AppColors.black,
                            fontWeight: FontWeight.w500),
                      ),
                      GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Image.asset(
                            "assets/icons/clear.png",
                            height: 30,
                            width: 30,
                          )),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    height: 40,
                    width: 350,
                    decoration: BoxDecoration(
                        color: AppColors.lightGrey.withOpacity(.30),
                        borderRadius: BorderRadius.circular(8)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "All",
                          style: primaryFonts.copyWith(
                              color: AppColors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        ),
                        Image.asset("assets/icons/check.png")
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    height: 40,
                    width: 350,
                    decoration: BoxDecoration(
                        color: AppColors.lightGrey.withOpacity(.30),
                        borderRadius: BorderRadius.circular(8)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Completed List",
                          style: primaryFonts.copyWith(
                              color: AppColors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        ),
                        Container(
                          height: 28,
                          width: 28,
                          child: const Icon(Icons.info,
                              color: Color.fromARGB(255, 18, 118, 169)),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    height: 40,
                    width: 350,
                    decoration: BoxDecoration(
                        color: AppColors.lightGrey.withOpacity(.30),
                        borderRadius: BorderRadius.circular(8)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Pending List",
                          style: primaryFonts.copyWith(
                              color: AppColors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        ),
                        Container(
                          height: 28,
                          width: 28,
                          child: const Icon(Icons.info,
                              color: Color.fromARGB(255, 18, 118, 169)),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        textStyle: TextStyle(fontSize: 350),
                        backgroundColor: AppColors.green,
                        minimumSize: Size(300, 45)),
                    onPressed: () {},
                    child: Text(
                      "Submit",
                      style: primaryFonts.copyWith(
                          color: AppColors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}

class ContainerCustom extends StatelessWidget {
  final String id;
  final String name;
  final String city;
  final String jobcard;
  final String day;
  final String month;
  final String year;
  final String address;
  final String? isverified;
  const ContainerCustom({
    super.key,
    required this.id,
    required this.name,
    required this.city,
    required this.jobcard,
    required this.day,
    required this.address,
    required this.month,
    required this.year,
    this.isverified,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                color:
                    const Color.fromARGB(255, 216, 216, 216).withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 5,
                offset: const Offset(0, 5))
          ]),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              // margin: EdgeInsets.only(
              //     bottom: 10, top: 4),
              height: 80,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                // color: Colors.grey[200]
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.amberAccent,
                        radius: 30,
                        child: Text(
                          id,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      ksizedbox10w,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name,
                            style: primaryFonts.copyWith(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: AppColors.black),
                          ),
                          ksizedbox5,
                          Text(city,
                              style: primaryFonts.copyWith(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.black.withOpacity(.50))),
                          ksizedbox5,
                          Text("JOB ID : ${jobcard}",
                              style: primaryFonts.copyWith(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.black.withOpacity(.50))),
                          // if (controller
                          //         .getreceelistData[
                          //             index]
                          //         .isReceeVerrified ==
                          //     "1")
                          //   Text(
                          //     'Completed',
                          //     style: TextStyle(
                          //         color:
                          //             Colors.green),
                          //   )
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // GestureDetector(
                          //   onTap: () {
                          //     // Get.to(
                          //     //     RecceReportDetails(
                          //     //         flag: true,
                          //     //   id: controller
                          //     //       .getreceelistData[
                          //     //           index]
                          //     //       .id
                          //     //       .toString(),
                          //     // ));
                          //   },
                          //   child: Text(
                          //       'Full View',
                          //       style: primaryFonts.copyWith(
                          //           decoration: TextDecoration
                          //               .underline,
                          //           decorationColor: AppColors
                          //               .green,
                          //           fontSize:
                          //               13,
                          //           fontWeight: FontWeight
                          //               .w700,
                          //           color:
                          //               AppColors.green)),
                          // ),
                          Text("${day}",
                              style: primaryFonts.copyWith(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.black.withOpacity(.50))),ksizedbox5,
                          Text(address,
                              style: primaryFonts.copyWith(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.black.withOpacity(.50))),ksizedbox5,
                           if (isverified ==
                                                      "1")
                                                    Text(
                                                      "completed",
                                                      style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,
                                                          color:
                                                              Colors.green),
                                                    ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
