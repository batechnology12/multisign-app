import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:multisign_app/src/const/app_colors.dart';
import 'package:multisign_app/src/const/app_fonts.dart';
import 'package:multisign_app/src/controllers/home_controller.dart';
import 'package:multisign_app/src/views/installation_customer_view/installation_report_Details.dart';
import 'package:multisign_app/src/views/recce_customer_view/recce_customer_view.dart';
import 'package:multisign_app/src/views/recce_customer_view/recce_report_details.dart';
import 'package:shimmer_pro/shimmer_pro.dart';
import 'package:svg_flutter/svg.dart';

class GetInstallerSubJob extends StatefulWidget {
  final String id;
  final String storename;
 
  GetInstallerSubJob({
    super.key,
    required this .storename,
    required this.id,
  });

  @override
  State<GetInstallerSubJob> createState() => _GetInstallerSubJobState();
}

class _GetInstallerSubJobState extends State<GetInstallerSubJob> {
  @override
  void initState() {
    super.initState();

    setDefau();
  }

  setDefau() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.getinstallersubjobData.clear();
      controller.getinstallersubjob(id: widget.id);
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
 final TextEditingController searchController = TextEditingController();
  final controller = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.grey[100],
      appBar: AppBar(backgroundColor: Colors.grey[100],
        centerTitle: true,
        title: Text( widget.storename,
            style: primaryFonts.copyWith(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: AppColors.black)),
      ),
      body: ListView(
        children: [
          GetBuilder<HomeController>(builder: (_) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                 Container(
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
                      ),
                  ksizedbox30,
                  Row(
                    children: [
                      Text(
                        "INSTALLER SUB JOB",
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
                      : controller.getinstallersubjobData.isEmpty
                          ? Center(
                              child: Image.asset('assets/icons/fi_6598519.png'))
                          : RefreshIndicator(
                              onRefresh: () =>
                                  controller.getinstallersubjob(id: widget.id),
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount:
                                      controller.getinstallersubjobData.length,
                                  itemBuilder: ((context, index) {
                                    return Padding(
                                      padding:
                                          const EdgeInsets.symmetric(vertical: 10),
                                      child: InkWell(
                                                onTap: () {
                                                  Get.to(InstallationReportDetails(
                                                      id: controller
                                                          .getinstallersubjobData[index].id
                                                          .toString()));
                                                },
                                                child: ContainerCustom(
                                                  id: controller
                                                      .getinstallersubjobData[index].id
                                                      .toString(),
                                                  name: controller
                                                      .getinstallersubjobData[index]
                                                      .shopName,
                                                
                                                  jobcard: controller
                                                      .getinstallersubjobData[index].shopcode,
                                                 
                                                  address: controller
                                                      .getinstallersubjobData[index]
                                                      .address,
                                                        city: controller
                                                      .getinstallersubjobData[index].city,
                                                  day:formatDate(DateTime.parse( controller
                                                      .getinstallersubjobData[index]
                                                      .createdAt.toString()), [yyyy,'-',mm,'-',dd])
                                                     ,
                                                  month: '',
                                                  year:''
                                                      ,
                                                      isverified:
                                                      controller
                                                      .getinstallersubjobData[index].installerStatus ,
                                                ),
                                              ),
                                    );
                                  })),
                            ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}
