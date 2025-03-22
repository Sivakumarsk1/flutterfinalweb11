import 'package:doc_appointment/Splashscreen.dart';
import 'package:doc_appointment/openingscreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Openingscreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}