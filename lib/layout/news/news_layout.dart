import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/layout/news/cubit/news_cubit.dart';
import 'package:udemy_flutter/layout/news/cubit/news_states.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => NewsCubit(),
      child: BlocConsumer<NewsCubit, NewsState> (
        listener: (context, state) {

        },
        builder: (context, state){
          return Scaffold(
            appBar: AppBar(
              title: Text(NewsCubit.get(context).subScreensTitlesList[NewsCubit.get(context).currentBottomNavIndex]),
              actions: [
                IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: (){

                  },
                )
              ],
            ),
            body: NewsCubit.get(context).subScreensList[NewsCubit.get(context).currentBottomNavIndex],
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: NewsCubit.get(context).currentBottomNavIndex,
              onTap: (index){
                NewsCubit.get(context).changeNavBarCurrentScreen(index);
              },
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.business),
                    label: 'Business'
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.sports),
                    label: 'Sports'
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.science),
                    label: 'Since'
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.settings),
                    label: 'Settings'
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
