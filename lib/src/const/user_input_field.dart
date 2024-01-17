
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class UserInputField extends StatelessWidget {
  const UserInputField({
    super.key,
    required this.controller,
    required this.hintText,
    this.validator,
    this.maxLength,
    this.isNameField = false,
  });
  final TextEditingController controller;
  final String hintText;
  final String? Function(String?)? validator;
  final int? maxLength;
  final bool? isNameField;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      autofocus: false,
      style: Theme.of(context).textTheme.titleLarge!.copyWith(
            fontSize: 15.sp,
            color: Colors.black,
          ),
      textCapitalization: isNameField == true
          ? TextCapitalization.words
          : TextCapitalization.none,
      keyboardType: TextInputType.emailAddress,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      inputFormatters: [
        LengthLimitingTextInputFormatter(
          maxLength,
          maxLengthEnforcement: MaxLengthEnforcement.enforced,
        ),
      ],
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: const BorderSide(
         //   width: 1,
            color: Colors.black,
            style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.circular(
            60,
          ),
        ),
        contentPadding: EdgeInsets.only(
          left: 20,
          right: 10,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
         //   width: 1,
            color: Colors.black,
           // style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.circular(
            60.r,
          ),
        ),
        filled: true,
        hintText: hintText,
        hintStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
              fontSize: 15.sp,
              color: Colors.grey[600],
              fontWeight: FontWeight.w100,
            ),
        fillColor: Colors.white,
      ),
      validator: validator,
    );
  }
}
