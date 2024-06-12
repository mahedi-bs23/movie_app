import 'package:flutter/material.dart';
import 'package:movie_app/data/model/user_model.dart';

import 'signup_viewmodel.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final SignupViewModel _viewModel = SignupViewModel();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Signup Screen'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                UserModel? user = await _viewModel.signUp(
                    emailController.text, passwordController.text);
                if (user != null) {
                  print('Sign Up Successful: ${user.email}');
                } else {
                  print('Sign Up Failed');
                }
              },
              child: Text(
                'Sign Up',
                style: TextStyle(color: Colors.black),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                UserModel? user = await _viewModel.signIn(
                    emailController.text, passwordController.text);
                if (user != null) {
                  print('Sign In Successful: ${user.email}');
                } else {
                  print('Sign In Failed');
                }
              },
              child: Text(
                'Sign In',
                style: TextStyle(color: Colors.black),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                await _viewModel.signOut();
                print('User Signed Out');
              },
              child: Text(
                'Sign Out',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
