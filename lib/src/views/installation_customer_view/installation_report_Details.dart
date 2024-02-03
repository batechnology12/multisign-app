import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:multisign_app/src/const/app_colors.dart';
import 'package:multisign_app/src/const/app_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multisign_app/src/const/bottom_navi_bar.dart';
import 'package:multisign_app/src/controllers/home_controller.dart';

class InstallationReportDetails extends StatefulWidget {
  const InstallationReportDetails({super.key});

  @override
  State<InstallationReportDetails> createState() =>
      _InstallationReportDetailsState();
}

class _InstallationReportDetailsState extends State<InstallationReportDetails> {
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
          child: Column(
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
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(4)),
                child: TextFormField(keyboardType: TextInputType.number,
                  controller: job_cardContoller,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(top: 5, left: 10),
                      hintText: "Redmi Mobile Store Room",
                      hintStyle: primaryFonts.copyWith(
                          color: AppColors.black.withOpacity(.20),
                          fontSize: 13,
                          fontWeight: FontWeight.w600),
                      labelText: "JOB CARD",
                      labelStyle: primaryFonts.copyWith(
                          color: AppColors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                      border: InputBorder.none,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide:
                              BorderSide(width: 1, color: AppColors.black)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide:
                              BorderSide(width: 1, color: AppColors.black))),
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
              // ),
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
              // Container(
              //   height: 45,
              //   decoration:
              //       BoxDecoration(borderRadius: BorderRadius.circular(4)),
              //   child: TextFormField(
              //     decoration: InputDecoration(
              //         contentPadding: EdgeInsets.only(top: 5, left: 10),
              //         hintText: "HFE42USD94645",
              //         hintStyle: primaryFonts.copyWith(
              //             color: AppColors.black.withOpacity(.20),
              //             fontSize: 13,
              //             fontWeight: FontWeight.w600),
              //         labelText: "GST Number",
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
              //         hintText: "HOARDINGS",
              //         hintStyle: primaryFonts.copyWith(
              //             color: AppColors.black.withOpacity(.20),
              //             fontSize: 13,
              //             fontWeight: FontWeight.w600),
              //         labelText: "Signage Type",
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
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Expanded(
              //       child: Container(
              //         margin: EdgeInsets.only(right: 8),
              //         height: 45.h,
              //         decoration:
              //             BoxDecoration(borderRadius: BorderRadius.circular(4)),
              //         child: TextFormField(
              //           decoration: InputDecoration(
              //               contentPadding: EdgeInsets.only(top: 5, left: 10),
              //               labelText: "Width",
              //               labelStyle: primaryFonts.copyWith(
              //                   color: AppColors.black,
              //                   fontSize: 14,
              //                   fontWeight: FontWeight.w600),
              //               border: InputBorder.none,
              //               enabledBorder: OutlineInputBorder(
              //                   borderRadius: BorderRadius.circular(4),
              //                   borderSide: BorderSide(
              //                       width: 1, color: AppColors.black)),
              //               focusedBorder: OutlineInputBorder(
              //                   borderRadius: BorderRadius.circular(4),
              //                   borderSide: BorderSide(
              //                       width: 1, color: AppColors.black))),
              //         ),
              //       ),
              //     ),
              //     Expanded(
              //       child: Container(
              //         height: 45.h,
              //         decoration:
              //             BoxDecoration(borderRadius: BorderRadius.circular(4)),
              //         child: TextFormField(
              //           decoration: InputDecoration(
              //               contentPadding: EdgeInsets.only(top: 5, left: 10),
              //               labelText: "Height",
              //               labelStyle: primaryFonts.copyWith(
              //                   color: AppColors.black,
              //                   fontSize: 14,
              //                   fontWeight: FontWeight.w600),
              //               border: InputBorder.none,
              //               enabledBorder: OutlineInputBorder(
              //                   borderRadius: BorderRadius.circular(4),
              //                   borderSide: BorderSide(
              //                       width: 1, color: AppColors.black)),
              //               focusedBorder: OutlineInputBorder(
              //                   borderRadius: BorderRadius.circular(4),
              //                   borderSide: BorderSide(
              //                       width: 1, color: AppColors.black))),
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
              ksizedbox10,
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Expanded(
              //       child: Container(
              //         margin: EdgeInsets.only(right: 8),
              //         height: 45.h,
              //         decoration:
              //             BoxDecoration(borderRadius: BorderRadius.circular(4)),
              //         child: TextFormField(
              //           decoration: InputDecoration(
              //               contentPadding: EdgeInsets.only(top: 5, left: 10),
              //               labelText: "Dimensions",
              //               labelStyle: primaryFonts.copyWith(
              //                   color: AppColors.black,
              //                   fontSize: 14,
              //                   fontWeight: FontWeight.w600),
              //               border: InputBorder.none,
              //               enabledBorder: OutlineInputBorder(
              //                   borderRadius: BorderRadius.circular(4),
              //                   borderSide: BorderSide(
              //                       width: 1, color: AppColors.black)),
              //               focusedBorder: OutlineInputBorder(
              //                   borderRadius: BorderRadius.circular(4),
              //                   borderSide: BorderSide(
              //                       width: 1, color: AppColors.black))),
              //         ),
              //       ),
              //     ),
              //     Expanded(
              //       child: Container(
              //         height: 45.h,
              //         decoration:
              //             BoxDecoration(borderRadius: BorderRadius.circular(4)),
              //         child: TextFormField(
              //           decoration: InputDecoration(
              //               contentPadding: EdgeInsets.only(top: 5, left: 10),
              //               labelText: "Square Feet",
              //               labelStyle: primaryFonts.copyWith(
              //                   color: AppColors.black,
              //                   fontSize: 14,
              //                   fontWeight: FontWeight.w600),
              //               border: InputBorder.none,
              //               enabledBorder: OutlineInputBorder(
              //                   borderRadius: BorderRadius.circular(4),
              //                   borderSide: BorderSide(
              //                       width: 1, color: AppColors.black)),
              //               focusedBorder: OutlineInputBorder(
              //                   borderRadius: BorderRadius.circular(4),
              //                   borderSide: BorderSide(
              //                       width: 1, color: AppColors.black))),
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
              ksizedbox20,
              Text(
                "Capture Spaces & My Space",
                style: primaryFonts.copyWith(
                    color: AppColors.red,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
              ksizedbox15,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  image == null
                      ? GestureDetector(
                          onTap: () async {
                            var pickedCamera = await imagePicker.pickImage(
                                source: ImageSource.camera);
                            setState(() {
                              image = File(pickedCamera!.path);
                         //     _ImagePath.value = image!.path;
                            });
                          },
                          child: Container(
                            //   margin: EdgeInsets.only(right: 10),
                            height: 115.h,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1, color: AppColors.lightGrey),
                                color: AppColors.lightGrey.withOpacity(.20),
                                borderRadius: BorderRadius.circular(6)),
                            child: Image.asset(
                              "assets/images/camera.png",
                              height: 165,
                              width: 185,
                            ),
                          ),
                        )
                      : GestureDetector(
                          onTap: () async {
                            var pickedCamera = await imagePicker.pickImage(
                                source: ImageSource.camera);
                            setState(() {
                              image = File(pickedCamera!.path);
                           ///   _ImagePath.value = image!.path;
                            });
                          },
                          child: Expanded(
                            child:Container(
                                height: 115.h,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1, color: AppColors.lightGrey),
                                    color: AppColors.lightGrey.withOpacity(.20),
                                    borderRadius: BorderRadius.circular(6)),
                                child: Image.file(
                                  image!,
                                  height: 165,
                                  width: 185,
                                ),
                              ),
                            ),
                          ),
                        
