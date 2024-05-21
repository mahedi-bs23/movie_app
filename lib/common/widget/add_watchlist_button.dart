import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddWatchlistButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;

  const AddWatchlistButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,

      style: ElevatedButton.styleFrom(

        padding: EdgeInsets.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        //fixedSize: Size(80.w, 20.h),
        backgroundColor: Colors.indigoAccent.shade400,

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0).r,
        ),
      ),
      child: Text(
        buttonText,
        style: TextStyle(
          fontSize: 8.sp,
          color: Colors.white,
        ),
      ),
    );
  }
}
