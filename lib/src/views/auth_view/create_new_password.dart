import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:multisign_app/src/const/app_colors.dart';
import 'package:multisign_app/src/const/app_constant.dart';
import 'package:multisign_app/src/const/app_fonts.dart';
import 'package:multisign_app/src/const/custom_button.dart';
import 'package:multisign_app/src/controllers/auth_controller.dart';
import 'package:multisign_app/src/views/auth_view/login_view.dart';


class NewPassword extends StatefulWidget {
  final int userid;
  NewPassword({super.key, required this.userid});

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  var conformpasswordController = TextEditingController();
  var passwordController = TextEditingController();
  final controller = Get.find<AuthController>();
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/6321602.jpg'),
              ksizedbox10,
              Obx(
                () => TextFormField(
                  controller: passwordController,
                  obscureText: controller.isHidden,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontSize: 15.sp,
                        color: Colors.black,
                      ),
                  autofocus: false,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    suffixIcon: Padding(
                      padding: EdgeInsets.only(
                        right: 10.w,
                      ),
                      child: IconButton(
                          onPressed: () {
                            controller.togglePasswordView();
                          },
                          icon: controller.isHidden
                              ? Icon(Icons.remove_red_eye)
                              : Image.asset(
                                  'assets/icons/hide_icon_184088.png',
                                  height: 30,
                                )),
                    ),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(
                        width: 1.5,
                        color: Colors.black,
                        style: BorderStyle.solid,
                      ),
                      borderRadius: BorderRadius.circular(
                        60.r,
                      ),
                    ),
                    contentPadding: const EdgeInsets.only(
                      left: 20,
                      right: 25,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        width: 1.2,
                        color: Colors.black,
                        style: BorderStyle.solid,
                      ),
                      borderRadius: BorderRadius.circular(
                        60.r,
                      ),
                    ),
                    filled: true,
                    hintText: "••••••••••",
                    hintStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontSize: 15.sp,
                          color: const Color.fromARGB(255, 104, 104, 104),
                        ),
                    fillColor: Colors.white,
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Password can't be empty";
                    } else if (value.length < 4) {
                      return "Password must be of four characters";
                    }
                    return null;
                  },
                ),
              ),
              ksizedbox20,
              Obx(
                () => TextFormField(
                  controller: conformpasswordController,
                  obscureText: controller.isHidden,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontSize: 15.sp,
                        color: Colors.black,
                      ),
                  autofocus: false,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    suffixIcon: Padding(
                      padding: EdgeInsets.only(
                        right: 10.w,
                      ),
                      child: IconButton(
                          onPressed: () {
                            controller.togglePasswordView();
                          },
                          icon: controller.isHidden
                              ? Icon(Icons.remove_red_eye)
                              : Image.asset(
                                  'assets/icons/hide_icon_184088.png',
                                  height: 30,
                                )),
                    ),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(
                        width: 1.5,
                        color: Colors.black,
                        style: BorderStyle.solid,
                      ),
                      borderRadius: BorderRadius.circular(
                        60.r,
                      ),
                    ),
                    contentPadding: const EdgeInsets.only(
                      left: 20,
                      right: 25,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        width: 1.2,
                        color: Colors.black,
                        style: BorderStyle.solid,
                      ),
                      borderRadius: BorderRadius.circular(
                        60.r,
                      ),
                    ),
                    filled: true,
                    hintText: "••••••••••",
                    hintStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontSize: 15.sp,
                          color: const Color.fromARGB(255, 104, 104, 104),
                        ),
                    fillColor: Colors.white,
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Password can't be empty";
                    } else if (value.length < 4) {
                      return "Password must be of four characters";
                    }
                    return null;
                  },
                ),
              ),
              ksizedbox40,
              ksizedbox40,
              ksizedbox40,
              CustomElevatedButton(
                height: 45.h,
                width: 1.w,
                onPressed: () {
                  AppConstant.showLoader(context: context);
                  controller.newPassword(
                      conformpassword: conformpasswordController.text,
                      password: passwordController.text,
                      userid: widget.userid);
                },
                color: AppColors.green,
                textColor: Colors.white,
                child: customtext(text: 'Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
