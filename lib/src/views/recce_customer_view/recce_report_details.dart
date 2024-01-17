import 'package:flutter/material.dart';
import 'package:multisign_app/src/const/app_colors.dart';
import 'package:multisign_app/src/const/app_fonts.dart';

class RecceReportDetails extends StatefulWidget {
  const RecceReportDetails({super.key});

  @override
  State<RecceReportDetails> createState() => _RecceReportDetailsState();
}

class _RecceReportDetailsState extends State<RecceReportDetails> {
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
                child: TextFormField(
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(top: 5, left: 10),
                      hintText: "Redmi Mobile Store Room",
                      hintStyle: primaryFonts.copyWith(
                          color: AppColors.black.withOpacity(.20),
                          fontSize: 13,
                          fontWeight: FontWeight.w600),
                      labelText: "Project Name",
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
              Container(
                height: 45,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(4)),
                child: TextFormField(
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(top: 5, left: 10),
                      hintText: "Chennai",
                      hintStyle: primaryFonts.copyWith(
                          color: AppColors.black.withOpacity(.20),
                          fontSize: 13,
                          fontWeight: FontWeight.w600),
                      labelText: "City",
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
              Container(
                height: 45,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(4)),
                child: TextFormField(
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(top: 5, left: 10),
                      hintText: "Anna Nagar",
                      hintStyle: primaryFonts.copyWith(
                          color: AppColors.black.withOpacity(.20),
                          fontSize: 13,
                          fontWeight: FontWeight.w600),
                      labelText: "Address",
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
              ksizedbox20,
              Text(
                "Signage Details",
                style: primaryFonts.copyWith(
                    color: AppColors.red,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
              ksizedbox20,
              Container(
                height: 45,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(4)),
                child: TextFormField(
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(top: 5, left: 10),
                      hintText: "Praksh MP",
                      hintStyle: primaryFonts.copyWith(
                          color: AppColors.black.withOpacity(.20),
                          fontSize: 13,
                          fontWeight: FontWeight.w600),
                      labelText: "Dealer Name",
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
              Container(
                height: 45,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(4)),
                child: TextFormField(
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(top: 5, left: 10),
                      hintText: "Redmi Shop",
                      hintStyle: primaryFonts.copyWith(
                          color: AppColors.black.withOpacity(.20),
                          fontSize: 13,
                          fontWeight: FontWeight.w600),
                      labelText: "Store Name",
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
              Container(
                height: 45,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(4)),
                child: TextFormField(
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(top: 5, left: 10),
                      hintText: "Redmi Shop",
                      hintStyle: primaryFonts.copyWith(
                          color: AppColors.black.withOpacity(.20),
                          fontSize: 13,
                          fontWeight: FontWeight.w600),
                      labelText: "City",
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
              Container(
                height: 45,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(4)),
                child: TextFormField(
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(top: 5, left: 10),
                      hintText: "Perambur",
                      hintStyle: primaryFonts.copyWith(
                          color: AppColors.black.withOpacity(.20),
                          fontSize: 13,
                          fontWeight: FontWeight.w600),
                      labelText: "Area Name",
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
              Container(
                height: 45,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(4)),
                child: TextFormField(
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(top: 5, left: 10),
                      hintText: "Chennai",
                      hintStyle: primaryFonts.copyWith(
                          color: AppColors.black.withOpacity(.20),
                          fontSize: 13,
                          fontWeight: FontWeight.w600),
                      labelText: "Address",
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
              Container(
                height: 45,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(4)),
                child: TextFormField(
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(top: 5, left: 10),
                      hintText: "+91 98765 43210",
                      hintStyle: primaryFonts.copyWith(
                          color: AppColors.black.withOpacity(.20),
                          fontSize: 13,
                          fontWeight: FontWeight.w600),
                      labelText: "Contact Number",
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
              Container(
                height: 45,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(4)),
                child: TextFormField(
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(top: 5, left: 10),
                      hintText: "HFE42USD94645",
                      hintStyle: primaryFonts.copyWith(
                          color: AppColors.black.withOpacity(.20),
                          fontSize: 13,
                          fontWeight: FontWeight.w600),
                      labelText: "GST Number",
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
              Container(
                height: 45,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(4)),
                child: TextFormField(
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(top: 5, left: 10),
                      hintText: "HOARDINGS",
                      hintStyle: primaryFonts.copyWith(
                          color: AppColors.black.withOpacity(.20),
                          fontSize: 13,
                          fontWeight: FontWeight.w600),
                      labelText: "Signage Type",
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 45,
                    width: 180,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(4)),
                    child: TextFormField(
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(top: 5, left: 10),
                          labelText: "Width",
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
                              borderSide: BorderSide(
                                  width: 1, color: AppColors.black))),
                    ),
                  ),
                  Container(
                    height: 45,
                    width: 180,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(4)),
                    child: TextFormField(
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(top: 5, left: 10),
                          labelText: "Hight",
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
                              borderSide: BorderSide(
                                  width: 1, color: AppColors.black))),
                    ),
                  ),
                ],
              ),
              ksizedbox15,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 45,
                    width: 180,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(4)),
                    child: TextFormField(
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(top: 5, left: 10),
                          labelText: "Dimensions",
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
                              borderSide: BorderSide(
                                  width: 1, color: AppColors.black))),
                    ),
                  ),
                  Container(
                    height: 45,
                    width: 180,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(4)),
                    child: TextFormField(
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(top: 5, left: 10),
                          labelText: "Square Feet",
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
                              borderSide: BorderSide(
                                  width: 1, color: AppColors.black))),
                    ),
                  ),
                ],
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
