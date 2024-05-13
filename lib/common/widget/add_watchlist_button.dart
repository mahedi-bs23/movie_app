import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddWatchlistButton extends StatelessWidget {
  final VoidCallback onPressed;

  const AddWatchlistButton({
    super.key,
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
        "Add To Watchlist",
        style: TextStyle(
          fontSize: 8.sp,
          color: Colors.white,
        ),
      ),
    );
  }
}
