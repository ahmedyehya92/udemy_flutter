import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/modules/begginer_modules/counter/cubit/cubit.dart';
import 'package:udemy_flutter/modules/begginer_modules/counter/cubit/states.dart';

// Stateless contain one class provide widget

// Stateful contain 2 classes
// 1. provide widget
// 2. provide state from this widget
class CounterScreen extends StatelessWidget {
  int counter = 0;

  // call flow
  // 1. constructor
  // 2. init state
  // 3. build

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => CounterCubit(),
      child: BlocConsumer<CounterCubit, CounterStates>(
        listener: (context, state) {
          if(state is CounterPlusState) print('${state.counter}');
          if(state is CounterMinusState) print('${state.counter}');
        } ,
        builder: (context, state){
          return Scaffold(
            appBar: AppBar(
              title: Text('Counter'),
            ),
            body: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(onPressed: () {
                    CounterCubit.get(context).minus();
                  },
                    child: Text(
                        'MINUS'
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal:8.0
                    ),
                    child: Text(
                      '${CounterCubit.get(context).count}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 50.0
                      ),

                    ),
                  ),
                  TextButton(onPressed: () {
                    CounterCubit.get(context).plus();
                  },
                    child: Text(
                        'PLUS'
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}