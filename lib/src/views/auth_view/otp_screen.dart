import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:multisign_app/src/const/app_fonts.dart';
import 'package:multisign_app/src/const/custom_button.dart';
import 'package:multisign_app/src/views/auth_view/create_new_password.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('VERIFICATION'),centerTitle: true,),
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        
          ksizedbox10,
          Image.asset('assets/images/ud_4x 1.png'),
            Text(
            'Enter Verification Code',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),ksizedbox20,
          OTPField(),
          ksizedbox10,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'If you didn’t receive a code, ',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
              ),
              Text('Resend',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Colors.red))
            ],
          ),ksizedbox40,
       Padding(
         padding: const EdgeInsets.all(8.0),
         child: CustomElevatedButton(
                height: 45,
                width: 1,
                onPressed: () {
                  Get.to(NewPassword());
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
              ),
       ),  ],
      ),
    );
  }
}

class OTPField extends StatefulWidget {
  @override
  _OTPFieldState createState() => _OTPFieldState();
}

class _OTPFieldState extends State<OTPField> {
  late List<FocusNode> _focusNodes;
  late List<TextEditingController> _controllers;

  @override
  void initState() {
    super.initState();

    _focusNodes = List.generate(4, (index) => FocusNode());
    _controllers = List.generate(4, (index) => TextEditingController());
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }

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
        4,
        (index) => Container(
          width: 50.0,
          height: 50.0,
          margin: EdgeInsets.symmetric(horizontal: 8.0),
          child: TextField(
            controller: _controllers[index],
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
                if (index < 3) {
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
