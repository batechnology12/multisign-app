import 'package:flutter/material.dart';
import 'package:multisign_app/src/const/app_fonts.dart';

class CustomElevatedButton extends StatelessWidget {
  final double? width;
  final double height;
  final VoidCallback onPressed;

  String text;
  Color color;
  Color textColor;

  CustomElevatedButton({
    Key? key,
    required this.text,
    required this.color,
    required this.textColor,
    required this.onPressed,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        alignment: Alignment.center,
        height: 55,
        width: double.infinity,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(
            10,
          ),
          border: Border.all(
            width: 1.5,
            color: Colors.green,
          ),
        ),
        child: Text(
          text,
          style: smalbalckfont.copyWith(
            color: textColor,
            fontSize: 17,
          ),
        ),
      ),
    );
  }
}
