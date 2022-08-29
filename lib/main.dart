// ignore_for_file: use_key_in_widget_constructors

import 'package:bmi_calculator/bmi_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // darkTheme: ,
      debugShowCheckedModeBanner: false,
      home: BMIScreen(),
    );
  }
}
