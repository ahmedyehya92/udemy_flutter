import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../bmi_result/bmi_result_screen.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({Key? key}) : super(key: key);

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  int weight = 0;
  double height = 120.0;
  int age = 0;
  Gender gender = Gender.notSelected;
  Color defaultColorGender = Color(0xFF0f1325);
  Color selectedColorGender = Colors.blue;
  Color colorGender = Color(0xFF0f1325);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Container(
        color: Color(0xFF090d1f),
        child: Column(
          children: [
            SizedBox(
              height: 16.0,
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.0
                      ),
                      child: GestureDetector(
                        onTap: (){
                          setState(() {
                            gender = Gender.male;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: gender == Gender.male ? selectedColorGender : defaultColorGender ,
                              borderRadius: BorderRadius.all(Radius.circular(10.0))
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(
                                image: AssetImage('assets/images/male.png'),
                                height: 70,
                                width: 70,
                              ),
                              SizedBox(height: 8.0,),
                              Text('MALE', style: TextStyle(color: Colors.white),),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.0
                      ),
                      child: GestureDetector(
                        onTap: (){
                          setState(() {
                            gender = Gender.female;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: gender == Gender.female ? selectedColorGender : defaultColorGender ,
                              borderRadius: BorderRadius.all(Radius.circular(10.0))
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(
                                image: AssetImage('assets/images/female.png'),
                                height: 70,
                                width: 70,
                              ),
                              SizedBox(height: 8.0,),
                              Text('FEMALE', style: TextStyle(color: Colors.white),),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 16.0,
            ),
            Expanded(
              child: Padding(
                padding:EdgeInsets.symmetric(
                  horizontal: 16.0
                ),
                child: Container(
                  decoration: BoxDecoration(
                      color: Color(0xFF1c1d31),
                      borderRadius: BorderRadius.all(Radius.circular(10.0))
                  ),
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('HEIGHT', style: TextStyle(color: Colors.white),),
                      Row(
                        textBaseline: TextBaseline.alphabetic,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${height.round()}',
                            style: TextStyle(color: Colors.white, fontSize: 35.0, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'cm',
                            style: TextStyle(color: Colors.white,),
                          )
                        ],
                      ),
                      Slider(
                        value: height,
                        max: 220.0,
                        min: 100.0,
                        onChanged: (value){
                          setState(() {
                            height = value;
                          });
                        },

                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 16.0,
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.0
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color(0xFF0f1325),
                              borderRadius: BorderRadius.all(Radius.circular(10.0))
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('WEIGHT', style: TextStyle(color: Colors.white),),
                              Text('$weight', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 35.0),),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FloatingActionButton(
                                    backgroundColor: Color(0xFF4c4f5c),
                                    onPressed: (){
                                      setState(() {
                                        weight--;
                                      });
                                      },
                                    child: Icon(Icons.remove),
                                    heroTag: 'weight--',
                                      ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  FloatingActionButton(
                                    backgroundColor: Color(0xFF4c4f5c),
                                    onPressed: (){
                                      setState(() {
                                        weight++;
                                      });
                                    },
                                    child: Icon(Icons.add),
                                    heroTag: 'weight++',
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.0
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color(0xFF0f1325),
                              borderRadius: BorderRadius.all(Radius.circular(10.0))
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('AGE', style: TextStyle(color: Colors.white),),
                              Text('$age', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 35.0),),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FloatingActionButton(
                                    backgroundColor: Color(0xFF4c4f5c),
                                    onPressed: (){
                                      setState(() {
                                        age--;
                                      });
                                    },
                                    child: Icon(Icons.remove),
                                    heroTag: 'age--',
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  FloatingActionButton(
                                    backgroundColor: Color(0xFF4c4f5c),
                                    onPressed: (){
                                      setState(() {
                                        age++;
                                      });
                                    },
                                    child: Icon(Icons.add),
                                    heroTag: 'age++',
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 16.0,
            ),
            Container(
              width: double.infinity,
              color: Colors.red,
              child: MaterialButton(
                height: 50,
                onPressed: (){
                  var result = weight / pow(height/100, 2);
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => BmiResultScreen(
                        gender: gender == Gender.male ? 'Male' : gender == Gender.female ? 'Female' : 'not selected',
                        result: result.round(),
                      )));
                },
                child: Text(
                  'CALCULATE',
                  style: TextStyle(
                    color: Colors.white
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

enum Gender {
male,female, notSelected
}
