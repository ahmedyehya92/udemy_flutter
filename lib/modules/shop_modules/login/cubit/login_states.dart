import 'package:udemy_flutter/models/shop_app/login_model.dart';

abstract class ShopLoginState {}

class ShopLoginInitialState extends ShopLoginState {}

class ShopLoginLoadingState extends ShopLoginState {}

class ShopLoginSuccessState extends ShopLoginState {
  final ShopLoginModel loginModel;

  ShopLoginSuccessState(this.loginModel);
}

class ShopLoginFailureState extends ShopLoginState {
  final String error;

  ShopLoginFailureState(this.error);
}

class ShopLoginChangePasswordVisibility extends ShopLoginState {}
