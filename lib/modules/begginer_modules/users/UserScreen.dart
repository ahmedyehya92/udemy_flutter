import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../models/user/user_model.dart';

class UserScreen extends StatelessWidget {
  List<UserModel> users = [
    UserModel(id: 1, name: "Ahmed", phone: "011254"),
    UserModel(
        id: 2,
        name: "Osama",
        phone: "05522"
    ),
    UserModel(
        id: 3,
        name: "Za3bolla",
        phone: "2222"
    ),
    UserModel(
        id: 4,
        name: "Emad",
        phone: "05223"
    ),
    UserModel(
        id: 1,
        name: "Ahmed",
        phone: "011254"
    ),
    UserModel(
        id: 2,
        name: "Osama",
        phone: "05522"
    ),
    UserModel(
        id: 3,
        name: "Za3bolla",
        phone: "2222"
    ),
    UserModel(
        id: 4,
        name: "Emad",
        phone: "05223"
    ),
    UserModel(
        id: 1,
        name: "Ahmed",
        phone: "011254"
    ),
    UserModel(
        id: 2,
        name: "Osama",
        phone: "05522"
    ),
    UserModel(
        id: 3,
        name: "Za3bolla",
        phone: "2222"
    ),
    UserModel(
        id: 4,
        name: "Emad",
        phone: "05223"
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text(
          'Users'
        ),
      ),
      body: ListView.separated(
          itemBuilder: (context, index) => buildUserItem(users[index]),
          separatorBuilder: (context, index) => Padding(
            padding: EdgeInsetsDirectional.only(
              start: 20.0
            ),
            child: Container(
              width: double.infinity,
              height: 1.0,
              color: Colors.grey[300],
            ),
          ),
          itemCount: users.length,
      )
    );
  }
  //TODO build lis
  // 1- build item
  // 2- build list
  // 3- add item to list

  Widget buildUserItem(UserModel userModel) => Padding(
    padding: EdgeInsets.all(20.0),
    child: Row(
      children: [
        CircleAvatar(
          radius: 25.0,
          child: Text(
            "${userModel.id}",
            style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold
            ),
          ),
        ),
        SizedBox(
          width: 20.0,
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${userModel.name}",
              style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold
              ),
            ),
            Text(
                "${userModel.phone}"
            )
          ],
        )
      ],
    ),
  );

}