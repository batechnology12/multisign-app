import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
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
    return Scaffold(backgroundColor: Colors.white,body: Center(child: Text('Loading...')),);
  }
}