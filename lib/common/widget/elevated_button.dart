import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyElevatedButton extends StatelessWidget {
  final String buttonText;
  final Color backgroundColor;
  final Color buttonTextColor;
  final VoidCallback onPressed;

  MyElevatedButton({
    required this.buttonText,
    required this.backgroundColor,
    required this.buttonTextColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        fixedSize: Size(375.w, 48.h),
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0).r,
        ),
      ),
      child: Text(
        buttonText,
        style: TextStyle(
          color: buttonTextColor,
          fontSize: 16.sp,
          fontWeight: FontWeight.w600
        ),
      ),
    );
  }
}
