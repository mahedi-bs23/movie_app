import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:movie_app/common/widget/elevated_button.dart';
import 'package:movie_app/common/widget/email_text_field.dart';
import 'package:movie_app/common/widget/password_text_field.dart';
import 'package:movie_app/feature/all_screen_bottom_navigation.dart/all_screen_bottom_navigration.dart';
import 'package:movie_app/feature/auth/login/login_viewmodel.dart';
import 'package:movie_app/feature/auth/signup/singup_screen.dart';
import 'package:movie_app/feature/home/home_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final LoginViewmodel loginViewmodel = LoginViewmodel();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn(scopes: [
      'email',
    ]).signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override
  Widget build(BuildContext context) {
    loginViewmodel.shouldNavigate.addListener(() {
      if (loginViewmodel.shouldNavigate.value) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AllScreenBottomNavigation(),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Plea se correct the errors in the form.'),
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
              children: <Widget>[
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
                  builder: (BuildContext context, emailController, _) {
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
                SizedBox(
                  height: 16.sp,
                ),

                _googleSignInButton(context),
                SizedBox(
                  height: 8.sp,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account? ",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignupScreen(),
                          ),
                        );
                      },
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          color: Colors.blue.shade500,
                          fontSize: 18.sp,
                        ),
                      ),
                    ),
                  ],
                ),
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

  Widget _googleSignInButton(BuildContext context) {
    return MyElevatedButton(
      buttonText: 'Google Sign In',
      backgroundColor: Colors.white,
      buttonTextColor: Colors.black,
      // Set your desired background color
      onPressed: () async {
        try {
          final credential = await signInWithGoogle();

          // Handle successful sign-in here, e.g., navigate to the next screen
          print('Google Sign-In successful: ${credential.user?.displayName}');
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AllScreenBottomNavigation()));
        } catch (e) {
          // Handle sign-in errors here
          print('Error signing in with Google: $e');
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Colors.red,
              content: Text(
                'Error signing in with Google. Please try again.',
                style: TextStyle(color: Colors.white),
              ),
            ),
          );
        }
      },
    );
  }
}
