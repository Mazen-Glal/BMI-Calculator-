// ignore_for_file: avoid_print, prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors

import 'dart:math';

import 'package:bmi_calculator/bmi_result.dart';
import 'package:flutter/material.dart';

class BMIScreen extends StatefulWidget {
  @override
  State<BMIScreen> createState() => _BMIScreenState();
}

class _BMIScreenState extends State<BMIScreen> {
  String status = 'unknow';
  bool isMale = true;
  double height = 100.0;
  int age = 20;
  int weight = 50;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Expanded(
          child: Text(
            'BMI Calculator',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
        ),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Expanded(
            child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isMale = true;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: isMale ? Colors.blue : Colors.grey[400],
                        borderRadius: BorderRadius.circular(15)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                            image: AssetImage('assets/images/male.png'),
                            height: 90,
                            width: 90),
                        SizedBox(height: 23),
                        Text('Male',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 35))
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(width: 23),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isMale = false;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: isMale ? Colors.grey[400] : Colors.blue,
                        borderRadius: BorderRadius.circular(15)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                            image: AssetImage('assets/images/female.png'),
                            height: 90,
                            width: 90),
                        SizedBox(height: 23),
                        Text('Female',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 35))
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        )),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.grey[400],
                borderRadius: BorderRadius.circular(20)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('HEIGHT',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 40)),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('${height.round()}',
                        style: TextStyle(
                            fontWeight: FontWeight.w900, fontSize: 50)),
                    SizedBox(width: 10),
                    Text('cm',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25))
                  ],
                ),
                SizedBox(height: 20),
                Slider(
                    value: height,
                    max: 220.0,
                    min: 80.0,
                    onChanged: (value) {
                      setState(() {
                        height = value;
                      });
                    })
              ],
            ),
          ),
        )),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.all(23.0),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: BorderRadius.circular(20.0)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('WEIGHT',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 30)),
                      SizedBox(height: 10),
                      Text('$weight',
                          style: TextStyle(
                              fontWeight: FontWeight.w900, fontSize: 50)),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FloatingActionButton(
                            mini: true,
                            onPressed: () {
                              setState(() {
                                weight--;
                              });
                            },
                            child: Icon(Icons.remove),
                          ),
                          SizedBox(width: 20),
                          FloatingActionButton(
                            mini: true,
                            onPressed: () {
                              setState(() {
                                weight++;
                              });
                            },
                            child: Icon(Icons.add),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: BorderRadius.circular(20.0)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Age',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 40)),
                      SizedBox(height: 10),
                      Text('$age',
                          style: TextStyle(
                              fontWeight: FontWeight.w900, fontSize: 50)),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FloatingActionButton(
                            mini: true,
                            onPressed: () {
                              setState(() {
                                age--;
                              });
                            },
                            child: Icon(Icons.remove),
                          ),
                          SizedBox(width: 20),
                          FloatingActionButton(
                            mini: true,
                            onPressed: () {
                              setState(() {
                                age++;
                              });
                            },
                            child: Icon(Icons.add),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        )),
        Container(
          width: double.infinity,
          color: Colors.blue,
          child: MaterialButton(
            onPressed: () {
              double result = weight / pow((height / 100), 2);
              if (result <= 18.49) {
                status = 'Under Weight';
              } else if (result >= 18.5 && result <= 24.99) {
                status = 'Healthy';
              } else if (result >= 25 && result <= 29.99) {
                status = 'Over Weight';
              } else if (result >= 30) {
                status = 'OBESE';
              }
              print('Calculate Done..');
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: 
                      (context) => BMIResult(result, age, isMale,status)));
            },
            child: Text('Calculate',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30)),
          ),
        )
      ]),
    );
  }
}
