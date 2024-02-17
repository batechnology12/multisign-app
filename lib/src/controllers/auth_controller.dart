import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:multisign_app/src/api_service/service/authapiservice/forgot_password_api_service.dart';
import 'package:multisign_app/src/api_service/service/authapiservice/login_api_service.dart';
import 'package:multisign_app/src/api_service/service/authapiservice/new_password_api_service.dart';
import 'package:multisign_app/src/api_service/service/authapiservice/verify_otp_api_service.dart';
import 'package:multisign_app/src/const/app_constant.dart';
import 'package:multisign_app/src/model/veify_otp_model.dart';
import 'package:multisign_app/src/views/auth_view/create_new_password.dart';
import 'package:multisign_app/src/views/auth_view/onbording.dart';
import 'package:multisign_app/src/views/auth_view/otp_screen.dart';
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

  LoginServicesApi loginServicesApi = LoginServicesApi();

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
      AppConstant.showSnackbar(
        headText: "Successful",
        content: "Signing in...",
        position: SnackPosition.BOTTOM,
      );
    } else if (response.statusCode == 401) {
      Get.rawSnackbar(
        messageText: Text(
          response.data["message"],
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
      );
    } else {
      Get.rawSnackbar(
        messageText:  Text(
         response.data["message"],
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
      );
    }
  }

  ForgotPasswordServicesApi forgotPasswordServicesApi =
      ForgotPasswordServicesApi();

  forgotUser({
    required String username,
  }) async {
    isLoading(true);
    dio.Response<dynamic> response =
        await forgotPasswordServicesApi.ForgotPasswordApi(
      username: username,
    );
    isLoading(false);
    if (response.statusCode == 200) {
       int otp = response.data["otp"];
      //   final prefs = await SharedPreferences.getInstance();
      //   await prefs.setString("auth_token", response.data["token"]);
      //   // await prefs.setString("user_id", response.data["user"]["id"]);
      //   await prefs.setString("verify", "true");
      Get.to(OtpScreen(username: username));
      //  Get.find<ProfileController>().checkWhetherHeGo();
      AppConstant.showSnackbar(
        headText: "Successful",
        content: "OTP has been sent to the registered Email Id.${otp}}",
        position: SnackPosition.BOTTOM,
      );
    } else if (response.statusCode == 401) {
      Get.rawSnackbar(
        messageText: Text(
        response.data["message"],
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
      );
    } else {
      Get.rawSnackbar(
        messageText: const Text(
          "Invalid OTP ",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
      );
    }
  }

  VerifyOtpServicesApi verifyOtpServicesApi = VerifyOtpServicesApi();
  Data? verifydata;
  verifyotp({required String username, required String otp}) async {
    isLoading(true);
    dio.Response<dynamic> response =
        await verifyOtpServicesApi.verfyotpApi(username: username, otp: otp);
    isLoading(false);
    if (response.statusCode == 200) {
      VerifyOtpModel verifyOtpModel = VerifyOtpModel.fromJson(response.data);
      verifydata = verifyOtpModel.data;
      update();
      Get.to(NewPassword(userid: verifydata!.userId));
      AppConstant.showSnackbar(
        headText: "Otp Verification Successful",
        content: "Verifying...",
        position: SnackPosition.BOTTOM,
      );
    } else if (response.statusCode == 401) {
      Get.rawSnackbar(
        messageText: Text(
         response.data["message"],
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
      );
    } else {
      Get.rawSnackbar(
        messageText: Text(
        response.data["message"],
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
      );
    }
  }






  
  NewPasswordServicesApi newPasswordServicesApi = NewPasswordServicesApi();

  newPassword({required String password, required String conformpassword,required int userid}) async {
    isLoading(true);
    dio.Response<dynamic> response =
        await newPasswordServicesApi.newpasswordApi( password: password, conformpassword: conformpassword, userid: userid);
    isLoading(false);
    if (response.data ['status'] == true) {
    
      Get.to( Onbording(),);
      //  Get.find<ProfileController>().checkWhetherHeGo();
      AppConstant.showSnackbar(
        headText: "Successful",
        content: response.data ['message'] ,
        position: SnackPosition.BOTTOM,
      );
    } else if (response.statusCode == 401) {
      Get.rawSnackbar(
        messageText: Text(
          response.data["message"],
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
      );
    } else {
      Get.rawSnackbar(
        messageText: Text(
          response.data["message"],
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
      );
    }
  }
}
