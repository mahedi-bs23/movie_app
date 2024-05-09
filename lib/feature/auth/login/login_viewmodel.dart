import 'package:flutter/cupertino.dart';
import 'package:movie_app/feature/auth/login/validator/email_validator.dart';
import 'package:movie_app/feature/auth/login/validator/password_validator.dart';

class LoginViewmodel{


  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final ValueNotifier<bool> passwordShow = ValueNotifier(false);

  final ValueNotifier<bool> shouldNavigate = ValueNotifier(false);

  bool get isValid => EmailValidator.isValid(emailController.text) &&
      PasswordValidator.isValid(passwordController.text);

  void onEmailChanged (String value){
    emailController.text = value;
  }
  void onPasswordChanged(String value){
    passwordController.text = value;
  }


  void onLoginButtonClicked() {
    if(isValid) {
      shouldNavigate.value = true;
    }
  }




}