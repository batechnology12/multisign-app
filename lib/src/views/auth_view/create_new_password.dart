import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:multisign_app/src/const/app_fonts.dart';
import 'package:multisign_app/src/const/custom_button.dart';
import 'package:multisign_app/src/views/auth_view/splash_loading.dart';

class NewPassword extends StatelessWidget {
  NewPassword({super.key});
  var nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'New Password',
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/ud_4x 1.png'),
            TextField(
              readOnly: true,
              controller: nameController,
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
                labelText: 'Password', // Changed label text
                labelStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
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
                labelText: 'Confirm Password', // Changed label text
                labelStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600),
                // Text style for the label
              ),
            ),
            ksizedbox40,
            ksizedbox40,
            ksizedbox40,
            CustomElevatedButton(
              height: 45,
              width: 1,
              onPressed: () {
                Get.to(LoadingScreen());
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
              text: 'Submit',
              color: Colors.green,
              textColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
