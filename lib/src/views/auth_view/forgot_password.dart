import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:multisign_app/src/const/app_colors.dart';
import 'package:multisign_app/src/const/app_constant.dart';
import 'package:multisign_app/src/const/app_fonts.dart';
import 'package:multisign_app/src/const/custom_button.dart';
import 'package:multisign_app/src/controllers/auth_controller.dart';
import 'package:multisign_app/src/views/auth_view/login_view.dart';
import 'package:multisign_app/src/views/auth_view/otp_screen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final controller=Get.find<AuthController>();
  final _formKey = GlobalKey<FormState>();
  var emailController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('FORGOT PASSWORD'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Form(key:_formKey ,
            child: Column(
             // mainAxisAlignment: MainAxisAlignment.center,
              children: [ksizedbox20,
                Image.asset('assets/images/4673526.jpg'),
                ksizedbox20,
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
           //     ksizedbox10,
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(onTap: (){Get.to(LoginScreen());},
                        child: Text(
                          'Back to sign in',
                          style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                ),ksizedbox40,ksizedbox40,ksizedbox40,ksizedbox40,
               CustomElevatedButton(
                  height: 45.h,
                  width: 1.w,
                  onPressed: () {
                     AppConstant.showLoader(context: context);
                   controller.forgotUser(username: emailController.text, );
                  },
                  child: customtext(text: 'SEND',),
                  color: AppColors.green,
                  textColor: Colors.white,
                ),],
            ),
          ),
        ),
      ),
    );
  }
}
