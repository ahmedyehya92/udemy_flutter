import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:udemy_flutter/shared/components/components.dart';
import 'package:udemy_flutter/shared/components/conestants.dart';
import 'package:udemy_flutter/shared/network/local/cache_helper.dart';

import '../login/login_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  final CacheHelper cacheHelper;

  OnBoardingScreen(this.cacheHelper);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState(cacheHelper);
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final CacheHelper cacheHelper;

  _OnBoardingScreenState(this.cacheHelper);

  var boardingController = PageController();
  bool isLastPage = false;

  void submit() {
    cacheHelper.saveData(key: "onBoardingOpened", value: true);
    navigateAndFinish(context, ShopLoginScreen());
  }

  List<BoardingModel> boardingList = [
    BoardingModel(
      title: 'Order Online',
      body: 'Make an order sitting and choose online',
      image: 'assets/images/boarding1.png',
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
        appBar: AppBar(
          actions: [
            TextButton(
              child: Text(
                'Skip',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  decoration: TextDecoration.underline,
                ),
              ),
              onPressed: () {
                submit();
              },
            )
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(30.0),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: boardingController,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) =>
                      buildBoardingItem(boardingList[index]),
                  itemCount: boardingList.length,
                  onPageChanged: (index) {
                    if (index == boardingList.length - 1) {
                      print('last index');
                      isLastPage = true;
                    } else
                      isLastPage = false;
                  },
                ),
              ),
              Row(children: [
                SmoothPageIndicator(
                  controller: boardingController,
                  count: boardingList.length,
                  effect: ExpandingDotsEffect(
                      dotColor: Colors.grey,
                      dotHeight: 10.0,
                      expansionFactor: 4,
                      dotWidth: 10.0,
                      spacing: 5.0,
                      activeDotColor: mainColor),
                ),
                Spacer(),
                FloatingActionButton(
                  onPressed: () {
                    if (isLastPage == false) {
                      boardingController.nextPage(
                          duration: Duration(milliseconds: 1000),
                          curve: Curves.fastLinearToSlowEaseIn);
                    } else {
                      submit();
                    }
                  },
                  child: Icon(Icons.arrow_forward_ios),
                ),
              ])
            ],
          ),
        ));
  }

  Widget buildBoardingItem(BoardingModel boardingItem) => Column(
    children: [
      Expanded(
        flex: 1,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Image(
            image: AssetImage(boardingItem.image),
          ),
        ),
      ),
      Expanded(
        flex: 1,
        child: Column(children: [
          SizedBox(height: 16.0),
          Text(boardingItem.title,
              style:
              TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold)),
          SizedBox(height: 16.0),
          Text(boardingItem.body,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.0,
              )),
        ]),
      )
    ],
  );
}

class BoardingModel {
  final String image;
  final String title;
  final String body;

  BoardingModel({required this.body, required this.title, required this.image});
}

