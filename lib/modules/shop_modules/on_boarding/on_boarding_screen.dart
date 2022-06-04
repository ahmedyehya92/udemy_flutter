import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OnBoardingScreen extends StatelessWidget {
  List<BoardingModel> boardingList = [
    BoardingModel(
      title: 'Order Online',
      body: 'Make an order sitting and choose online',
      image: 'assets/images/boarding2.jpg',
    ),
    BoardingModel(
      title: 'Mobile Payments',
      body: 'Download our shopping app and buy using your smartphone or laptop',
      image: 'assets/images/boarding2.jpg',
    ),
    BoardingModel(
      title: 'Delivery Service',
      body:
          'Modern delivering technologies, Shipping to the porch of your apartments',
      image: 'assets/images/boarding3.jpg',
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: EdgeInsets.all(30.0),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) =>
                      buildBoardingItem(boardingList[index]),
                  itemCount: boardingList.length,
                ),
              ),
              Row(children: [
                Text('Indicator'),
                Spacer(),
                FloatingActionButton(
                  onPressed: () {},
                  child: Icon(Icons.arrow_forward_ios),
                ),
              ])
            ],
          ),
        ));
  }

  Widget buildBoardingItem(BoardingModel boardingItem) => Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Expanded(
              child: Image(
                image: AssetImage(boardingItem.image),
              ),
            ),
          ),
          Spacer(),
          SizedBox(height: 16.0),
          Text(boardingItem.title,
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold)),
          SizedBox(height: 16.0),
          Text(boardingItem.body,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.0,
              )),
        ],
      );
}

class BoardingModel {
  final String image;
  final String title;
  final String body;

  BoardingModel({required this.body, required this.title, required this.image});
}
