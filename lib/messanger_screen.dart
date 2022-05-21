import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MessangerScreen extends StatelessWidget
{
  double imageSize = 60.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.black87,
        elevation: 0.0,
        title: Row(
          children:   const [
            CircleAvatar(
              radius: 20.0,
              backgroundImage: NetworkImage("https://www.shareicon.net/data/512x512/2016/05/24/770137_man_512x512.png"),
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              "Chats",
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold
              ),

            ),
          ],
        ),
        actions: [
          IconButton(
              onPressed: (){},
              icon: const CircleAvatar(
                child: Icon(
                  Icons.camera_alt,
                  size: 16.0,
                  color: Colors.white,
                ),
                radius:15.0,
                backgroundColor: Colors.white12,
              ),
          ),
          IconButton(
            onPressed: (){},
            icon: const CircleAvatar(
              child: Icon(
                Icons.edit,
                size: 16.0,
                color: Colors.white,
              ),
              radius:15.0,
              backgroundColor: Colors.white12,
            ),
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsetsDirectional.all(10.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                height: 40.0,
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Search",
                    hintStyle: const TextStyle(
                      color: Colors.white10
                    ),
                    prefixIcon: const Icon(
                        Icons.search,
                      color: Colors.white,
                    ),
                    filled: true,
                    fillColor: Colors.white12,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50)
                    )
                  )
                ),
              ),
              const SizedBox(
                height: 16.0,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      width: 70.0,
                      child: Column(
                        children: [
                          Stack(
                            alignment: AlignmentDirectional.bottomEnd,
                            children:  [
                              Container(
                                height: imageSize,
                                width: imageSize,
                                child: const Image(
                                    image: NetworkImage('https://www.shareicon.net/data/512x512/2016/05/24/770137_man_512x512.png')

                                ),
                              ),
                              const CircleAvatar(
                                backgroundColor: Colors.black,
                                radius: 9,
                              ),
                              const CircleAvatar(
                                backgroundColor: Colors.green,
                                radius: 8,
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 8.0,
                          ),
                          const Text(
                            'Haytham Assem Ahmed Abdelsalam',
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 8.0,
                    ),
                    Container(
                      width: 70.0,
                      child: Column(
                        children: [
                          Stack(
                            alignment: AlignmentDirectional.bottomEnd,
                            children:  [
                              Container(
                                height: imageSize,
                                width: imageSize,
                                child: const Image(
                                    image: NetworkImage('https://www.shareicon.net/data/512x512/2016/05/24/770137_man_512x512.png')

                                ),
                              ),
                              const CircleAvatar(
                                backgroundColor: Colors.black,
                                radius: 9,
                              ),
                              const CircleAvatar(
                                backgroundColor: Colors.green,
                                radius: 8,
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 8.0,
                          ),
                          const Text(
                            'Haytham Assem',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 8.0,
                    ),
                    Container(
                      width: 70.0,
                      child: Column(
                        children: [
                          Stack(
                            alignment: AlignmentDirectional.bottomEnd,
                            children:  [
                              Container(
                                height: imageSize,
                                width: imageSize,
                                child: const Image(
                                    image: NetworkImage('https://www.shareicon.net/data/512x512/2016/05/24/770137_man_512x512.png')

                                ),
                              ),
                              const CircleAvatar(
                                backgroundColor: Colors.black,
                                radius: 9,
                              ),
                              const CircleAvatar(
                                backgroundColor: Colors.green,
                                radius: 8,
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 8.0,
                          ),
                          const Text(
                            'Haytham Assem',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 8.0,
                    ),
                    Container(
                      width: 70.0,
                      child: Column(
                        children: [
                          Stack(
                            alignment: AlignmentDirectional.bottomEnd,
                            children:  [
                              Container(
                                height: imageSize,
                                width: imageSize,
                                child: const Image(
                                    image: NetworkImage('https://www.shareicon.net/data/512x512/2016/05/24/770137_man_512x512.png')

                                ),
                              ),
                              const CircleAvatar(
                                backgroundColor: Colors.black,
                                radius: 9,
                              ),
                              const CircleAvatar(
                                backgroundColor: Colors.green,
                                radius: 8,
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 8.0,
                          ),
                          const Text(
                            'Haytham Assem',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 8.0,
                    ),
                    Container(
                      width: 70.0,
                      child: Column(
                        children: [
                          Stack(
                            alignment: AlignmentDirectional.bottomEnd,
                            children:  [
                              Container(
                                height: imageSize,
                                width: imageSize,
                                child: const Image(
                                    image: NetworkImage('https://www.shareicon.net/data/512x512/2016/05/24/770137_man_512x512.png')

                                ),
                              ),
                              const CircleAvatar(
                                backgroundColor: Colors.black,
                                radius: 9,
                              ),
                              const CircleAvatar(
                                backgroundColor: Colors.green,
                                radius: 8,
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 8.0,
                          ),
                          const Text(
                            'Haytham Assem',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 8.0,
                    ),
                    Container(
                      width: 70.0,
                      child: Column(
                        children: [
                          Stack(
                            alignment: AlignmentDirectional.bottomEnd,
                            children:  [
                              Container(
                                height: imageSize,
                                width: imageSize,
                                child: const Image(
                                    image: NetworkImage('https://www.shareicon.net/data/512x512/2016/05/24/770137_man_512x512.png')

                                ),
                              ),
                              const CircleAvatar(
                                backgroundColor: Colors.black,
                                radius: 9,
                              ),
                              const CircleAvatar(
                                backgroundColor: Colors.green,
                                radius: 8,
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 8.0,
                          ),
                          const Text(
                            'Haytham Assem',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 8.0,
                    ),
                    Container(
                      width: 70.0,
                      child: Column(
                        children: [
                          Stack(
                            alignment: AlignmentDirectional.bottomEnd,
                            children:  [
                              Container(
                                height: imageSize,
                                width: imageSize,
                                child: const Image(
                                    image: NetworkImage('https://www.shareicon.net/data/512x512/2016/05/24/770137_man_512x512.png')

                                ),
                              ),
                              const CircleAvatar(
                                backgroundColor: Colors.black,
                                radius: 9,
                              ),
                              const CircleAvatar(
                                backgroundColor: Colors.green,
                                radius: 8,
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 8.0,
                          ),
                          const Text(
                            'Haytham Assem',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                children: [
                  Stack(
                    alignment: AlignmentDirectional.bottomEnd,
                    children:  [
                      Container(
                        height: imageSize,
                        width: imageSize,
                        child: const Image(
                            image: NetworkImage('https://www.shareicon.net/data/512x512/2016/05/24/770137_man_512x512.png')

                        ),
                      ),
                      const CircleAvatar(
                        backgroundColor: Colors.black,
                        radius: 9,
                      ),
                      const CircleAvatar(
                        backgroundColor: Colors.green,
                        radius: 8,
                      )
                    ],
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:  [
                      const Text(
                        'Haytham Assem Mohamed Ahmed Abdelmagid Khalaf',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Row(
                          children: const [
                            Expanded(
                              child: Text(
                                'Hi Ahmed How Are you are you good, I will come to take you to see my father I hope you well',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12.0
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Text(
                              ' . ',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            Text(
                              '11:48 am',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 16.0
              ),
              Row(
                children: [
                  Stack(
                    alignment: AlignmentDirectional.bottomEnd,
                    children:  [
                      Stack(
                        alignment: AlignmentDirectional.center,
                        children: [
                          Container(
                              height: 67,
                              width: 67,
                              child: const CircleAvatar(
                                  backgroundColor: Colors.blue
                              )
                          ),
                          Container(
                            height: imageSize,
                            width: imageSize,
                            child: const Image(
                                image: NetworkImage('https://www.shareicon.net/data/512x512/2016/05/24/770137_man_512x512.png')

                            ),
                          ),
                        ],
                      ),
                      const CircleAvatar(
                        backgroundColor: Colors.black,
                        radius: 9,
                      ),
                      const CircleAvatar(
                        backgroundColor: Colors.green,
                        radius: 8,
                      )
                    ],
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  [
                      const Text(
                        'Haytham Assem',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      Row(
                        children: const [
                          Text(
                            'Hi Ahmed',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          Text(
                            ' . ',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          Text(
                            '11:48 am',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(
                  height: 16.0
              ),
              Row(
                children: [
                  Stack(
                    alignment: AlignmentDirectional.bottomEnd,
                    children:  [
                      Container(
                        height: imageSize,
                        width: imageSize,
                        child: const Image(
                            image: NetworkImage('https://www.shareicon.net/data/512x512/2016/05/24/770137_man_512x512.png')

                        ),
                      ),
                      const CircleAvatar(
                        backgroundColor: Colors.black,
                        radius: 9,
                      ),
                      const CircleAvatar(
                        backgroundColor: Colors.green,
                        radius: 8,
                      )
                    ],
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  [
                      const Text(
                        'Haytham Assem',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      Row(
                        children: const [
                          Text(
                            'Hi Ahmed',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          Text(
                            ' . ',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          Text(
                            '11:48 am',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(
                  height: 16.0
              ),
              Row(
                children: [
                  Stack(
                    alignment: AlignmentDirectional.bottomEnd,
                    children:  [
                      Container(
                        height: imageSize,
                        width: imageSize,
                        child: const Image(
                            image: NetworkImage('https://www.shareicon.net/data/512x512/2016/05/24/770137_man_512x512.png')

                        ),
                      ),
                      const CircleAvatar(
                        backgroundColor: Colors.black,
                        radius: 9,
                      ),
                      const CircleAvatar(
                        backgroundColor: Colors.green,
                        radius: 8,
                      )
                    ],
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  [
                      const Text(
                        'Haytham Assem',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      Row(
                        children: const [
                          Text(
                            'Hi Ahmed',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          Text(
                            ' . ',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          Text(
                            '11:48 am',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(
                  height: 16.0
              ),
              Row(
                children: [
                  Stack(
                    alignment: AlignmentDirectional.bottomEnd,
                    children:  [
                      Container(
                        height: imageSize,
                        width: imageSize,
                        child: const Image(
                            image: NetworkImage('https://www.shareicon.net/data/512x512/2016/05/24/770137_man_512x512.png')

                        ),
                      ),
                      const CircleAvatar(
                        backgroundColor: Colors.black,
                        radius: 9,
                      ),
                      const CircleAvatar(
                        backgroundColor: Colors.green,
                        radius: 8,
                      )
                    ],
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  [
                      const Text(
                        'Haytham Assem',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      Row(
                        children: const [
                          Text(
                            'Hi Ahmed',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          Text(
                            ' . ',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          Text(
                            '11:48 am',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(
                  height: 16.0
              ),
              Row(
                children: [
                  Stack(
                    alignment: AlignmentDirectional.bottomEnd,
                    children:  [
                      Container(
                        height: imageSize,
                        width: imageSize,
                        child: const Image(
                            image: NetworkImage('https://www.shareicon.net/data/512x512/2016/05/24/770137_man_512x512.png')

                        ),
                      ),
                      const CircleAvatar(
                        backgroundColor: Colors.black,
                        radius: 9,
                      ),
                      const CircleAvatar(
                        backgroundColor: Colors.green,
                        radius: 8,
                      )
                    ],
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  [
                      const Text(
                        'Haytham Assem',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      Row(
                        children: const [
                          Text(
                            'Hi Ahmed',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          Text(
                            ' . ',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          Text(
                            '11:48 am',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(
                  height: 16.0
              ),
              Row(
                children: [
                  Stack(
                    alignment: AlignmentDirectional.bottomEnd,
                    children:  [
                      Container(
                        height: imageSize,
                        width: imageSize,
                        child: const Image(
                            image: NetworkImage('https://www.shareicon.net/data/512x512/2016/05/24/770137_man_512x512.png')

                        ),
                      ),
                      const CircleAvatar(
                        backgroundColor: Colors.black,
                        radius: 9,
                      ),
                      const CircleAvatar(
                        backgroundColor: Colors.green,
                        radius: 8,
                      )
                    ],
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  [
                      const Text(
                        'Haytham Assem',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      Row(
                        children: const [
                          Text(
                            'Hi Ahmed',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          Text(
                            ' . ',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          Text(
                            '11:48 am',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(
                  height: 16.0
              ),
              Row(
                children: [
                  Stack(
                    alignment: AlignmentDirectional.bottomEnd,
                    children:  [
                      Container(
                        height: imageSize,
                        width: imageSize,
                        child: const Image(
                            image: NetworkImage('https://www.shareicon.net/data/512x512/2016/05/24/770137_man_512x512.png')

                        ),
                      ),
                      const CircleAvatar(
                        backgroundColor: Colors.black,
                        radius: 9,
                      ),
                      const CircleAvatar(
                        backgroundColor: Colors.green,
                        radius: 8,
                      )
                    ],
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  [
                      const Text(
                        'Haytham Assem',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      Row(
                        children: const [
                          Text(
                            'Hi Ahmed',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          Text(
                            ' . ',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          Text(
                            '11:48 am',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(
                  height: 16.0
              ),
              Row(
                children: [
                  Stack(
                    alignment: AlignmentDirectional.bottomEnd,
                    children:  [
                      Container(
                        height: imageSize,
                        width: imageSize,
                        child: const Image(
                            image: NetworkImage('https://www.shareicon.net/data/512x512/2016/05/24/770137_man_512x512.png')

                        ),
                      ),
                      const CircleAvatar(
                        backgroundColor: Colors.black,
                        radius: 9,
                      ),
                      const CircleAvatar(
                        backgroundColor: Colors.green,
                        radius: 8,
                      )
                    ],
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  [
                      const Text(
                        'Haytham Assem',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      Row(
                        children: const [
                          Text(
                            'Hi Ahmed',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          Text(
                            ' . ',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          Text(
                            '11:48 am',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

}