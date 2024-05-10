import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/common/widget/elevated_button.dart';
import 'package:movie_app/common/widget/input_decoration.dart';
import 'package:movie_app/feature/auth/login/login_viewmodel.dart';
import 'package:movie_app/feature/auth/login/validator/email_validator.dart';
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
      }else{
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
                _emailField(),
                SizedBox(
                  height: 16.sp,
                ),
                _passField(),
                SizedBox(
                  height: 40.sp,
                ),
                _loginButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _emailField() {
    return ValueListenableBuilder(
        valueListenable: loginViewmodel.emailController,
        builder: (BuildContext context, TextEditingValue textEditingValue, _) {
          return Form(
            key: _formKey,
            child: SizedBox(
              child: TextFormField(


                controller: loginViewmodel.emailController,
                style: TextStyle(color: Colors.white54),
                cursorColor: Colors.white,
                keyboardType: TextInputType.emailAddress,
                decoration: buildInputDecoration("email address"),
                validator: (String? value){

                  return 'Please a Enter Email';

                },
                onChanged: (String value) {
                  loginViewmodel.onEmailChanged(value);
                },
              ),
            ),
          );
        });
  }

  Widget _passField() {
    return ValueListenableBuilder(
        valueListenable: loginViewmodel.passwordController,
        builder: (BuildContext context, TextEditingValue textEditingValue, _) {
          return SizedBox(
            child: TextFormField(
              controller: loginViewmodel.passwordController,
              style: TextStyle(color: Colors.white54),
              cursorColor: Colors.white,
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                errorText: loginViewmodel.getPasswordError(),
                filled: true,
                fillColor: Colors.white24,
                suffixIcon: Icon(
                  Icons.visibility,
                  color: Colors.white60,
                ),
                hintText: "password",
                hintStyle: const TextStyle(
                  color: Colors.white60,
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10).r,
                    borderSide: BorderSide(
                      width: 1.r,
                      color: Colors.white60,
                    )),

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
                    )),
              ),
              validator: (String? value){
                if(value!.isEmpty){
                  return "Please Enter Password";
                }
                return null;
              },
              onChanged: (String value) {
                loginViewmodel.onPasswordChanged(value);
              },
            ),
          );
        });
  }

  Widget _loginButton() {
    return MyElevatedButton(
      buttonText: 'Sign In',
      backgroundColor: Colors.blue.shade600,
      // Set your desired background color
      onPressed: () {
        loginViewmodel.onLoginButtonClicked();
        print('Button clicked!');
      },
    );
  }
}
