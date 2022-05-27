import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/layout/cubit/cubit.dart';
import 'package:udemy_flutter/shared/components/components.dart';

import '../../layout/cubit/states.dart';

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
              itemBuilder: (context, index) => buildTaskItem(HomeCubit.get(context).tasks[index]),
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
