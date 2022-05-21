import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


// Stateless contain one class provide widget

// Stateful contain 2 classes
// 1. provide widget
// 2. provide state from this widget
class CounterScreen extends StatefulWidget {
  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int counter = 0;

  // call flow
  // 1. constructor
  // 2. init state
  // 3. build

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(onPressed: () {
              setState(() {
                counter--;
                print(counter);
              });
            },
            child: Text(
              'MINUS'
            ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal:8.0
              ),
              child: Text(
                  '$counter',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 50.0
                ),

              ),
            ),
            TextButton(onPressed: () {
              setState(() {
                counter++;
                print(counter);
              });
            },
              child: Text(
                  'PLUS'
              ),
            ),
          ],
        ),
      ),
    );
  }
}