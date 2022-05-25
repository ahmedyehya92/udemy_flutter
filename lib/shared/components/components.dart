import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget defaultButton({
  required String text,
  double? width = double.infinity,
  Color? color = Colors.blue,
  Color? textColor = Colors.white,
  double radius = 5.0,
  required Function() function
        }) =>
    Container(
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: color,
      ),
      child: MaterialButton(
        child:  Text(
          text,
          style: TextStyle(
            color: textColor,
          ),
        ),
        onPressed: function,
      ),
    );

Widget defaultTextFormField({
  required String labelText,
  required TextEditingController textController,
  required Icon icon,
  TextInputType inputType = TextInputType.text,
  String? Function(String? value)? validator,
  bool secure = false,
  double boarderRadius = 5.0,
  IconData? suffixIcon,
  Function()? suffixPressed,
  Function()? onClick,
  enabled = true
}) =>
TextFormField(
controller: textController,
enabled: enabled,
onTap: onClick,
validator: validator,
obscureText: secure,
    keyboardType: inputType,
decoration: InputDecoration(
labelText: labelText,
prefixIcon: icon,
suffixIcon: IconButton(
  onPressed: suffixPressed,
  icon: Icon(suffixIcon),
),
border: OutlineInputBorder(
borderRadius: BorderRadius.all(Radius.circular(boarderRadius))
)
)
);
