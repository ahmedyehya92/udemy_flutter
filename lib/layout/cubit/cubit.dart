import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:udemy_flutter/layout/cubit/states.dart';
import 'package:udemy_flutter/modules/archived_tasks/archived_tasks_screen.dart';

import '../../modules/done_tasks/done_tasks_screen.dart';
import '../../modules/new_tasks/new_tasks_screen.dart';

class HomeCubit extends Cubit<HomeStates>{
  HomeCubit () : super(HomeInitialState()) {
    emit(HomeInitialState());
  }

  static HomeCubit get(context) => BlocProvider.of(context);
  int currentTabIndex = 0;
  List<Widget> screens = [NewTasksScreen(), DoneTasksScreen(), ArchivedTasksScreen()];
  List<String> titles = ['Tasks', 'Done Tasks', 'Archived Tasks'];
  List<Map> tasks = [];
  late Database database;
  var isBottomSheetShown = false;
  IconData fabIcon = Icons.edit;

  void changeNavBarCurrentScreen(int index) {
    currentTabIndex = index;
    emit(ChangeNavBarState());
  }

  void changeBottomSheetState(bool isShown){
    isBottomSheetShown = !isShown;
    if(isShown)
      {
        fabIcon = Icons.edit;
      }
    else {
      fabIcon = Icons.add;
    }
    emit(HomeNewTaskBottomSheetChangeShownState());
  }

  void createDatabase(context)  {
    openDatabase(
      'todo.db',
      version: 1,
      onCreate: (database, version) {
        print('database created');
         database.execute(''
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
        print('database open');
      },
    ).then((value) {
      database = value;
      emit(CreateDatabaseState());
      getTasksFromDatabase();
    });
  }

  insertDatabase(String title, String date, String time) {
     database.transaction((txn) {
      return  txn.rawInsert(
          'INSERT INTO tasks ''(title, date, time, status) '
              'VALUES("$title", "$date", "$time", "new")')
          .then((value) { // value is inserted item id
        print('$value inserted success');
        emit(InsertDatabaseState());
        getTasksFromDatabase();
      }).catchError((error){
        print("Error When inserting new record ${error.toString()}");
      });
    }
    );
  }

  getTasksFromDatabase() {
    emit(LoadingTasksState());
    database.rawQuery('SELECT * FROM tasks').then((value)  {
      tasks = value;
      emit(GetDatabaseState());
    });
  }

}