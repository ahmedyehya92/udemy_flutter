import 'package:flutter/material.dart';
import 'package:udemy_flutter/modules/users/UserScreen.dart';
import 'package:udemy_flutter/modules/bmi_result/bmi_result_screen.dart';
import 'package:udemy_flutter/modules/counter/counter_screen.dart';
import 'package:udemy_flutter/modules/home/home_screen.dart';
import 'package:udemy_flutter/modules/messanger/messanger_screen.dart';

import 'modules/bmi/bmi_screen.dart';
import 'modules/login/login_screen.dart';
import 'modules/messanger/messanger_screen_list_view.dart';

void main() {
  // run widget
  runApp(MyApp());

}

// Stateless
// Stateful

// class MyApp

class MyApp extends StatelessWidget
{
  // manager and builder design
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen()
    );
  }

}