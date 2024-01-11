import 'package:flutter/material.dart';
import 'package:multisign_app/src/const/app_colors.dart';
import 'package:multisign_app/src/const/app_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List imageSlider = ["assets/images/printer.png"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
        child: SafeArea(
          child: Column(
            children: [
              Row(
                children: [
                  Image.asset("assets/images/profile.png"),
                  ksizedbox10w,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hello,",
                        style: primaryFonts.copyWith(
                            color: AppColors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        "Prakash Mp",
                        style: primaryFonts.copyWith(
                            color: AppColors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 150,
                  ),
                  Image.asset(
                    "assets/icons/notification.png",
                    height: 22,
                    width: 22,
                  )
                ],
              ),
              // Container(
              //     height: 140,
              //     width: 360,
              //     color: AppColors.green,
              //     child: CarouselSlider(
              //       options: CarouselOptions(
              //         aspectRatio: 2.0,
              //         enlargeCenterPage: true,
              //         scrollDirection: Axis.vertical,
              //         autoPlay: true,
              //       ),
              //       items: imageSlider,
              //     ))
            ],
          ),
        ),
      ),
    );
  }
}
