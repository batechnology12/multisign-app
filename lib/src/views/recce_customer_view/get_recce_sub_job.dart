import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:multisign_app/src/const/app_colors.dart';
import 'package:multisign_app/src/const/app_fonts.dart';
import 'package:multisign_app/src/controllers/home_controller.dart';
import 'package:multisign_app/src/views/recce_customer_view/recce_report_details.dart';
import 'package:shimmer_pro/shimmer_pro.dart';

class GetReceeSubJob extends StatefulWidget {
  final String id;
  final bool flag;
  const GetReceeSubJob({super.key, required this.id,required this.flag});

  @override
  State<GetReceeSubJob> createState() => _GetReceeSubJobState();
}

class _GetReceeSubJobState extends State<GetReceeSubJob> {
  @override
  void initState() {
    super.initState();

    setDefau();
  }

  setDefau() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.getreceedsubjobData.clear();
      controller.getReceesubjob(id: widget.id);
      _themeMode();
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Recce Store Name",
            style: primaryFonts.copyWith(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: AppColors.black)),
      ),
      body: GetBuilder<HomeController>(builder: (_) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
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
                          borderSide:
                              BorderSide(width: 1, color: AppColors.grey))),
                ),
              ),
              ksizedbox30,
              Row(
                children: [
                  Text(
                    "SUB JOB",
                    style: primaryFonts.copyWith(
                        color: AppColors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              ksizedbox10,
              controller.isLoadingdatails.isTrue
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
                  : controller.getreceedsubjobData.isEmpty
                      ? Center(
                          child: Image.asset('assets/icons/fi_6598519.png'))
                      : RefreshIndicator(
                          onRefresh: () =>
                              controller.getReceesubjob(id: widget.id),
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: controller.getreceedsubjobData.length,
                              itemBuilder: ((context, index) {
                                return Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: InkWell(onTap: () {
                                    // controller.getReceesubjobDetails(id:controller
                                    //                       .getreceedsubjobData[index]
                                    //                       .id
                                    //                       .toString(),);
                                        Get.to(RecceReportDetails(
                                           
                                                      id: controller
                                                          .getreceedsubjobData[index]
                                                          .id
                                                          .toString(),
                                                    ));},
                                    child: Container(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      height: 40,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          color: AppColors.lightGrey
                                              .withOpacity(.30),
                                          borderRadius: BorderRadius.circular(8)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            controller.getreceedsubjobData[index]
                                                .dealerName,
                                            style: primaryFonts.copyWith(
                                                color: AppColors.black,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400),
                                          ),
                                          controller.getreceedsubjobData[index]
                                                      .isReceeVerrified ==
                                                  '1'
                                              ? Icon(
                                                  Icons.done,
                                                  color: Colors.green,
                                                )
                                              : IconButton(
                                                  onPressed: () {
                                                    Get.to(RecceReportDetails(
                                                    
                                                      id: controller
                                                          .getreceedsubjobData[index]
                                                          .id
                                                          .toString(),
                                                    ));
                                                  },
                                                  icon: Icon(Icons.arrow_forward))
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              })),
                        ),
            ],
          ),
        );
      }),
    );
  }
}
