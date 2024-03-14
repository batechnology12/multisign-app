import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:multisign_app/src/controllers/auth_controller.dart';
import 'package:multisign_app/src/controllers/home_controller.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:multisign_app/src/controllers/profile_controller.dart';
import 'package:multisign_app/src/views/splash_view/splash_view.dart';
import 'package:device_preview/device_preview.dart';

void main() {
  Get.put(HomeController());
  Get.put(AuthController());
  Get.put(AuthController());
  Get.put(ProfileController());
  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) => MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(
        360,
        690,
      ),
      child: GetMaterialApp(
        
        debugShowCheckedModeBanner: false,
        title: 'Multi Signs',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
          useMaterial3: true,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
