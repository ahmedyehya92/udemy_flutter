import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:udemy_flutter/modules/new_tasks/new_tasks_screen.dart';

import '../modules/archived_tasks/archived_tasks_screen.dart';
import '../modules/done_tasks/done_tasks_screen.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int currentTabIndex = 0;
  List<Widget> screens = [
    NewTasksScreen(),
    DoneTasksScreen(),
    ArchivedTasksScreen()
  ];
  List<String> titles = [
    'Tasks',
    'Done Tasks',
    'Archived Tasks'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titles[currentTabIndex]),
      ),
      body: screens[currentTabIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: (){

        },
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentTabIndex,
        onTap: (index){
          setState(() {
            currentTabIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'Tasks'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.check_circle_outline),
              label: 'Done'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.archive_outlined),
              label: 'Archived'
          )
        ],
      ),
    );
  }
}
