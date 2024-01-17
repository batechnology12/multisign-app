import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:multisign_app/src/const/app_fonts.dart';
import 'package:multisign_app/src/const/bottom_navi_bar.dart';
import 'package:multisign_app/src/const/custom_button.dart';
import 'package:multisign_app/src/views/auth_view/forgot_password.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  var nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LOGIN PAGE'),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Image.asset('assets/images/ud_4x 1.png',height: 200.h,),
        
          Text(
            'Enter your Login Details',
            style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w700),
          ),
          ksizedbox30,
          Text(
            'Please sing in to continue and email id ',
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500),
          ),
          Text(
            '& password enter login',
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500),
          ),
          ksizedbox30,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                TextField(
                  readOnly: true,
                  controller: nameController,
                  autofocus: true,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(19.r),
                      borderSide: BorderSide(
                          color: Colors.black,
                          width: 2.0.w), // Border when focused
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                          color: Colors.black,
                          width: 2.0.w), // Border when not focused
                    ),
                    hintStyle: TextStyle(
                        fontWeight: FontWeight.w300, color: Colors.grey),
                    labelText: 'Email ID', // Changed label text
                    labelStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0.sp,
                        fontWeight: FontWeight.w600),
                    // Text style for the label
                  ),
                ),
                ksizedbox20,
                TextField(
                  readOnly: true,
                  controller: nameController,
                  autofocus: true,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(19),
                      borderSide: BorderSide(
                          color: Colors.black,
                          width: 2.0.w), // Border when focused
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                          color: Colors.black,
                          width: 2.0.w), // Border when not focused
                    ),

                    hintStyle: TextStyle(
                        fontWeight: FontWeight.w300, color: Colors.grey),
                    labelText: 'Password', // Changed label text
                    labelStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0.sp,
                        fontWeight: FontWeight.w600),
                    // Text style for the label
                  ),
                ),
                ksizedbox20w,
              ],
            ),
          ),
          ksizedbox10,
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Get.to(ForgotPasswordScreen());
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Forgot Password',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                    ),
                  )
                ],
              ),
            ),
          ),
          ksizedbox40,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: CustomElevatedButton(
              height: 40.h,
              width: 1.w,
              onPressed: () {
                Get.to(BottomNaviBar());
                // ProfileUpdateModel profileUpdateModel =
                // ProfileUpdateModel(
                // email: emailController.text,
                // mobilenumber: mobileController.text,
                // name: nameController.text);
                // profileController.updateprofile(profileUpdateModel: profileUpdateModel);
                // profileController.isEdited(true);
                // profileController.update();
                // Get.back();
              },
              text: 'SIGN IN',
              color: Colors.green,
              textColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
