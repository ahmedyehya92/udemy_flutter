import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/models/shop_app/login_model.dart';

import '../../../../shared/network/remote/dio_helper.dart';
import 'login_states.dart';

class ShopLoginCubit extends Cubit<ShopLoginState> {
  final DioHelper dioHelper = DioHelper();

  ShopLoginCubit() : super(ShopLoginInitialState());

  static ShopLoginCubit get(context) => BlocProvider.of(context);

  var isPasswordVisible = false;

  void userLogin({required String email, required String password}) {
    emit(ShopLoginLoadingState());
    dioHelper.shoppingLogin(email: email, password: password)?.then((value) {
      ShopLoginModel shopLoginModel = ShopLoginModel.fromJson(value?.data);
      if (shopLoginModel.status == true) {
        emit(ShopLoginSuccessState(shopLoginModel));
      } else {
        emit(ShopLoginFailureState(shopLoginModel.message ??
            'Wrong error from server or integration'));
      }
    }).catchError((error) {
      emit(ShopLoginFailureState(error.toString()));
    });
  }

  void passwordVisible() {
    isPasswordVisible = !isPasswordVisible;
    emit(ShopLoginChangePasswordVisibility());
  }
}
