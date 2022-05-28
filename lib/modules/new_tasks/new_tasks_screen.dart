import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/layout/todo/cubit/cubit.dart';
import 'package:udemy_flutter/layout/todo/cubit/states.dart';
import 'package:udemy_flutter/shared/components/components.dart';


class NewTasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // when you need to listen just return BlocConsumer do not return BlocProvider again
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {

      },
      builder: (context, state){
        return ConditionalBuilder(
          condition: state is! LoadingTasksState,
          builder: (context) => ListView.separated(
              itemBuilder: (context, index) => ConditionalBuilder(
                condition: HomeCubit.get(context).tasks[index]['status'] == 'new' ,
                builder: (context) => buildTaskItem(
                    HomeCubit.get(context).tasks[index],
                    (){
                      HomeCubit.get(context).makeTaskDone(HomeCubit.get(context).tasks[index]['id']);
                      print('done ====>${HomeCubit.get(context).tasks[index]}');
                    },
                    () {
                      print('archive ====>${HomeCubit.get(context).tasks[index]}');
                    },
                    () {
                      HomeCubit.get(context).deleteTask(HomeCubit.get(context).tasks[index]['id']);
                      print('delete ====>${HomeCubit.get(context).tasks[index]}');
                    }
                ),
                fallback: null,
              ),
              separatorBuilder: (context, item) => Container(
                width: double.infinity,
                height: 1.0,
                color: Colors.grey[300],
              ),
              itemCount: HomeCubit.get(context).tasks.length),
          fallback: (context) => Center(child: CircularProgressIndicator(),),
        );
      },
    );
  }
}
