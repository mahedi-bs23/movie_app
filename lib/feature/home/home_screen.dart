import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: SafeArea(
        child: Center(
          child: Text("Home Page",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        )
      ),
    );
  }
}
