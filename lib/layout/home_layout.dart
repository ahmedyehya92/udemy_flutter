import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
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
  initState() {
    super.initState();
    createDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titles[currentTabIndex]),
      ),
      body: screens[currentTabIndex],
      floatingActionButton: FloatingActionButton(

        onPressed: () async
        {
          // to wait background task to finish then continue
          getName().then((value) {
            print(value);
            print('osama');
          });

          // to wait background task to finish then continue also catch error if exist
          getName().then((value) {
            print(value);
            print('osama');
            throw('error__');
          }).catchError((error){
            print(error.toString());
          });

          // handling errors
          try {
            var name =  await getName();
            print(name);
            throw('some error');
          } catch(error) {
            print('error ${error.toString()}');
          }
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

// TODO async & await
// background task
Future<String> getName() async
{
  return 'Ahmed';
}

void createDatabase() async {
  var database = await openDatabase(
    'todo.db',
    version: 1,
    onCreate: (database, version) async{
      print('database created');
      await database.execute(''
          'CREATE TABLE tasks '
          '(id INTEGER PRIMARY KEY, '
          'title TEXT, '
          'date TEXT, '
          'time TEXT, '
          'status TEXT)').then((value) {
        print('table created');
      }).catchError((error){
        print('Error when creating table ${error.toString()}');
      });
    },
    onOpen: (database){
      print('database opened');
    },
  );
}
