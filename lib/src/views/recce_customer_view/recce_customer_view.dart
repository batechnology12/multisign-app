import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multisign_app/src/const/app_colors.dart';
import 'package:multisign_app/src/const/app_fonts.dart';
import 'package:multisign_app/src/controllers/home_controller.dart';
import 'package:multisign_app/src/controllers/profile_controller.dart';
import 'package:multisign_app/src/views/installation_customer_view/installation_report_Details.dart';
import 'package:multisign_app/src/views/notification/notification_epty_screen.dart';
import 'package:multisign_app/src/views/recce_customer_view/recce_report_details.dart';
import 'package:multisign_app/src/views/recce_customer_view/recce_store_name.dart';

class RecceCustomer extends StatefulWidget {
  RecceCustomer({super.key});

  @override
  State<RecceCustomer> createState() => _RecceCustomerState();
}

class _RecceCustomerState extends State<RecceCustomer> {
  // Declare a variable to store the filtered list
  List<dynamic> filteredList = [];

// In your _RecceCustomerState class, add a TextEditingController
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setDefau();
    filteredList = controller.getreceelistData;
  }

  setDefau(){
      WidgetsBinding.instance.addPostFrameCallback((_) {
       controller.getRecee();
    prfilecontroller.getprofile();
    });
   
  }

// Add a method to perform the search
  void performSearch(String query) {
    // Check if the query is empty
    if (query.isEmpty) {
      // If it is, reset the filteredList to the original list
      setState(() {
        filteredList = controller.getreceelistData;
      });
      return;
    }

    // Perform the filtering based on the query
    setState(() {
      filteredList = controller.getreceelistData.where((item) {
        // Implement your filtering logic here, for example, checking if the client name contains the query
        return item.clientName.toLowerCase().contains(query.toLowerCase());
      }).toList();
    });
  }

