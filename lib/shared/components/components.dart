import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget defaultButton({
  required String text,
  double? width = double.infinity,
  Color? color = Colors.blue,
  Color? textColor = Colors.white,
  double radius = 5.0,
  required Function? function()
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

Widget buildTaskItem(Map taskModel, Function? doneTask(), Function? archiveTask(), Function? deleteTask()) => Padding(
padding: EdgeInsets.all(16.0),
child: Row(
children: [
CircleAvatar(
radius:40.0,
child: Text('${taskModel['time']}'),
),
SizedBox(
width:20.0,
),
Row(
  children: [
    Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Text(
          '${taskModel['title']}',
          style: TextStyle(
              fontSize:18.0,
              fontWeight: FontWeight.bold
          ),
        ),
        Text(
          '${taskModel['date']}',
          style: TextStyle(
              color: Colors.grey
          ),
        ),
        SizedBox(
          height:8.0,
        ),
        Row(
          children: [
            defaultButton(
                text: 'done',
                function: doneTask,
                width: 70.0,
                color: Colors.green
            ),
            SizedBox(
              width: 8.0,
            ),
            defaultButton(
                text: 'Archive',
                function: archiveTask,
                width: 80.0,
                color: Colors.redAccent
            ),
          ],
        ),
      ],
    ),
    RawMaterialButton(
      onPressed: deleteTask,
      elevation: 2.0,
      fillColor: Colors.white,
      child: Icon(
        Icons.delete,
        size: 35.0,
      ),
      padding: EdgeInsets.all(15.0),
      shape: CircleBorder(),
    )
  ],
)
],
),
);

buildNewsItem({String? text, String? imgUrl}) {
  return Padding(
    padding:const EdgeInsets.all(16.0),
    child: Material(
      elevation: 10.0,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 120.0,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.only(topStart: Radius.circular(10.0), topEnd: Radius.circular(10.0)),
                color: Colors.white,
                image: DecorationImage(
                  image: NetworkImage(imgUrl??''),
                  fit: BoxFit.cover,
                )
            ),
          ),
          const SizedBox(
            height: 8.0,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              //NewsCubit.get(context).businessNews[0]['title'],
              text?? '',
              textAlign: TextAlign.right,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0
              ),
            ),
          ),
          const SizedBox(
            height: 8.0,
          ),
        ],
      ),
    ),
  );
}

Widget errorView(IconData icon, String text)
{
  return Center(
     child: Column(
       mainAxisAlignment: MainAxisAlignment.center,
       children: [
         Icon(
           icon,
           size: 50.0,
           color: Colors.grey,
         ),
         Text(
           text,
           style: const TextStyle(
               color: Colors.grey
           ),
         )
       ],
     ),
  );
}