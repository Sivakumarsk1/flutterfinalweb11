import 'package:doc_appointment/Form.dart';
import 'package:doc_appointment/main.dart';
import 'package:flutter/material.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Wait for 3 seconds before navigating to RegisterPage
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => formscreen()), // Navigate to RegisterPage
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Colors.white, // You can change the splash screen background color
      body: Center(
        child: Image.asset(
            'assets/JTS logo.png'), // Ensure the image exists in the assets folder
      ),
    );
  }
}