//String formattedDateTime = DateFormat('yyyy-MM-dd HH:mm:ss').format(now);
  final controller = Get.find<HomeController>();

  final prfilecontroller = Get.find<ProfileController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(126),
          child: Column(
            children: [
              AppBar(
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
                actions: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        Get.to(EmptyNotification());
                      },
                      child: Image.asset(
                        "assets/icons/notification.png",
                        height: 22,
                        width: 22,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15,),
                child:TextField(
  controller: searchController,
  onChanged: performSearch,
  decoration: InputDecoration(
    hintText: 'Search by client name...',
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30.0), // Adjust the radius as needed
    ),
    suffixIcon: IconButton(
      icon: Icon(Icons.clear),
      onPressed: () {
        // Clear the search field and reset the filtered list to the original list
        searchController.clear();
        performSearch('');
      },
    ),
  ),
),
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: prfilecontroller.getprofileData!.roleId == '2'
              ? GetBuilder<HomeController>(builder: (context) {
                  return filteredList.isEmpty
                  ? Center(
                      child: Image.asset('assets/icons/fi_6598519.png'))
                 
                      : ListView.builder(
                          shrinkWrap: true,
                          itemCount: controller.getreceelistData.length,
                          itemBuilder: ((context, index) {
                            return Card(
                              child: Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Get.to(RecceReportDetails(
                                        id: controller
                                            .getreceelistData[index].id
                                            .toString(),
                                      ));
                                    },
                                    child: Container(
                                      margin:
                                          EdgeInsets.only(bottom: 10, top: 4),
                                      height: 80,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        // color: Colors.grey[200]
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                ksizedbox10w,
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      controller
                                                          .getreceelistData[
                                                              index]
                                                          .clientName,
                                                      style:
                                                          primaryFonts.copyWith(
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              color: AppColors
                                                                  .black),
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
                                                        controller
                                                            .getreceelistData[
                                                                index]
                                                            .jobcard,
                                                        style: primaryFonts
                                                            .copyWith(
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                color: AppColors
                                                                    .black
                                                                    .withOpacity(
                                                                        .50))),
                                                                          if (controller
                                                                              .getreceelistData[index]
                                                                              .isReceeVerrified ==
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
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () {
                                                        Get.to(
                                                            RecceReportDetails(
                                                          id: controller
                                                              .getreceelistData[
                                                                  index]
                                                              .id
                                                              .toString(),
                                                        ));
                                                      },
                                                      child: Text('Full View',
                                                          style: primaryFonts.copyWith(
                                                              decoration:
                                                                  TextDecoration
                                                                      .underline,
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              color: AppColors
                                                                  .green)),
                                                    ),
                                                    Text(
                                                        controller
                                                            .getreceelistData[
                                                                index]
                                                            .createdAt
                                                            .toString(),
                                                        style: primaryFonts
                                                            .copyWith(
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w300,
                                                                color: AppColors
                                                                    .black)),
                                                    Text(
                                                        controller
                                                            .getreceelistData[
                                                                index]
                                                            .address,
                                                        style: primaryFonts
                                                            .copyWith(
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w300,
                                                                color: AppColors
                                                                    .black)),
                                              //  if (controller
                                              //                                 .getreceelistData[index]
                                              //                                 .isReceeVerrified ==
                                              //                             "1")
                                              //                           Text(
                                              //                             "completed",
                                              //                             style: TextStyle(
                                              //                                 color:
                                              //                                     Colors.green),
                                              //                           ),  
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
                          }));
                })
              : GetBuilder<HomeController>(builder: (context) {
                  return controller.installerListdata.isEmpty? 
                       Center(
                          child: CircularProgressIndicator(
                          color: AppColors.green,
                        ))
                      : ListView.builder(
                          shrinkWrap: true,
                          itemCount: controller.installerListdata.length,
                          itemBuilder: ((context, index) {
                            return Card(
                              child: Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Get.to(InstallationReportDetails(
                                        beforeImages: controller
                                            .installerListdata[index]
                                            .receeVerifications.last
                                            .beforeImages
                                          ,
                                        id: controller
                                            .installerListdata[index].id
                                            .toString(),
                                      ));
                                    },
                                    child: Container(
                                      margin:
                                          EdgeInsets.only(bottom: 10, top: 4),
                                      height: 80,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          //  color: Colors.grey[200],
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
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
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    //Image.network(controller.installerListdata[index].receeVerifications[index].beforeImages.first,height: 50,),
                                                    Text(
                                                        controller
                                                            .installerListdata[
                                                                index]
                                                            .clientName,
                                                        style: primaryFonts
                                                            .copyWith(
                                                                fontSize: 15,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                color: AppColors
                                                                    .black)),
                                                    Text(
                                                        "${controller.installerListdata[index].address}, ${controller.installerListdata[index].city}",
                                                        style: primaryFonts
                                                            .copyWith(
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                color: AppColors
                                                                    .black
                                                                    .withOpacity(
                                                                        .70))),
                                                    Text(
                                                        'Job Id:${controller.installerListdata[index].jobcard}}',
                                                        style: primaryFonts
                                                            .copyWith(
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                color: AppColors
                                                                    .black
                                                                    .withOpacity(
                                                                        .50))),
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
                                                    GestureDetector(
                                                      onTap: () {
                                                        Get.to(InstallationReportDetails(
                                                            beforeImages: controller
                                                                .installerListdata[
                                                                    index]
                                                                .receeVerifications.last
                                                                    
                                                                .beforeImages
                                                                ,
                                                            id: controller
                                                                .installerListdata[
                                                                    index]
                                                                .id
                                                                .toString()));
                                                      },
                                                      child: Text('Full View',
                                                          style: primaryFonts.copyWith(
                                                              decoration:
                                                                  TextDecoration
                                                                      .underline,
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              color: AppColors
                                                                  .green)),
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
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }));
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
                        primary: AppColors.green,
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
