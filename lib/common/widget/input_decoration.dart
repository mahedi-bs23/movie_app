import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

InputDecoration buildInputDecoration(String hintText){
  return InputDecoration(

    filled: true,
    fillColor: Colors.white24,



    hintText: hintText,
    hintStyle: TextStyle(
      color: Colors.white60,
    ),

    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10).r,
        borderSide: BorderSide(
          width: 1.r,
          color: Colors.white60,
        )
    ),

    /*enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10).r,
        borderSide: BorderSide(
          width: 1.r,
          color: Colors.white60,
        )
    ),*/

    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10).r,
        borderSide: BorderSide(
          width: 1.r,
          color: Colors.white60,
        )
    ),



  );
}