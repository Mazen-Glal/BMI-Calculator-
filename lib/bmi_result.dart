// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, invalid_required_positional_param, must_be_immutable

import 'package:flutter/material.dart';

class BMIResult extends StatelessWidget {
  double result;
  int age;
  bool isMale;
  String status;
  BMIResult(
    @required this.result,
    @required this.age,
    @required this.isMale,
    @required this.status
    );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: Text('BMI Result : ', style: TextStyle(fontSize: 30))),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            'Gender : ${isMale ? 'Male' : 'Female'}',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
          SizedBox(height: 10),
          Text(
            'Result : ${result.round()}',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
          SizedBox(height: 10),
          Text(
            'Age : $age',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
          SizedBox(height: 20),
          Text(
            'you are $status',
            style: TextStyle(
              fontSize: 20, 
              fontWeight: FontWeight.w900,
              color:Colors.blue
                ),
          )
        ]),
      ),
    );
  }
}
