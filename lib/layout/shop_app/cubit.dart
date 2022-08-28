import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/layout/shop_app/states.dart';
import 'package:udemy_flutter/modules/shop_modules/categories/categories_screen.dart';
import 'package:udemy_flutter/modules/shop_modules/products/products_screen.dart';

import '../../modules/begginer_modules/settings/settings_screen.dart';
import '../../modules/shop_modules/favorites/favorites_screen.dart';

class ShopCubit extends Cubit<ShopStates> {
  ShopCubit(): super(ShopInitialState());

  static ShopCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<Widget> bottomNavScreens = [
    ProductsScreen(),
    CategoriesScreen(),
    FavoritesScreen(),
    SettingsScreen(),
  ];

  void changeBottom(int index)
  {
    currentIndex = index;
    emit(ShopChangeBottomNavState());
  }


}