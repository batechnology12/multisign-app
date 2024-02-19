import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:lottie/lottie.dart';
import 'package:multisign_app/src/const/app_fonts.dart';
import 'package:multisign_app/src/const/bottom_navi_bar.dart';
import 'package:multisign_app/src/views/auth_view/onbording.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    toHomePage();
  }

  toHomePage() async {
    await Future.delayed(
      const Duration(seconds: 2),
    );

    Get.offAll(
      () => BottomNaviBar(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset('assets/images/Animation - 1708174596429.json',
                height: 100, width: 100
                // width: 200,
                // height: 200,
                // fit: BoxFit.fill,
                ),
            ksizedbox10,
            Text(
              'Loading...',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
            ),
          ],
        ),
      ),
    ),
      // Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       Stack(
      //         children: [
      //           Image.asset("assets/images/circle.png"),
      //           Positioned(
      //               top: 37,
      //               left: 30,
      //               child: Image.asset("assets/images/loading.png"))
      //         ],
      //       ),
      //       ksizedbox20,
      //       Text("Loading......")
      //     ],
      //   ),
      // ),
    );
  }
}
