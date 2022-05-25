import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';
import 'package:udemy_flutter/modules/new_tasks/new_tasks_screen.dart';

import '../modules/archived_tasks/archived_tasks_screen.dart';
import '../modules/done_tasks/done_tasks_screen.dart';
import '../shared/components/components.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  late Database database;
  int currentTabIndex = 0;
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();
  var isBottomSheetShown = false;
  var titleController = TextEditingController();
  var timeController = TextEditingController();
  var dateController = TextEditingController();
  IconData fabIcon = Icons.edit;
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
      key: scaffoldKey,
      appBar: AppBar(
        title: Text(titles[currentTabIndex]),
      ),
      body: screens[currentTabIndex],
      floatingActionButton: FloatingActionButton(

        onPressed: () async
        {
          // show bottom sheet

          if(isBottomSheetShown)
            {
              if(formKey.currentState?.validate() == true) {
                insertDatabase(titleController.text, dateController.text, timeController.text).then((value) {
                  Navigator.pop(context);
                  isBottomSheetShown = false;
                  setState(() {
                    fabIcon = Icons.edit;
                  });
                });
              }
            }
          else {
            scaffoldKey.currentState?.showBottomSheet((context) =>
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(16.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        defaultTextFormField(
                          labelText: 'Title',
                          textController: titleController,
                          inputType: TextInputType.text,
                          validator: (text) {
                            if(text?.isEmpty == true)
                              return 'title must not be empty';
                            return null;
                          },
                          icon: Icon(Icons.title)
                        ),
                        SizedBox(
                          height: 16.0,
                        ),
                        defaultTextFormField(
                            labelText: 'Time',
                            onClick: (){
                              showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.now(),
                              ).then((value) => timeController.text = value?.format(context) ?? '');
                            },
                            textController: timeController,
                            inputType: TextInputType.datetime,
                            validator: (text) {
                              if(text?.isEmpty == true)
                                return 'time must not be empty';
                              return null;
                            },
                            icon: Icon(Icons.access_time)
                        ),
                        SizedBox(
                          height: 16.0,
                        ),
                        defaultTextFormField(
                            labelText: 'Date',
                            onClick: (){
                              showDatePicker(
                                context: context,
                                firstDate: DateTime.now(),
                                initialDate: DateTime.now(),
                                lastDate: DateTime.parse('2023-05-03'),
                              ).then((value) => dateController.text = DateFormat.yMMMEd().format(value!));
                            },
                            textController: dateController,
                            inputType: TextInputType.datetime,
                            validator: (text) {
                              if(text?.isEmpty == true)
                                return 'date must not be empty';
                              return null;
                            },
                            icon: Icon(Icons.date_range)
                        )
                      ],
                    ),
                  ),
                ),
              elevation: 20.0
            );
            isBottomSheetShown = true;
            setState(() {
              fabIcon = Icons.add;
            });
          }

          // to insert dummies data to database
          //insertDatabase();

          /*
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
          */
        },
        child: Icon(fabIcon),
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

  // TODO async & await
  // background task
  Future<String> getName() async
  {
    return 'Ahmed';
  }

  void createDatabase() async {
    database = await openDatabase(
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

  Future insertDatabase(String title, String date, String time) async{
    return await database.transaction((txn) {
      return  txn.rawInsert(
          'INSERT INTO tasks ''(title, date, time, status) '
              'VALUES("$title", "$date", "$time", "new")')
          .then((value) { // value is inserted item id
          print('$value inserted success');
          }).catchError((error){
            print("Error When inserting new record ${error.toString()}");
      });
    }
    );
  }
}

