import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HomeScreen extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    // main axis alignment default: start (it is equal top)
    // cross axis alignment default: center
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 10,
        backgroundColor: Colors.blueAccent,
        leading: const Icon(
          Icons.menu,
        ),
        title: const Text(
          'First App'
        ),
        actions:  [
          IconButton(
            icon: const Icon(
                Icons.notification_important
            ),
            onPressed: (){
              onNotificationClicked();
            },
          ),
          IconButton(
            icon: const Text(
                'data'
            ),
            onPressed: (){

            },
          )
        ],
      ),
      //if no app bar will start design after status bar
      body: Container(
        width: double.infinity,
        color: Colors.green,
        child: SingleChildScrollView(
          child: Column(
            //mainAxisSize is a vertical size in column
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children:
             [
              Container(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0,),
                  ),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  width: 200.0,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children:
                    [
                      const Image(
                      image: NetworkImage("https://cdn.pixabay.com/photo/2015/04/19/08/32/marguerite-729510__480.jpg"),
                      height: 200.0,
                      width: 200.0,
                      fit: BoxFit.cover,
                    ),
                      Container(
                        width: double.infinity,
                        color: Colors.deepOrange.withOpacity(0.5),
                        padding: const EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 5,
                        ),
                        child: const Text(
                          'Image',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15
                          ),
                          textAlign: TextAlign.center,
                        ),
                      )
                    ]
                  ),
                )
              ),
               Container(
                 color: Colors.cyanAccent,
                 child: const Text(
                   'Second Text',
                   style: TextStyle(
                       color: Colors.white,
                       fontSize: 15
                   ),
                 ),
               ),
               Container(
                 color: Colors.blue,
                 child: const Text(
                   'Third Text',
                   style: TextStyle(
                       color: Colors.white,
                       fontSize: 15
                   ),
                 ),
               ),
               Container(
                 color: Colors.amber,
                 child: const Text(
                   'Fourth Text',
                   style: TextStyle(
                       color: Colors.white,
                       fontSize: 15
                   ),
                 ),
               ),
               Container(
                 color: Colors.deepOrange,
                 child: const Text(
                   'First Text',
                   style: TextStyle(
                       color: Colors.white,
                       fontSize: 15
                   ),
                 ),
               ),
               Container(
                 color: Colors.cyanAccent,
                 child: const Text(
                   'Second Text',
                   style: TextStyle(
                       color: Colors.white,
                       fontSize: 15
                   ),
                 ),
               ),
               Container(
                 color: Colors.blue,
                 child: const Text(
                   'Third Text',
                   style: TextStyle(
                       color: Colors.white,
                       fontSize: 15
                   ),
                 ),
               ),
               Container(
                 color: Colors.amber,
                 child: const Text(
                   'Fourth Text',
                   style: TextStyle(
                       color: Colors.white,
                       fontSize: 15
                   ),
                 ),
               ),
               Container(
                 color: Colors.deepOrange,
                 child: const Text(
                   'First Text',
                   style: TextStyle(
                       color: Colors.white,
                       fontSize: 15
                   ),
                 ),
               ),
               Container(
                 color: Colors.cyanAccent,
                 child: const Text(
                   'Second Text',
                   style: TextStyle(
                       color: Colors.white,
                       fontSize: 15
                   ),
                 ),
               ),
               Container(
                 color: Colors.blue,
                 child: const Text(
                   'Third Text',
                   style: TextStyle(
                       color: Colors.white,
                       fontSize: 15
                   ),
                 ),
               ),
               Container(
                 color: Colors.amber,
                 child: const Text(
                   'Fourth Text',
                   style: TextStyle(
                       color: Colors.white,
                       fontSize: 15
                   ),
                 ),
               ),
               Container(
                 color: Colors.deepOrange,
                 child: const Text(
                   'First Text',
                   style: TextStyle(
                       color: Colors.white,
                       fontSize: 15
                   ),
                 ),
               ),
               Container(
                 color: Colors.cyanAccent,
                 child: const Text(
                   'Second Text',
                   style: TextStyle(
                       color: Colors.white,
                       fontSize: 15
                   ),
                 ),
               ),
               Container(
                 color: Colors.blue,
                 child: const Text(
                   'Third Text',
                   style: TextStyle(
                       color: Colors.white,
                       fontSize: 15
                   ),
                 ),
               ),
               Container(
                 color: Colors.amber,
                 child: const Text(
                   'Fourth Text',
                   style: TextStyle(
                       color: Colors.white,
                       fontSize: 15
                   ),
                 ),
               ),
               Container(
                 color: Colors.deepOrange,
                 child: const Text(
                   'First Text',
                   style: TextStyle(
                       color: Colors.white,
                       fontSize: 15
                   ),
                 ),
               ),
               Container(
                 color: Colors.cyanAccent,
                 child: const Text(
                   'Second Text',
                   style: TextStyle(
                       color: Colors.white,
                       fontSize: 15
                   ),
                 ),
               ),
               Container(
                 color: Colors.blue,
                 child: const Text(
                   'Third Text',
                   style: TextStyle(
                       color: Colors.white,
                       fontSize: 15
                   ),
                 ),
               ),
               Container(
                 color: Colors.amber,
                 child: const Text(
                   'Fourth Text',
                   style: TextStyle(
                       color: Colors.white,
                       fontSize: 15
                   ),
                 ),
               ),
               Container(
                 color: Colors.deepOrange,
                 child: const Text(
                   'First Text',
                   style: TextStyle(
                       color: Colors.white,
                       fontSize: 15
                   ),
                 ),
               ),
               Container(
                 color: Colors.cyanAccent,
                 child: const Text(
                   'Second Text',
                   style: TextStyle(
                       color: Colors.white,
                       fontSize: 15
                   ),
                 ),
               ),
               Container(
                 color: Colors.blue,
                 child: const Text(
                   'Third Text',
                   style: TextStyle(
                       color: Colors.white,
                       fontSize: 15
                   ),
                 ),
               ),
               Container(
                 color: Colors.amber,
                 child: const Text(
                   'Fourth Text',
                   style: TextStyle(
                       color: Colors.white,
                       fontSize: 15
                   ),
                 ),
               ),
               Container(
                 color: Colors.deepOrange,
                 child: const Text(
                   'First Text',
                   style: TextStyle(
                       color: Colors.white,
                       fontSize: 15
                   ),
                 ),
               ),
               Container(
                 color: Colors.cyanAccent,
                 child: const Text(
                   'Second Text',
                   style: TextStyle(
                       color: Colors.white,
                       fontSize: 15
                   ),
                 ),
               ),
               Container(
                 color: Colors.blue,
                 child: const Text(
                   'Third Text',
                   style: TextStyle(
                       color: Colors.white,
                       fontSize: 15
                   ),
                 ),
               ),
               Container(
                 color: Colors.amber,
                 child: const Text(
                   'Fourth Text',
                   style: TextStyle(
                       color: Colors.white,
                       fontSize: 15
                   ),
                 ),
               ),
               Container(
                 color: Colors.deepOrange,
                 child: const Text(
                   'First Text',
                   style: TextStyle(
                       color: Colors.white,
                       fontSize: 15
                   ),
                 ),
               ),
               Container(
                 color: Colors.cyanAccent,
                 child: const Text(
                   'Second Text',
                   style: TextStyle(
                       color: Colors.white,
                       fontSize: 15
                   ),
                 ),
               ),
               Container(
                 color: Colors.blue,
                 child: const Text(
                   'Third Text',
                   style: TextStyle(
                       color: Colors.white,
                       fontSize: 15
                   ),
                 ),
               ),
               Container(
                 color: Colors.amber,
                 child: const Text(
                   'Fourth Text',
                   style: TextStyle(
                       color: Colors.white,
                       fontSize: 15
                   ),
                 ),
               ),
               Container(
                 color: Colors.deepOrange,
                 child: const Text(
                   'First Text',
                   style: TextStyle(
                       color: Colors.white,
                       fontSize: 15
                   ),
                 ),
               ),
               Container(
                 color: Colors.cyanAccent,
                 child: const Text(
                   'Second Text',
                   style: TextStyle(
                       color: Colors.white,
                       fontSize: 15
                   ),
                 ),
               ),
               Container(
                 color: Colors.blue,
                 child: const Text(
                   'Third Text',
                   style: TextStyle(
                       color: Colors.white,
                       fontSize: 15
                   ),
                 ),
               ),
               Container(
                 color: Colors.amber,
                 child: const Text(
                   'Fourth Text',
                   style: TextStyle(
                       color: Colors.white,
                       fontSize: 15
                   ),
                 ),
               ),
               Container(
                 color: Colors.deepOrange,
                 child: const Text(
                   'First Text',
                   style: TextStyle(
                       color: Colors.white,
                       fontSize: 15
                   ),
                 ),
               ),
               Container(
                 color: Colors.cyanAccent,
                 child: const Text(
                   'Second Text',
                   style: TextStyle(
                       color: Colors.white,
                       fontSize: 15
                   ),
                 ),
               ),
               Container(
                 color: Colors.blue,
                 child: const Text(
                   'Third Text',
                   style: TextStyle(
                       color: Colors.white,
                       fontSize: 15
                   ),
                 ),
               ),
               Container(
                 color: Colors.amber,
                 child: const Text(
                   'Fourth Text',
                   style: TextStyle(
                       color: Colors.white,
                       fontSize: 15
                   ),
                 ),
               ),
               Container(
                 color: Colors.deepOrange,
                 child: const Text(
                   'First Text',
                   style: TextStyle(
                       color: Colors.white,
                       fontSize: 15
                   ),
                 ),
               ),
               Container(
                 color: Colors.cyanAccent,
                 child: const Text(
                   'Second Text',
                   style: TextStyle(
                       color: Colors.white,
                       fontSize: 15
                   ),
                 ),
               ),
               Container(
                 color: Colors.blue,
                 child: const Text(
                   'Third Text',
                   style: TextStyle(
                       color: Colors.white,
                       fontSize: 15
                   ),
                 ),
               ),
               Container(
                 color: Colors.amber,
                 child: const Text(
                   'Fourth Text',
                   style: TextStyle(
                       color: Colors.white,
                       fontSize: 15
                   ),
                 ),
               ),
               SingleChildScrollView(
                 scrollDirection: Axis.horizontal,
                 child: Row(
                   children: [
                     Container(
                       alignment: Alignment.center,
                       color: Colors.deepOrange,
                       child: const Text(
                         'First Text',
                         style: TextStyle(
                             color: Colors.white,
                             fontSize: 15
                         ),
                       ),
                     ),
                     Container(
                       color: Colors.cyanAccent,
                       child: const Text(
                         'Second Text',
                         style: TextStyle(
                             color: Colors.white,
                             fontSize: 15
                         ),
                       ),
                     ),
                     Container(
                       color: Colors.blue,
                       child: const Text(
                         'Third Text',
                         style: TextStyle(
                             color: Colors.white,
                             fontSize: 15
                         ),
                       ),
                     ),
                     Container(
                       color: Colors.amber,
                       child: const Text(
                         'Fourth Text',
                         style: TextStyle(
                             color: Colors.white,
                             fontSize: 15
                         ),
                       ),
                     ),
                     Container(
                       color: Colors.blue,
                       child: const Text(
                         'Third Text',
                         style: TextStyle(
                             color: Colors.white,
                             fontSize: 15
                         ),
                       ),
                     ),
                     Container(
                       color: Colors.amber,
                       child: const Text(
                         'Fourth Text',
                         style: TextStyle(
                             color: Colors.white,
                             fontSize: 15
                         ),
                       ),
                     ),
                   ],
                 ),
               )
            ],
          ),
        ),
      ),
    );
  }

  void onNotificationClicked()
  {
    print('Hi');
  }

}