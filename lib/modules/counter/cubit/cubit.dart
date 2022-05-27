

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/modules/counter/cubit/states.dart';

class CounterCubit extends Cubit<CounterStates> {
  CounterCubit() : super(CounterInitialState());

  static CounterCubit get(context) => BlocProvider.of(context);

  int count = 1;

  void minus(){
    count--;
    emit(CounterMinusState(count));
  }

  void plus(){
    count++;
    emit(CounterPlusState(count));
  }
}