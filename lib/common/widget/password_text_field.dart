import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/feature/auth/login/login_viewmodel.dart';
import 'package:movie_app/feature/auth/login/validator/password_validator.dart';

class PasswordTexTField extends StatelessWidget {
  final TextEditingController passwordTextEditingController;
  final String? errorText;
  final String? hintText;

  //final bool passwordShow;

  PasswordTexTField({
    super.key,
    required this.passwordTextEditingController,
    required this.hintText,
    required this.errorText,
    //required this.passwordShow,
  });

  final LoginViewmodel loginViewmodel = LoginViewmodel();

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: passwordTextEditingController,

      builder: (BuildContext context,
          TextEditingValue textEditingValue, _) {
        return TextField(
          controller: passwordTextEditingController,
          style: TextStyle(color: Colors.white54),
          cursorColor: Colors.white,
          ///keyboardType: TextInputType.visiblePassword,
          obscureText: loginViewmodel.passwordShow.value,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white24,
            hintText: hintText,
            hintStyle: TextStyle(
              color: Colors.white60,
            ),
            suffixIcon: InkWell(
              onTap: () {
                loginViewmodel.onPasswordShowChanged();
              },
              child: Icon(loginViewmodel.passwordShow.value==true
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
           /* enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10).r,
              borderSide: BorderSide(
                width: 1.r,
                color: Colors.white60,
              ),
            ),*/
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10).r,
              borderSide: BorderSide(
                width: 1.r,
                color: Colors.white60,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                width: 1,
                color: PasswordValidator.errorMsg.isEmpty
                    ? Colors.white60
                    : PasswordValidator.errorMsg == "Invalid Password"
                        ? Colors.red
                        : Colors.white60, // Customize error border color here
              ),
            ),
          ),
        );
      }
    );
  }
}
