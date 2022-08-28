import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/layout/shop_app/cubit.dart';
import 'package:udemy_flutter/layout/shop_app/states.dart';
import 'package:udemy_flutter/shared/network/local/cache_helper.dart';

import '../../shared/components/conestants.dart';


class ShopLayout extends StatelessWidget {
  const ShopLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
        listener: (context, state) {},
        builder: (context, state) {

          var cubit = ShopCubit.get(context);

          return Scaffold(
            appBar: AppBar(
              title: Text('Salla'),
            ),
              body: cubit.bottomNavScreens[cubit.currentIndex],
              bottomNavigationBar: BottomNavigationBar(
                onTap: (index){
                  cubit.changeBottom(index);
                },
                  currentIndex: cubit.currentIndex,
                  items: const [
                    BottomNavigationBarItem(
                        icon: Icon(Icons.home),
                        label: 'Home'
                    ),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.apps),
                        label: 'Category'
                    ),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.favorite),
                        label: 'Favorites'
                    ),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.settings),
                        label: 'Settings'
                    )
              ])
          );
        }
    );
  }
}
