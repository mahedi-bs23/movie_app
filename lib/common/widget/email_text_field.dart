import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/feature/auth/login/validator/email_validator.dart';

class EmailTexTField extends StatelessWidget {
  final TextEditingController emailTextEditingController;
  final String? errorText;
  final String? hintText;

  const EmailTexTField({
    super.key,
    required this.emailTextEditingController,
    required this.hintText,
    required this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: emailTextEditingController,
      style: TextStyle(color: Colors.white54),
      cursorColor: Colors.white,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white24,
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.white60,
        ),
        errorText: errorText,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius
              .circular(10)
              .r,
          borderSide: BorderSide(
            width: 1.r,
            color: Colors.white60,
          ),
        ),

        /*enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10).r,
        borderSide: BorderSide(
          width: 1.r,
          color: Colors.white60,
        ),
      ),*/

        border: OutlineInputBorder(
          borderRadius: BorderRadius
              .circular(10)
              .r,
          borderSide: BorderSide(
            width: 1.r,
            color: Colors.white60,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
              width: 1,
              color: EmailValidator.errorMsg.isEmpty
                  ? Colors.white60
                  : EmailValidator.errorMsg == "Invalid Email"
                  ? Colors.red
                  : Colors.white60, // Customize error border color here
          ),
        ),
      ),
    );
  }
}
