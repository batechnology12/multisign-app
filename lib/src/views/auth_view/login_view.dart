import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:multisign_app/src/const/app_colors.dart';
import 'package:multisign_app/src/const/app_fonts.dart';
import 'package:multisign_app/src/const/bottom_navi_bar.dart';
import 'package:multisign_app/src/const/custom_button.dart';
import 'package:multisign_app/src/controllers/auth_controller.dart';
import 'package:multisign_app/src/controllers/home_controller.dart';
import 'package:multisign_app/src/views/auth_view/forgot_password.dart';
import 'package:multisign_app/src/views/auth_view/splash_loading.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final controller = Get.find<AuthController>();
  final _formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'LOGIN PAGE',
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              'assets/images/ud_4x 1.png',
              height: 200.h,
            ),
            Text(
              'Enter your Login Details',
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
            ),
            ksizedbox30,
            Text(
              'Please SighIn to continue and email id ',
              style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w400),
            ),
            Text(
              '& password enter logIn',
              style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w400),
            ),
            ksizedbox30,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: emailController,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontSize: 15.sp,
                            color: Colors.black,
                          ),
                      autofocus: false,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
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
                          right: 10,
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
                        hintStyle:
                            Theme.of(context).textTheme.titleLarge!.copyWith(
                                  fontSize: 14.sp,
                                  color: Colors.grey[600],
                                ),
                        hintText: "example@mail.com",
                        fillColor: Colors.white,
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Email can't be empty";
                        } else if (!RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value)) {
                          return "Enter correct email";
                        }
                        return null;
                      },
                    ),
                    ksizedbox20,
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
                          hintStyle: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(
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
                    ksizedbox20w,
                  ],
                ),
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
                        fontWeight: FontWeight.w500,
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
              child: Obx(() => controller.isLoading.isTrue
                  ? CustomElevatedButton(
                      height: 40.h,
                      width: 1.w,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          controller.loginUser(
                              username: emailController.text,
                              password: passwordController.text);
                        }
                      },
                      color: AppColors.green,
                      textColor: Colors.white,
                      child: Center(
                          child: CircularProgressIndicator(
                        color: AppColors.white,
                      )),
                    )
                  : CustomElevatedButton(
                      height: 40.h,
                      width: 1.w,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          controller.loginUser(
                              username: emailController.text,
                              password: passwordController.text);
                        }
                      },
                      color: AppColors.green,
                      textColor: Colors.white,
                      child: customtext(
                        text: 'SIGH IN',
                      ),
                    )),
            ),
          ],
        ),
      ),
    );
  }
}

class customtext extends StatelessWidget {
  const customtext({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: smalbalckfont.copyWith(
          fontSize: 17.sp, color: Colors.white, fontWeight: FontWeight.w600),
    );
  }
}
