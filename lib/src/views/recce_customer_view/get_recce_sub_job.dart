import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:multisign_app/src/const/app_colors.dart';
import 'package:multisign_app/src/const/app_fonts.dart';
import 'package:multisign_app/src/controllers/home_controller.dart';
import 'package:multisign_app/src/views/recce_customer_view/recce_customer_view.dart';
import 'package:multisign_app/src/views/recce_customer_view/recce_report_details.dart';
import 'package:shimmer_pro/shimmer_pro.dart';
import 'package:svg_flutter/svg.dart';

class GetReceeSubJob extends StatefulWidget {
  final String id;
  final String storename;

  const GetReceeSubJob({super.key, required this.id,required this.storename});

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
  final TextEditingController searchController = TextEditingController();
  final controller = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.storename,
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
                    "Recce SUB JOB",
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
                                return  controller.getreceedsubjobData.isNotEmpty? Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: InkWell(onTap: () {
                                    // controller.getReceesubjobDetails(id:controller
                                    //                       .getreceedsubjobData[index]
                                    //                       .id
                                    //            
                                    //            .toString(),);
                                    print('null id');
                                    print(  controller
                                                          .getreceedsubjobData[index]
                                                          .id);
                                        Get.to(RecceReportDetails(
                                               
                                                      id: controller
                                                          .getreceedsubjobData[index]
                                                          .id
                                                          .toString(),
                                                    ));},
                                    child:  ContainerCustom(
                                              id: controller
                                                  .getreceedsubjobData[index].id
                                                  .toString(),
                                              name: controller
                                                  .getreceedsubjobData[index]
                                                  .shopName.toString(),
                                              city: controller
                                                  .getreceedsubjobData[index].city.toString(),
                                              jobcard: controller
                                                  .getreceedsubjobData[index]
                                                  .shopcode.toString(),
                                              day: formatDate(DateTime.parse(controller
                                                  .getreceedsubjobData[index].createdAt
                                                  .toString(),), [yyyy,'-',mm,'-',dd]),
                                              address:'',
                                              month: '',
                                              year: '',
                                                  isverified:controller
                                                  .getreceedsubjobData[index].isReceeVerrified ,
                                            ),
                                  ),
                                ):Text('');
                              })),
                        ),
            ],
          ),
        );
      }),
    );
  }
}
