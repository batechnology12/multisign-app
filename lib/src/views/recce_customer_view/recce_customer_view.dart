import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multisign_app/src/const/app_colors.dart';
import 'package:multisign_app/src/const/app_fonts.dart';
import 'package:multisign_app/src/views/recce_customer_view/recce_store_name.dart';

class RecceCustomer extends StatefulWidget {
  const RecceCustomer({super.key});

  @override
  State<RecceCustomer> createState() => _RecceCustomerState();
}

class _RecceCustomerState extends State<RecceCustomer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Icon(
            Icons.arrow_back,
          ),
          centerTitle: true,
          title: Text("Recce Customer",
              style: primaryFonts.copyWith(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: AppColors.black)),
          actions: [
            GestureDetector(
              onTap: () {
                popUp();
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 15),
                child: Image.asset(
                  "assets/icons/filter.png",
                ),
              ),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
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
                      hintText: "Search",
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
              ksizedbox20,
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: 7,
                  itemBuilder: ((context, index) {
                    return Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 10),
                          height: 80,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: AppColors.darkGrey.withOpacity(.05)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: 65,
                                    width: 65,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: AppColors.blue,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Text(
                                      "PN",
                                      style: primaryFonts.copyWith(
                                          fontSize: 26,
                                          fontWeight: FontWeight.w700,
                                          color: AppColors.white),
                                    ),
                                  ),
                                  ksizedbox10w,
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Project Name $index",
                                          style: primaryFonts.copyWith(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600,
                                              color: AppColors.black)),
                                      Text("Dealer name $index, chennai",
                                          style: primaryFonts.copyWith(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              color: AppColors.black
                                                  .withOpacity(.70))),
                                      Text('Job Id:AKASH12345',
                                          style: primaryFonts.copyWith(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                              color: AppColors.black
                                                  .withOpacity(.50))),
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
                                      GestureDetector(
                                        onTap: () {
                                          Get.to(RecceStoreName());
                                        },
                                        child: Text('Full View',
                                            style: primaryFonts.copyWith(
                                                decoration:
                                                    TextDecoration.underline,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w600,
                                                color: AppColors.green)),
                                      ),
                                      Text('08-12-2023',
                                          style: primaryFonts.copyWith(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w300,
                                              color: AppColors.black)),
                                      Text('Friday',
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
                  }))
            ],
          ),
        )
        );
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
