import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:multisign_app/src/const/app_colors.dart';
import 'package:multisign_app/src/views/auth_view/onbording.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
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
      () => Onbording(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.pink,
      child: Image.asset('assets/images/Multisign Logo Final 1.png'),
    );
  }
}
