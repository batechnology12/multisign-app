import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:multisign_app/src/const/app_colors.dart';
import 'package:multisign_app/src/const/app_constant.dart';
import 'package:multisign_app/src/const/app_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multisign_app/src/const/bottom_navi_bar.dart';
import 'package:multisign_app/src/controllers/home_controller.dart';

class InstallationReportDetails extends StatefulWidget {
  final String id;
  final List beforeImages;
  const InstallationReportDetails(
      {super.key, required this.id, required this.beforeImages});

  @override
  State<InstallationReportDetails> createState() =>
      _InstallationReportDetailsState();
}

class _InstallationReportDetailsState extends State<InstallationReportDetails> {
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setDefault();
  }

  setDefault() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.getinstallerdetails(id: widget.id);

      controller.setImagePathEmpty();
      controller.setImagesEmpty();
    });
  }

  HomeController controller = Get.find<HomeController>();
  final TextEditingController job_cardContoller = TextEditingController();
  final _ImagePath = ''.obs;
  String? get ImagePath => _ImagePath.value;
  File? photo;
  File? image;
  ImagePicker imagePicker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Installation Report Details",
            style: primaryFonts.copyWith(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: AppColors.black)),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: SingleChildScrollView(
          child: GetBuilder<HomeController>(builder: (context) {
            return controller.getinstallerdetailsData == null
                ? Center(
                    child: CircularProgressIndicator(
                      color: AppColors.green,
                    ),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Project Details",
                        style: primaryFonts.copyWith(
                            color: AppColors.red,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                      ksizedbox15,
                      Container(
                        height: 45,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4)),
                        child: TextFormField(
                          readOnly: true,
                          //keyboardType: TextInputType.number,
                          controller: job_cardContoller,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(top: 5, left: 10),
                              hintText: controller
                                  .getinstallerdetailsData!.clientName,
                              hintStyle: primaryFonts.copyWith(
                                  color: AppColors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                              //labelText: "JOB CARD",
                              labelStyle: primaryFonts.copyWith(
                                  color: AppColors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                              border: InputBorder.none,
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4),
                                  borderSide: BorderSide(
                                      width: 1, color: AppColors.black)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4),
                                  borderSide: BorderSide(
                                      width: 1, color: AppColors.black))),
                        ),
                      ),
                      //     ksizedbox15,
                      ksizedbox15,
                      Container(
                        height: 45,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4)),
                        child: TextFormField(
                          readOnly: true,
                          //keyboardType: TextInputType.number,
                          controller: job_cardContoller,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(top: 5, left: 10),
                              hintText: controller
                                  .getinstallerdetailsData!.scopeOfWork,
                              hintStyle: primaryFonts.copyWith(
                                  color: AppColors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                              //labelText: "JOB CARD",
                              labelStyle: primaryFonts.copyWith(
                                  color: AppColors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                              border: InputBorder.none,
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4),
                                  borderSide: BorderSide(
                                      width: 1, color: AppColors.black)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4),
                                  borderSide: BorderSide(
                                      width: 1, color: AppColors.black))),
                        ),
                      ),
                      ksizedbox15,
                      Container(
                        height: 45,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4)),
                        child: TextFormField(
                          readOnly: true,
                          //keyboardType: TextInputType.number,
                          controller: job_cardContoller,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(top: 5, left: 10),
                              hintText:
                                  controller.getinstallerdetailsData!.address,
                              hintStyle: primaryFonts.copyWith(
                                  color: AppColors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                              //labelText: "JOB CARD",
                              labelStyle: primaryFonts.copyWith(
                                  color: AppColors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                              border: InputBorder.none,
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4),
                                  borderSide: BorderSide(
                                      width: 1, color: AppColors.black)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4),
                                  borderSide: BorderSide(
                                      width: 1, color: AppColors.black))),
                        ),
                      ),
                      ksizedbox15,
                      Container(
                        height: 45,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4)),
                        child: TextFormField(
                          readOnly: true,
                          //keyboardType: TextInputType.number,
                          controller: job_cardContoller,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(top: 5, left: 10),
                              hintText:
                                  controller.getinstallerdetailsData!.city,
                              hintStyle: primaryFonts.copyWith(
                                  color: AppColors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                              //labelText: "JOB CARD",
                              labelStyle: primaryFonts.copyWith(
                                  color: AppColors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                              border: InputBorder.none,
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4),
                                  borderSide: BorderSide(
                                      width: 1, color: AppColors.black)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4),
                                  borderSide: BorderSide(
                                      width: 1, color: AppColors.black))),
                        ),
                      ),
                      ksizedbox15,
                      Container(
                        height: 45,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4)),
                        child: TextFormField(
                          readOnly: true,
                          //keyboardType: TextInputType.number,
                          controller: job_cardContoller,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(top: 5, left: 10),
                              hintText:
                                  controller.getinstallerdetailsData!.state,
                              hintStyle: primaryFonts.copyWith(
                                  color: AppColors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                              //labelText: "JOB CARD",
                              labelStyle: primaryFonts.copyWith(
                                  color: AppColors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                              border: InputBorder.none,
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4),
                                  borderSide: BorderSide(
                                      width: 1, color: AppColors.black)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4),
                                  borderSide: BorderSide(
                                      width: 1, color: AppColors.black))),
                        ),
                      ),
                      ksizedbox15,
                      Container(
                        height: 45,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4)),
                        child: TextFormField(
                          readOnly: true,
                          //keyboardType: TextInputType.number,
                          controller: job_cardContoller,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(top: 5, left: 10),
                              hintText:
                                  controller.getinstallerdetailsData!.jobcard,
                              hintStyle: primaryFonts.copyWith(
                                  color: AppColors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                              //labelText: "JOB CARD",
                              labelStyle: primaryFonts.copyWith(
                                  color: AppColors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                              border: InputBorder.none,
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4),
                                  borderSide: BorderSide(
                                      width: 1, color: AppColors.black)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4),
                                  borderSide: BorderSide(
                                      width: 1, color: AppColors.black))),
                        ),
                      ),
                      ksizedbox15,
                      Container(
                        height: 45,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4)),
                        child: TextFormField(
                          readOnly: true,
                          //keyboardType: TextInputType.number,
                          controller: job_cardContoller,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(top: 5, left: 10),
                              hintText:
                                  controller.getinstallerdetailsData!.gstNumber,
                              hintStyle: primaryFonts.copyWith(
                                  color: AppColors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                              //labelText: "JOB CARD",
                              labelStyle: primaryFonts.copyWith(
                                  color: AppColors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                              border: InputBorder.none,
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4),
                                  borderSide: BorderSide(
                                      width: 1, color: AppColors.black)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4),
                                  borderSide: BorderSide(
                                      width: 1, color: AppColors.black))),
                        ),
                      ),
                      ksizedbox15,
                      Container(
                        height: 45,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4)),
                        child: TextFormField(
                          readOnly: true,
                          //keyboardType: TextInputType.number,
                          controller: job_cardContoller,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(top: 5, left: 10),
                              hintText:
                                  controller.getinstallerdetailsData!.poNumber,
                              hintStyle: primaryFonts.copyWith(
                                  color: AppColors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                              //labelText: "JOB CARD",
                              labelStyle: primaryFonts.copyWith(
                                  color: AppColors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                              border: InputBorder.none,
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4),
                                  borderSide: BorderSide(
                                      width: 1, color: AppColors.black)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4),
                                  borderSide: BorderSide(
                                      width: 1, color: AppColors.black))),
                        ),
                      ),
                      ksizedbox15,
                      // Container(
                      //   height: 45,
                      //   decoration:
                      //       BoxDecoration(borderRadius: BorderRadius.circular(4)),
                      //   child: TextFormField(
                      //     decoration: InputDecoration(
                      //         contentPadding: EdgeInsets.only(top: 5, left: 10),
                      //         hintText: "Chennai",
                      //         hintStyle: primaryFonts.copyWith(
                      //             color: AppColors.black.withOpacity(.20),
                      //             fontSize: 13,
                      //             fontWeight: FontWeight.w600),
                      //         labelText: "City",
                      //         labelStyle: primaryFonts.copyWith(
                      //             color: AppColors.black,
                      //             fontSize: 14,
                      //             fontWeight: FontWeight.w600),
                      //         border: InputBorder.none,
                      //         enabledBorder: OutlineInputBorder(
                      //             borderRadius: BorderRadius.circular(4),
                      //             borderSide:
                      //                 BorderSide(width: 1, color: AppColors.black)),
                      //         focusedBorder: OutlineInputBorder(
                      //             borderRadius: BorderRadius.circular(4),
                      //             borderSide:
                      //                 BorderSide(width: 1, color: AppColors.black))),
                      //   ),
                      // ),
                      // ksizedbox15,
                      // Container(
                      //   height: 45,
                      //   decoration:
                      //       BoxDecoration(borderRadius: BorderRadius.circular(4)),
                      //   child: TextFormField(
                      //     decoration: InputDecoration(
                      //         contentPadding: EdgeInsets.only(top: 5, left: 10),
                      //         hintText: "Anna Nagar",
                      //         hintStyle: primaryFonts.copyWith(
                      //             color: AppColors.black.withOpacity(.20),
                      //             fontSize: 13,
                      //             fontWeight: FontWeight.w600),
                      //         labelText: "Address",
                      //         labelStyle: primaryFonts.copyWith(
                      //             color: AppColors.black,
                      //             fontSize: 14,
                      //             fontWeight: FontWeight.w600),
                      //         border: InputBorder.none,
                      //         enabledBorder: OutlineInputBorder(
                      //             borderRadius: BorderRadius.circular(4),
                      //             borderSide:
                      //                 BorderSide(width: 1, color: AppColors.black)),
                      //         focusedBorder: OutlineInputBorder(
                      //             borderRadius: BorderRadius.circular(4),
                      //             borderSide:
                      //                 BorderSide(width: 1, color: AppColors.black))),
                      //   ),
                      // ),
                      // ksizedbox20,
                      // Text(
                      //   "Signage Details",
                      //   style: primaryFonts.copyWith(
                      //       color: AppColors.red,
                      //       fontSize: 18,
                      //       fontWeight: FontWeight.w500),
                      // ),
                      // ksizedbox20,
                      // Container(
                      //   height: 45,
                      //   decoration:
                      //       BoxDecoration(borderRadius: BorderRadius.circular(4)),
                      //   child: TextFormField(
                      //     decoration: InputDecoration(
                      //         contentPadding: EdgeInsets.only(top: 5, left: 10),
                      //         hintText: "Praksh MP",
                      //         hintStyle: primaryFonts.copyWith(
                      //             color: AppColors.black.withOpacity(.20),
                      //             fontSize: 13,
                      //             fontWeight: FontWeight.w600),
                      //         labelText: "Dealer Name",
                      //         labelStyle: primaryFonts.copyWith(
                      //             color: AppColors.black,
                      //             fontSize: 14,
                      //             fontWeight: FontWeight.w600),
                      //         border: InputBorder.none,
                      //         enabledBorder: OutlineInputBorder(
                      //             borderRadius: BorderRadius.circular(4),
                      //             borderSide:
                      //                 BorderSide(width: 1, color: AppColors.black)),
                      //         focusedBorder: OutlineInputBorder(
                      //             borderRadius: BorderRadius.circular(4),
                      //             borderSide:
                      //                 BorderSide(width: 1, color: AppColors.black))),
                      //   ),
                      // ),
                      // ksizedbox15,
                      // Container(
                      //   height: 45,
                      //   decoration:
                      //       BoxDecoration(borderRadius: BorderRadius.circular(4)),
                      //   child: TextFormField(
                      //     decoration: InputDecoration(
                      //         contentPadding: EdgeInsets.only(top: 5, left: 10),
                      //         hintText: "Redmi Shop",
                      //         hintStyle: primaryFonts.copyWith(
                      //             color: AppColors.black.withOpacity(.20),
                      //             fontSize: 13,
                      //             fontWeight: FontWeight.w600),
                      //         labelText: "Store Name",
                      //         labelStyle: primaryFonts.copyWith(
                      //             color: AppColors.black,
                      //             fontSize: 14,
                      //             fontWeight: FontWeight.w600),
                      //         border: InputBorder.none,
                      //         enabledBorder: OutlineInputBorder(
                      //             borderRadius: BorderRadius.circular(4),
                      //             borderSide:
                      //                 BorderSide(width: 1, color: AppColors.black)),
                      //         focusedBorder: OutlineInputBorder(
                      //             borderRadius: BorderRadius.circular(4),
                      //             borderSide:
                      //                 BorderSide(width: 1, color: AppColors.black))),
                      //   ),
                      // ),
                      // ksizedbox15,
                      // Container(
                      //   height: 45,
                      //   decoration:
                      //       BoxDecoration(borderRadius: BorderRadius.circular(4)),
                      //   child: TextFormField(
                      //     decoration: InputDecoration(
                      //         contentPadding: EdgeInsets.only(top: 5, left: 10),
                      //         hintText: "Redmi Shop",
                      //         hintStyle: primaryFonts.copyWith(
                      //             color: AppColors.black.withOpacity(.20),
                      //             fontSize: 13,
                      //             fontWeight: FontWeight.w600),
                      //         labelText: "City",
                      //         labelStyle: primaryFonts.copyWith(
                      //             color: AppColors.black,
                      //             fontSize: 14,
                      //             fontWeight: FontWeight.w600),
                      //         border: InputBorder.none,
                      //         enabledBorder: OutlineInputBorder(
                      //             borderRadius: BorderRadius.circular(4),
                      //             borderSide:
                      //                 BorderSide(width: 1, color: AppColors.black)),
                      //         focusedBorder: OutlineInputBorder(
                      //             borderRadius: BorderRadius.circular(4),
                      //             borderSide:
                      //                 BorderSide(width: 1, color: AppColors.black))),
                      //   ),
                      // ),
                      // ksizedbox15,
                      // Container(
                      //   height: 45,
                      //   decoration:
                      //       BoxDecoration(borderRadius: BorderRadius.circular(4)),
                      //   child: TextFormField(
                      //     decoration: InputDecoration(
                      //         contentPadding: EdgeInsets.only(top: 5, left: 10),
                      //         hintText: "Perambur",
                      //         hintStyle: primaryFonts.copyWith(
                      //             color: AppColors.black.withOpacity(.20),
                      //             fontSize: 13,
                      //             fontWeight: FontWeight.w600),
                      //         labelText: "Area Name",
                      //         labelStyle: primaryFonts.copyWith(
                      //             color: AppColors.black,
                      //             fontSize: 14,
                      //             fontWeight: FontWeight.w600),
                      //         border: InputBorder.none,
                      //         enabledBorder: OutlineInputBorder(
                      //             borderRadius: BorderRadius.circular(4),
                      //             borderSide:
                      //                 BorderSide(width: 1, color: AppColors.black)),
                      //         focusedBorder: OutlineInputBorder(
                      //             borderRadius: BorderRadius.circular(4),
                      //             borderSide:
                      //                 BorderSide(width: 1, color: AppColors.black))),
                      //   ),
                      // ),
                      // ksizedbox15,
                      // Container(
                      //   height: 45,
                      //   decoration:
                      //       BoxDecoration(borderRadius: BorderRadius.circular(4)),
                      //   child: TextFormField(
                      //     decoration: InputDecoration(
                      //         contentPadding: EdgeInsets.only(top: 5, left: 10),
                      //         hintText: "Chennai",
                      //         hintStyle: primaryFonts.copyWith(
                      //             color: AppColors.black.withOpacity(.20),
                      //             fontSize: 13,
                      //             fontWeight: FontWeight.w600),
                      //         labelText: "Address",
                      //         labelStyle: primaryFonts.copyWith(
                      //             color: AppColors.black,
                      //             fontSize: 14,
                      //             fontWeight: FontWeight.w600),
                      //         border: InputBorder.none,
                      //         enabledBorder: OutlineInputBorder(
                      //             borderRadius: BorderRadius.circular(4),
                      //             borderSide:
                      //                 BorderSide(width: 1, color: AppColors.black)),
                      //         focusedBorder: OutlineInputBorder(
                      //             borderRadius: BorderRadius.circular(4),
                      //             borderSide:
                      //                 BorderSide(width: 1, color: AppColors.black))),
                      //   ),
                      //  ),
                      // ksizedbox15,
                      // Container(
                      //   height: 45,
                      //   decoration:
                      //       BoxDecoration(borderRadius: BorderRadius.circular(4)),
                      //   child: TextFormField(
                      //     decoration: InputDecoration(
                      //         contentPadding: EdgeInsets.only(top: 5, left: 10),
                      //         hintText: "+91 98765 43210",
                      //         hintStyle: primaryFonts.copyWith(
                      //             color: AppColors.black.withOpacity(.20),
                      //             fontSize: 13,
                      //             fontWeight: FontWeight.w600),
                      //         labelText: "Contact Number",
                      //         labelStyle: primaryFonts.copyWith(
                      //             color: AppColors.black,
                      //             fontSize: 14,
                      //             fontWeight: FontWeight.w600),
                      //         border: InputBorder.none,
                      //         enabledBorder: OutlineInputBorder(
                      //             borderRadius: BorderRadius.circular(4),
                      //             borderSide:
                      //                 BorderSide(width: 1, color: AppColors.black)),
                      //         focusedBorder: OutlineInputBorder(
                      //             borderRadius: BorderRadius.circular(4),
                      //             borderSide:
                      //                 BorderSide(width: 1, color: AppColors.black))),
                      //   ),
                      // ),
                      // ksizedbox15,
                      Container(
                        height: 45,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4)),
                        child: TextFormField(
                          readOnly: true,
                          //keyboardType: TextInputType.number,
                          controller: job_cardContoller,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(top: 5, left: 10),
                              hintText: controller.getinstallerdetailsData!
                                  .receeVerifications.first.signageType,
                              hintStyle: primaryFonts.copyWith(
                                  color: AppColors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                              //labelText: "JOB CARD",
                              labelStyle: primaryFonts.copyWith(
                                  color: AppColors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                              border: InputBorder.none,
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4),
                                  borderSide: BorderSide(
                                      width: 1, color: AppColors.black)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4),
                                  borderSide: BorderSide(
                                      width: 1, color: AppColors.black))),
                        ),
                      ),
                      ksizedbox15,
                      Container(
                        height: 45,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4)),
                        child: TextFormField(
                          readOnly: true,
                          //keyboardType: TextInputType.number,
                          controller: job_cardContoller,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(top: 5, left: 10),
                              hintText: controller.getinstallerdetailsData!
                                  .receeVerifications.first.signageDetails,
                              hintStyle: primaryFonts.copyWith(
                                  color: AppColors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                              //labelText: "JOB CARD",
                              labelStyle: primaryFonts.copyWith(
                                  color: AppColors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                              border: InputBorder.none,
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4),
                                  borderSide: BorderSide(
                                      width: 1, color: AppColors.black)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4),
                                  borderSide: BorderSide(
                                      width: 1, color: AppColors.black))),
                        ),
                      ),
                      ksizedbox15,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(right: 8),
                              height: 45.h,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4)),
                              child: TextFormField(
                                readOnly: true,
                                //keyboardType: TextInputType.number,
                                controller: job_cardContoller,
                                decoration: InputDecoration(
                                    contentPadding:
                                        EdgeInsets.only(top: 5, left: 10),
                                    hintText: controller
                                        .getinstallerdetailsData!
                                        .receeVerifications
                                        .first
                                        .withColumn,
                                    hintStyle: primaryFonts.copyWith(
                                        color: AppColors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600),
                                    //labelText: "JOB CARD",
                                    labelStyle: primaryFonts.copyWith(
                                        color: AppColors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600),
                                    border: InputBorder.none,
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(4),
                                        borderSide: BorderSide(
                                            width: 1, color: AppColors.black)),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(4),
                                        borderSide: BorderSide(
                                            width: 1, color: AppColors.black))),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height: 45.h,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4)),
                              child: TextFormField(
                                readOnly: true,
                                //keyboardType: TextInputType.number,
                                controller: job_cardContoller,
                                decoration: InputDecoration(
                                    contentPadding:
                                        EdgeInsets.only(top: 5, left: 10),
                                    hintText: controller
                                        .getinstallerdetailsData!
                                        .receeVerifications
                                        .first
                                        .heightColumn,
                                    hintStyle: primaryFonts.copyWith(
                                        color: AppColors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600),
                                    //labelText: "JOB CARD",
                                    labelStyle: primaryFonts.copyWith(
                                        color: AppColors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600),
                                    border: InputBorder.none,
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(4),
                                        borderSide: BorderSide(
                                            width: 1, color: AppColors.black)),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(4),
                                        borderSide: BorderSide(
                                            width: 1, color: AppColors.black))),
                              ),
                            ),
                          ),
                        ],
                      ),
                      ksizedbox10,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(right: 8),
                              height: 45.h,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4)),
                              child: TextFormField(
                                readOnly: true,
                                //keyboardType: TextInputType.number,
                                controller: job_cardContoller,
                                decoration: InputDecoration(
                                    contentPadding:
                                        EdgeInsets.only(top: 5, left: 10),
                                    hintText: controller
                                        .getinstallerdetailsData!
                                        .receeVerifications
                                        .first
                                        .dimension,
                                    hintStyle: primaryFonts.copyWith(
                                        color: AppColors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600),
                                    //labelText: "JOB CARD",
                                    labelStyle: primaryFonts.copyWith(
                                        color: AppColors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600),
                                    border: InputBorder.none,
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(4),
                                        borderSide: BorderSide(
                                            width: 1, color: AppColors.black)),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(4),
                                        borderSide: BorderSide(
                                            width: 1, color: AppColors.black))),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height: 45.h,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4)),
                              child: TextFormField(
                                readOnly: true,
                                //keyboardType: TextInputType.number,
                                controller: job_cardContoller,
                                decoration: InputDecoration(
                                    contentPadding:
                                        EdgeInsets.only(top: 5, left: 10),
                                    hintText: controller
                                        .getinstallerdetailsData!
                                        .receeVerifications
                                        .first
                                        .squareFit,
                                    hintStyle: primaryFonts.copyWith(
                                        color: AppColors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600),
                                    //labelText: "JOB CARD",
                                    labelStyle: primaryFonts.copyWith(
                                        color: AppColors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600),
                                    border: InputBorder.none,
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(4),
                                        borderSide: BorderSide(
                                            width: 1, color: AppColors.black)),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(4),
                                        borderSide: BorderSide(
                                            width: 1, color: AppColors.black))),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "Before Image",
                        style: primaryFonts.copyWith(
                            color: AppColors.red,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                      ksizedbox10,

                      Container(
                        height: 200,
                        child: ListView.builder(
                            itemCount: widget.beforeImages.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index2) {
                              return Card(
                                child: Container(
                                  width: 200,
                                  child: Image.network(
                                      widget.beforeImages[index2]),
                                ),
                              );
                            }),
                      ),

                      // Container(
                      //   height: 200,
                      //   decoration: BoxDecoration(
                      //       borderRadius: BorderRadius.circular(16),
                      //       image: DecorationImage(
                      //           image: NetworkImage(
                      //             widget.beforeImages,
                      //           ),
                      //           fit: BoxFit.cover)),
                      // ),
                      ksizedbox20,
                      Text(
                        "Capture After Image",
                        style: primaryFonts.copyWith(
                            color: AppColors.red,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                      ksizedbox15,
   controller.getinstallerdetailsData?.installerStatus == "1"
                          ?  Container(
                        height: 200,
                        child: controller.getinstallerdetailsData?.receeVerifications.last.afterImages == null ? Container(): ListView.builder(
                            itemCount: controller.getinstallerdetailsData?.receeVerifications.last.afterImages.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index2) {
                              return Card(
                                child: Container(
                                  width: 200,
                                  child: Image.network(
                                    controller.getinstallerdetailsData?.receeVerifications.last.afterImages[index2]),
                                ),
                              );
                            }),
                      ):
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                              onTap: () async {
                                controller.CameraImage(
                                    imageSource: ImageSource.camera);
                                controller.update();
                              },
                              child:
                                  // Obx(
                                  //   () => controller.pickedcamerapath == ""
                                  //       ?
                                  Container(
                                height: 115.h,
                                decoration: BoxDecoration(
                                    color: AppColors.lightGrey.withOpacity(.20),
                                    borderRadius: BorderRadius.circular(6)),
                                child: Image.asset(
                                  "assets/images/camera.png",
                                  height: 165,
                                  width: 185,
                                ),
                              )
                              // : Container(width: 200,
                              //     height: 115.h,
                              //     decoration: BoxDecoration(
                              //         image: DecorationImage(
                              //             image: FileImage(File(
                              //           controller.pickedcamerapath!,
                              //         ))),
                              //         border: Border.all(
                              //             width: 1,
                              //             color: AppColors.lightGrey),
                              //         color: AppColors.lightGrey
                              //             .withOpacity(.20),
                              //         borderRadius:
                              //             BorderRadius.circular(6)),

                              //   ),
                              //       ),
                              ),
                          GestureDetector(
                              onTap: () async {
                                controller.pickImage(
                                    imageSource: ImageSource.gallery);

                                controller.update();
                              },
                              child:
                                  //  Obx(
                                  //   () => controller.pickedImagePath == ""
                                  //       ?
                                  Container(
                                height: 120.h,
                                decoration: BoxDecoration(
                                    color: AppColors.lightGrey.withOpacity(.20),
                                    borderRadius: BorderRadius.circular(6)),
                                child: Image.asset(
                                  "assets/images/gallery.png",
                                  height: 165,
                                  width: 185,
                                ),
                              )
                              // : Container(
                              //     height: 120.h,
                              //     decoration: BoxDecoration(
                              //         image: DecorationImage(
                              //             image: FileImage(File(
                              //           controller.pickedImagePath!,
                              //         ))),
                              //         color: AppColors.lightGrey
                              //             .withOpacity(.20),
                              //         borderRadius:
                              //             BorderRadius.circular(6)),
                              //     child: Image.asset(
                              //       "assets/images/gallery.png",
                              //       height: 165,
                              //       width: 185,
                              //     ),
                              //   ),
                              //     ),
                              )
                        ],
                      ),
                      ksizedbox30,

                  if(controller.pickedImagePathList!.isNotEmpty)    Container(
                        height: 100,
                        child: ListView.builder(
                          itemCount: controller.pickedImagePathList!.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Card(
                              child: Stack(
                                children: [
                                  Container(
                                    width: 100,
                                    height: 100,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Image.file(
                                            File(controller
                                                .pickedImagePathList[index]),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                    top: 0,
                                    right: 0,
                                    child: CircleAvatar(
                                      child: IconButton(
                                        icon: Icon(
                                          Icons.delete,
                                          color: AppColors.red,
                                        ),
                                        onPressed: () {
                                          // Add your delete logic here
                                          // For example, you can remove the image path from the list
                                          setState(() {
                                            controller.pickedImagePathList
                                                .removeAt(index);
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      ksizedbox15,
                      controller.getinstallerdetailsData?.installerStatus == "1"
                          ? Container(
                              alignment: Alignment.center,
                              height: 45,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: AppColors.green,
                                  borderRadius: BorderRadius.circular(8)),
                              child: Text(
                                "Completed",
                                style: primaryFonts.copyWith(
                                    color: AppColors.white,
                                    fontSize: 23,
                                    fontWeight: FontWeight.w600),
                              ),
                            )
                          : InkWell(
                              onTap: () {
                                if (controller.pickedImagePathList != null &&
                                    controller
                                        .pickedImagePathList!.isNotEmpty) {
                                  controller.verifyInstall(
                                    job_card: controller
                                        .getinstallerdetailsData!.jobcard,
                                    //  media1: controller.pickedcamerapath!,
                                    media: controller.pickedImagePathList!,
                                  );
                                  controller.pickedImagePath != '';
                                } else {
                                  AppConstant.showSnackbar(
                                    headText: "Upload Failed",
                                    content: "Please pick at least one image.",
                                    position: SnackPosition.BOTTOM,
                                  );
                                }
                              },
                              child: Obx(
                                () => Container(
                                  alignment: Alignment.center,
                                  height: 40.h,
                                  decoration: BoxDecoration(
                                      color: AppColors.green,
                                      borderRadius: BorderRadius.circular(8)),
                                  child: controller.isLoadingverification.isTrue
                                      ? Center(
                                          child: CircularProgressIndicator(
                                            color: AppColors.white,
                                          ),
                                        )
                                      : Text(
                                          "Submit",
                                          style: primaryFonts.copyWith(
                                              color: AppColors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600),
                                        ),
                                ),
                              ),
                            ),
                      ksizedbox20,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.to(BottomNaviBar(index: 2));
                            },
                            child: Text(
                              "Cancel",
                              style: primaryFonts.copyWith(
                                  color: AppColors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ],
                      ),
                      ksizedbox10,
                    ],
                  );
          }),
        ),
      ),
    );
  }
}
