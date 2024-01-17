import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multisign_app/src/const/app_colors.dart';
import 'package:multisign_app/src/const/app_fonts.dart';
import 'package:multisign_app/src/controllers/home_controller.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  final Multisign multisign = Get.find<Multisign>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Recent Project Details",
            style: primaryFonts.copyWith(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: AppColors.black)),
      ),
      body: ListView.builder(
          shrinkWrap: true,
          itemCount: multisign.projectDetails.length,
          itemBuilder: ((context, index) {
            return Column(
              children: [
                Container(
                  margin:
                      EdgeInsets.only(bottom: 5, left: 15, right: 15, top: 8),
                  height: 80,
                  width: double.infinity,
                  decoration:
                      BoxDecoration(color: AppColors.darkGrey.withOpacity(.05)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              multisign.projectDetails[index].letters
                                  .toString(),
                              style: primaryFonts.copyWith(
                                  fontSize: 26,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.white),
                            ),
                          ),
                          ksizedbox10w,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  multisign.projectDetails[index].name
                                      .toString(),
                                  style: primaryFonts.copyWith(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.black)),
                              Text(
                                  multisign.projectDetails[index].place
                                      .toString(),
                                  style: primaryFonts.copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.black.withOpacity(.70))),
                              Text(
                                  multisign.projectDetails[index].jobId
                                      .toString(),
                                  style: primaryFonts.copyWith(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.black.withOpacity(.50))),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                  multisign.projectDetails[index].date
                                      .toString(),
                                  style: primaryFonts.copyWith(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w300,
                                      color: AppColors.black)),
                              Text(
                                  multisign.projectDetails[index].day
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
    );
  }
}
