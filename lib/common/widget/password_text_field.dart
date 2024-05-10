import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/feature/auth/login/login_viewmodel.dart';
import 'package:movie_app/feature/auth/login/validator/password_validator.dart';

class PasswordTexTField extends StatelessWidget {
  final TextEditingController passwordTextEditingController;
  final String? errorText;
  final String? hintText;
  final bool shouldShowPassword;
  final VoidCallback onClickedTogglePassWordButton;

  PasswordTexTField(
      {super.key,
      required this.passwordTextEditingController,
      required this.hintText,
      required this.errorText,
      required this.shouldShowPassword,
      required this.onClickedTogglePassWordButton});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: passwordTextEditingController,
      style: TextStyle(color: Colors.white54),
      cursorColor: Colors.white,
      obscureText: !shouldShowPassword,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white24,
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Colors.white60,
        ),
        suffixIcon: InkWell(
          onTap: () {
            onClickedTogglePassWordButton();
          },
          child: Icon(shouldShowPassword == true
              ? Icons.visibility_outlined
              : Icons.visibility_off_outlined),
        ),
        suffixIconColor: Colors.grey,
        errorText: errorText,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10).r,
          borderSide: BorderSide(
            width: 1.r,
            color: Colors.white60,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10).r,
          borderSide: BorderSide(
            width: 1.r,
            color: Colors.white60,
          ),
        )
      ),
    );
  }
}
