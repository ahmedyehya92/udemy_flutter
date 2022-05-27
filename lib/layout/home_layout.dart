import 'dart:ffi';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';
import 'package:udemy_flutter/layout/cubit/cubit.dart';
import 'package:udemy_flutter/layout/cubit/states.dart';
import 'package:udemy_flutter/modules/new_tasks/new_tasks_screen.dart';

import '../modules/archived_tasks/archived_tasks_screen.dart';
import '../modules/done_tasks/done_tasks_screen.dart';
import '../shared/components/components.dart';
import '../shared/components/conestants.dart';

class HomeLayout extends StatelessWidget {
  late Database database;
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();
  var titleController = TextEditingController();
  var timeController = TextEditingController();
  var dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => HomeCubit()..createDatabase(context),
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {
    },
        builder: (context, state){
          return Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              title: Text(HomeCubit.get(context).titles[HomeCubit.get(context).currentTabIndex]),
            ),
            body: ConditionalBuilder(
              condition: true,
              builder: (context) => HomeCubit.get(context).screens[HomeCubit.get(context).currentTabIndex],
              fallback: (context) => Center(child: CircularProgressIndicator()),
            ),
            floatingActionButton: FloatingActionButton(

              onPressed: () async
              {
                // show bottom sheet

                if(HomeCubit.get(context).isBottomSheetShown)
                {
                  if(formKey.currentState?.validate() == true) {
                    HomeCubit.get(context).insertDatabase(titleController.text, dateController.text, timeController.text);
                    Navigator.pop(context);
                    HomeCubit.get(context).changeBottomSheetState(true);
                    /*HomeCubit.get(context).insertDatabase(titleController.text, dateController.text, timeController.text).then((value) {
                      Navigator.pop(context);
                      HomeCubit.get(context).changeBottomSheetState(true);
                      /*setState(() {
                        fabIcon = Icons.edit;
                      });*/
                    });*/
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
                  ).closed.then((value) {
                    HomeCubit.get(context).changeBottomSheetState(true);
                    /*setState(() {
                      fabIcon = Icons.edit;
                    });*/
                  });
                  HomeCubit.get(context).changeBottomSheetState(false);
                  /*setState(() {
                    fabIcon = Icons.add;
                  });*/
                }
              },
              child: Icon(HomeCubit.get(context).fabIcon),
            ),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: HomeCubit.get(context).currentTabIndex,
              onTap: (index){
                HomeCubit.get(context).changeNavBarCurrentScreen(index);
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
    )
    );
  }

  // TODO async & await
  // background task
  Future<String> getName() async
  {
    return 'Ahmed';
  }
}

