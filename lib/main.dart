import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:multisign_app/firebase_options.dart';
import 'package:multisign_app/src/controllers/auth_controller.dart';
import 'package:multisign_app/src/controllers/home_controller.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:multisign_app/src/controllers/profile_controller.dart';
import 'package:multisign_app/src/fire_base_pushnotification.dart';
import 'package:multisign_app/src/views/splash_view/splash_view.dart';


Future _firebaseBagroundMessage(RemoteMessage message) async {
  if (message.notification != null) {
    print('Some Notification Recived');
  }
}

void main() async {
  Get.put(HomeController());
  Get.put(AuthController());
  Get.put(AuthController());
  Get.put(ProfileController());
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  PushNotifications.int();
  FirebaseMessaging.onBackgroundMessage(_firebaseBagroundMessage);
  
  runApp(
     MyApp(),
    
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
