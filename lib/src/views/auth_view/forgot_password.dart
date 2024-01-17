import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:multisign_app/src/const/app_fonts.dart';
import 'package:multisign_app/src/const/custom_button.dart';
import 'package:multisign_app/src/views/auth_view/login_view.dart';
import 'package:multisign_app/src/views/auth_view/otp_screen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('FORGOT PASSWORD'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
         // mainAxisAlignment: MainAxisAlignment.center,
          children: [ksizedbox20,
            Image.asset('assets/images/ud_4x 1.png'),
            ksizedbox20,
            TextField(
              readOnly: true,
              //  controller: nameController,
              autofocus: true,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(19),
                  borderSide: BorderSide(
                      color: Colors.black, width: 2.0), // Border when focused
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                      color: Colors.black,
                      width: 2.0), // Border when not focused
                ),

                hintStyle:
                    TextStyle(fontWeight: FontWeight.w300, color: Colors.grey),
                labelText: 'Enter Email Address', // Changed label text
                labelStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600),
                // Text style for the label
              ),
            ),
            ksizedbox10,
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(onTap: (){Get.to(LoginScreen());},
                    child: Text(
                      'Back to sign in',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ),ksizedbox40,ksizedbox40,ksizedbox40,ksizedbox40,
           CustomElevatedButton(
              height: 45,
              width: 1,
              onPressed: () {
                Get.to(OtpScreen());
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
              text: 'Send',
              color: Colors.green,
              textColor: Colors.white,
            ),],
        ),
      ),
    );
  }
}
