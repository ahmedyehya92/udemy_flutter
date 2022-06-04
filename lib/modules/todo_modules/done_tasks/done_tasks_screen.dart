import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/layout/todo/cubit/cubit.dart';
import 'package:udemy_flutter/layout/todo/cubit/states.dart';

import '../../../shared/components/components.dart';

class DoneTasksScreen extends StatelessWidget {
  const DoneTasksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {

      },
      builder: (context, state){
        return ConditionalBuilder(
          condition: state is! LoadingTasksState,
          builder: (context)
        {
          if (HomeCubit.get(context).tasks.any((element) => element['status'] == 'done'))
            {
            return ListView.separated(
                itemBuilder: (context, index) =>
                    ConditionalBuilder(
                      condition: HomeCubit
                          .get(context)
                          .tasks[index]['status'] == 'done',
                      builder: (context) =>
                          buildTaskItem(
                              HomeCubit
                                  .get(context)
                                  .tasks[index],
                                  () {
                                HomeCubit.get(context).makeTaskDone(HomeCubit
                                    .get(context)
                                    .tasks[index]['id']);
                                print('done ====>${HomeCubit
                                    .get(context)
                                    .tasks[index]}');
                              },
                                  () {
                                print('archive ====>${HomeCubit
                                    .get(context)
                                    .tasks[index]}');
                              },
                                  () {
                                HomeCubit.get(context).deleteTask(HomeCubit
                                    .get(context)
                                    .tasks[index]['id']);
                                print('delete ====>${HomeCubit
                                    .get(context)
                                    .tasks[index]}');
                              }
                          ),
                      fallback: (context) => Center(),
                    ),
                separatorBuilder: (context, item) =>
                    Container(
                      width: double.infinity,
                      height: 1.0,
                      color: Colors.grey[300],
                    ),
                itemCount: HomeCubit
                    .get(context)
                    .tasks
                    .length);
        }
          else {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.task,
                    size: 50.0,
                    color: Colors.grey,
                  ),
                  Text(
                      'No Done Tasks yet',
                    style: TextStyle(
                      color: Colors.grey
                    ),
                  )
                ],
              ),
            );
          }
            },
          fallback: null
        );
      },
    );
  }
}
