import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:multisign_app/src/const/app_colors.dart';
import 'package:multisign_app/src/const/app_constant.dart';
import 'package:multisign_app/src/const/app_fonts.dart';
import 'package:multisign_app/src/const/custom_button.dart';
import 'package:multisign_app/src/controllers/auth_controller.dart';
import 'package:multisign_app/src/views/auth_view/create_new_password.dart';
import 'package:multisign_app/src/views/auth_view/login_view.dart';

class OtpScreen extends StatefulWidget {
//  final String otp;
  final String username;
  const OtpScreen({super.key,  required this.username});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String otpString = "";
  TextEditingController otpController = TextEditingController();
  final controller = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('VERIFICATION'),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ksizedbox10,
          Image.asset('assets/images/6333057.jpg'),
          Text(
            'Enter Verification Code',
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500),
          ),
          ksizedbox20,
          OtpTextField(
            numberOfFields: 4,
            borderColor: Color(0xFF512DA8),
            //set to true to show as box or false to show as dash
            showFieldAsBox: true,
            //runs when a code is typed in
            onCodeChanged: (String code) {
              //handle validation or checks here
            },
            //runs when every textfield is filled
            onSubmit: (String verificationCode) {
              setState(() {
                otpString = verificationCode;
              });

              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text("Verification Code"),
                      content: Text('Code entered is $verificationCode'),
                    );
                  });
            }, // end onSubmit
          ),
          ksizedbox10,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'If you didn’t receive a code, ',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16.sp),
              ),
              Text('Resend',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp,
                      color: Colors.red))
            ],
          ),
          ksizedbox40,
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomElevatedButton(
              height: 45.h,
              width: 1.w,
              onPressed: () {
                AppConstant.showLoader(context: context);
                controller.verifyotp(username: widget.username, otp: otpString);
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
              color: AppColors.green,
              textColor: Colors.white,
              child: customtext(text: 'Sent'),
            ),
          ),
        ],
      ),
    );
  }
}

class OTPField extends StatefulWidget {
  final int digitCount;
  final TextEditingController controller;

  OTPField({
    required this.digitCount,
    required this.controller,
  });

  @override
  _OTPFieldState createState() => _OTPFieldState();
}

class _OTPFieldState extends State<OTPField> {
  late List<FocusNode> _focusNodes;

  @override
  void initState() {
    super.initState();

    _focusNodes = List.generate(widget.digitCount, (index) => FocusNode());
  }

  @override
  void dispose() {
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        widget.digitCount,
        (index) => Container(
          width: 50.0,
          height: 50.0,
          margin: EdgeInsets.symmetric(horizontal: 8.0),
          child: TextField(
            controller: widget.controller,
            focusNode: _focusNodes[index],
            maxLength: 1,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(12.0),
              counterText: '',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
            onChanged: (value) {
              if (value.isNotEmpty) {
                if (index < widget.digitCount - 1) {
                  FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
                } else {
                  // Handle the last digit entered
                }
              }
            },
          ),
        ),
      ),
    );
  }
}
