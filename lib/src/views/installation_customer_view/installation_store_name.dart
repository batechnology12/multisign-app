import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multisign_app/src/const/app_colors.dart';
import 'package:multisign_app/src/const/app_fonts.dart';
import 'package:multisign_app/src/controllers/home_controller.dart';
import 'package:multisign_app/src/views/installation_customer_view/installation_report_Details.dart';

class InstallationStoreName extends StatefulWidget {
  final String id;
  const InstallationStoreName({super.key, required this.id});

  @override
  State<InstallationStoreName> createState() => _InstallationStoreNameState();
}

class _InstallationStoreNameState extends State<InstallationStoreName> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setDefault();
  }

  setDefault() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.getinstallerdetails(id: widget.id);
    });
  }

  final controller = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Installation Store Name",
            style: primaryFonts.copyWith(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: AppColors.black)),
      ),
      body:
          // Center(child: Image.asset('assets/icons/fi_6598519.png'))R
          Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: GetBuilder<HomeController>(builder: (_) {
          return controller.isLoadingdatails.isTrue
              ? Center(
                  child: CircularProgressIndicator(
                    color: AppColors.green,
                  ),
                )
              : Column(
                  children: [
                    Container(
                      height: 45,
                      decoration: BoxDecoration(
                          color: AppColors.black.withOpacity(.02),
                          borderRadius: BorderRadius.circular(6)),
                      child: TextFormField(
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(top: 5, left: 10),
                            hintText: "Search Store and Branch",
                            hintStyle: primaryFonts.copyWith(
                                color: AppColors.black.withOpacity(.50)),
                            border: InputBorder.none,
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6),
                                borderSide: BorderSide(
                                    width: 1,
                                    color: AppColors.black.withOpacity(.20))),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6),
                                borderSide: BorderSide(
                                    width: 1, color: AppColors.grey))),
                      ),
                    ),
                    ksizedbox30,
                    Text(
                      "Project Name Details",
                      style: primaryFonts.copyWith(
                          color: AppColors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                    ),
                    ksizedbox10,
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      height: 40,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: AppColors.lightGrey.withOpacity(.30),
                          borderRadius: BorderRadius.circular(8)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          controller.getinstallerdetailsData == null
                              ? Text('Addreas A')
                              : Text(
                                  controller
                                      .getinstallerdetailsData!.clientName,
                                  style: primaryFonts.copyWith(
                                      color: AppColors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400),
                                ),
                          Container(
                            height: 22,
                            width: 22,
                            decoration: BoxDecoration(
                                color: AppColors.pink, shape: BoxShape.circle),
                          ),
                        ],
                      ),
                    ),
                    ksizedbox20,
                    Container(
                      padding: EdgeInsets.only(left: 10, top: 10),
                      height: 40,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: AppColors.lightGrey.withOpacity(.30),
                          borderRadius: BorderRadius.circular(8)),
                      child: Text(
                        'DATA A',
                        //   controller.getinstallerdetailsData!.address,
                        style: primaryFonts.copyWith(
                            color: AppColors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    ksizedbox20,
                    Container(
                      padding: EdgeInsets.only(left: 10, top: 10),
                      height: 40,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: AppColors.lightGrey.withOpacity(.30),
                          borderRadius: BorderRadius.circular(8)),
                      child: Text(
                        'DATA B',
                        //  controller.getinstallerdetailsData!.designing,
                        style: primaryFonts.copyWith(
                            color: AppColors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    ksizedbox30,
                    Text(
                      "Store Name Details",
                      style: primaryFonts.copyWith(
                          color: AppColors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                    ),
                    ksizedbox10,
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      height: 40,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: AppColors.lightGrey.withOpacity(.30),
                          borderRadius: BorderRadius.circular(8)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // controller.getinstallerdetailsData == null
                          //       ?
                          //    Text('Addreas B')
                          //:
                          Text(
                            'Client B',
                            // controller
                            //  .getinstallerdetailsData!.clientName,
                            style: primaryFonts.copyWith(
                                color: AppColors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.w400),
                          ),
                          IconButton(
                              onPressed: () {
                                Get.to(InstallationReportDetails());
                              },
                              icon: Icon(Icons.arrow_forward)),
                        ],
                      ),
                    ),
                    ksizedbox20,
                    // Container(
                    //   padding: EdgeInsets.symmetric(horizontal: 10),
                    //   height: 40,
                    //   width: double.infinity,
                    //   decoration: BoxDecoration(
                    //       color: AppColors.lightGrey.withOpacity(.30),
                    //       borderRadius: BorderRadius.circular(8)),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //     children: [controller.getinstallerdetailsData==null?Text('Dummy Data'):
                    //       Text(
                    //   controller.getinstallerdetailsData!.city,
                    //         style: primaryFonts.copyWith(
                    //             color: AppColors.black,
                    //             fontSize: 12,
                    //             fontWeight: FontWeight.w400),
                    //       ),
                    //       IconButton(onPressed: () {}, icon: Icon(Icons.arrow_forward))
                    //     ],
                    //   ),
                    // ),
                    // ksizedbox20,
                    // Container(
                    //   padding: EdgeInsets.symmetric(horizontal: 10),
                    //   height: 40,
                    //   width: double.infinity,
                    //   decoration: BoxDecoration(
                    //       color: AppColors.lightGrey.withOpacity(.30),
                    //       borderRadius: BorderRadius.circular(8)),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //     children: [
                    //       Text(
                    //        controller.getinstallerdetailsData!.designing,
                    //         style: primaryFonts.copyWith(
                    //             color: AppColors.black,
                    //             fontSize: 12,
                    //             fontWeight: FontWeight.w400),
                    //       ),
                    //       IconButton(onPressed: () {}, icon: Icon(Icons.arrow_forward))
                    //     ],
                    //   ),
                    // ),
                  ],
                );
        }),
      ),
    );
  }
}
