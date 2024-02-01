import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:multisign_app/src/api_service/service/authapiservice/login_api_service.dart';
import 'package:multisign_app/src/const/app_constant.dart';
import 'package:multisign_app/src/views/auth_view/splash_loading.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  List letters = ["AK", "WA", "JR", "JR"];
  List name = ["Aash Kumar", "Wasim Anas", "Jaga Raj", "Jaga Raj"];
  List place = ["Business Board, chennai"];
  List jobId = ['job Id: AKASH12345'];
  



  final _isHidden = true.obs;

  bool get isHidden => _isHidden.value;

  void togglePasswordView() {
    _isHidden.value = !_isHidden.value;
  }





 RxBool isLoading = false.obs;

LoginServicesApi loginServicesApi=LoginServicesApi();

    loginUser({required String username, required String password}) async {
    isLoading(true);
    dio.Response<dynamic> response =
        await loginServicesApi.loginApi(username: username, password: password);
    isLoading(false);
    if (response.statusCode == 200) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString("auth_token", response.data["token"]);
      // await prefs.setString("user_id", response.data["user"]["id"]);
      await prefs.setString("verify", "true");
      Get.to(LoadingScreen());
    //  Get.find<ProfileController>().checkWhetherHeGo();
 AppConstant.    showSnackbar(
              headText: "Successful",
              content: "Signing in...",
              position: SnackPosition.BOTTOM,
            );
    } else if (response.statusCode == 401) {
      Get.rawSnackbar(
        messageText: Text(
          response.data["error"],
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
      );
    } else {
      Get.rawSnackbar(
        messageText: const Text(
          "Invalid User name / Password",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
      );
    }
  }
  // checkWhetherHeGo() async {
  //   dio.Response<dynamic> response = await getProfileApiServices.getProfile();
  //   profileData.clear();
  //   if (response.statusCode == 200) {
  //     ProfileModel profileModel = ProfileModel.fromJson(response.data);
  //     profileData.add(profileModel);
  //     update();
  //     if (profileModel.positions.isEmpty || profileModel.skills.isEmpty || profileModel.user.education == null) {
  //       Get.offAll(() => const SettingProfileMadatoryPage());
  //     } else {
  //       Get.offAll(() => BottomNavigationBarExample());
  //     }
  //   } else if (response.statusCode == 401) {
  //     final prefs = await SharedPreferences.getInstance();
  //     await prefs.setString("auth_token", "null");
  //     Get.to(loginpage());
  //   }
  // }

}