                  photo == null
                      ? GestureDetector(
                          onTap: () async {
                            controller.pickImage(
                                imageSource: ImageSource.gallery);

                            controller.update();
                          },
                          child: Expanded(
                            child: Obx(
                              ()=> Container(
                                height: 120.h,
                                decoration: BoxDecoration(image:  DecorationImage(
                                      image: FileImage(File(
                                    controller.pickedImagePath!,
                                  ))),
                                    color: AppColors.lightGrey.withOpacity(.20),
                                    borderRadius: BorderRadius.circular(6)),
                                child: Image.asset(
                                  "assets/images/gallery.png",
                                  height: 165,
                                  width: 185,
                                ),
                              ),
                            ),
                          ),
                        )
                      : GestureDetector(
                          onTap: () async {
                            controller.pickImage(
                                imageSource: ImageSource.gallery);

                            controller.update();
                          },
                          child: Expanded(
                            child: Container(
                              height: 120.h,
                              decoration: BoxDecoration(
                                  color: AppColors.lightGrey.withOpacity(.20),
                                  borderRadius: BorderRadius.circular(6)),
                              child: Image.file(
                                height: 165,
                                width: 185,
                                photo!,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                ],
              ),
              ksizedbox30,
              InkWell(
                onTap: () {
                  controller.verifyInstall(
                      job_card: job_cardContoller.text,
                      media: controller.pickedImagePath!,
                      media1: _ImagePath.value!);
                },
                child: Obx(
                  () => Container(
                    alignment: Alignment.center,
                    height: 40.h,
                    decoration: BoxDecoration(
                        color: AppColors.green,
                        borderRadius: BorderRadius.circular(8)),
                    child: controller.isLoading.isTrue
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
          ),
        ),
      ),
    );
  }
}
