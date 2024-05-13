import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/common/widget/elevated_button.dart';
import 'package:movie_app/common/widget/email_text_field.dart';
import 'package:movie_app/common/widget/password_text_field.dart';
import 'package:movie_app/feature/auth/login/login_viewmodel.dart';
import 'package:movie_app/feature/home/home_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final LoginViewmodel loginViewmodel = LoginViewmodel();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    loginViewmodel.shouldNavigate.addListener(() {
      if (loginViewmodel.shouldNavigate.value) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Please correct the errors in the form.'),
          ),
        );
      }
    });
    return Scaffold(
      backgroundColor: Colors.black38,
      body: SafeArea(
        //minimum: const EdgeInsets.symmetric(horizontal: 20, vertical: 80),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 80).r,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  'Welcome Back',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25.sp,
                  ),
                ),
                SizedBox(
                  height: 8.sp,
                ),
                Text(
                  'Please sign in to your account',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                  ),
                ),
                SizedBox(
                  height: 64.sp,
                ),
                ValueListenableBuilder(
                  valueListenable: loginViewmodel.emailController,
                  builder: (BuildContext context,
                      emailController, _) {
                    return EmailTexTField(
                      emailTextEditingController:
                          loginViewmodel.emailController,
                      errorText: loginViewmodel.getEmailError(),
                      hintText: "Email",
                    );
                  },
                ),
                SizedBox(
                  height: 16.sp,
                ),

                ValueListenableBuilder(
                  valueListenable: loginViewmodel.shouldShowPassword,
                  builder: (context, shouldShowPassword, _) {
                    return ValueListenableBuilder(
                      valueListenable: loginViewmodel.passwordController,
                      builder: (context, passwordController, _) {
                        return PasswordTexTField(
                          passwordTextEditingController:
                              loginViewmodel.passwordController,
                          errorText: loginViewmodel.getPasswordError(),
                          shouldShowPassword: shouldShowPassword,
                          hintText: "Password",
                          onClickedTogglePassWordButton: () {
                            loginViewmodel.onPasswordShowChanged();
                          },
                        );
                      },
                    );
                  },
                ),

                ///_passField(),
                SizedBox(
                  height: 40.sp,
                ),
                _loginButton(),
                SizedBox(height: 16.sp,),
                _googleSignInButton(),

              ],
            ),
          ),
        ),
      ),
    );
  }


  Widget _loginButton() {
    return MyElevatedButton(
      buttonText: 'Sign In',
      backgroundColor: Colors.blue.shade600,
      buttonTextColor: Colors.white,
      // Set your desired background color
      onPressed: () {
        loginViewmodel.onLoginButtonClicked();
        print('Button clicked!');
      },
    );
  }

  Widget _googleSignInButton() {
    return MyElevatedButton(
      buttonText: 'Google Sign In',
      backgroundColor: Colors.white,
      buttonTextColor: Colors.black,
      // Set your desired background color
      onPressed: () {
        loginViewmodel.onLoginButtonClicked();
        print('Button clicked!');
      },
    );
  }

}
