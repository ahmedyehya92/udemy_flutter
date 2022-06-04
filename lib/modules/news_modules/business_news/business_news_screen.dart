import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/shared/components/components.dart';

import '../../../layout/news/cubit/news_cubit.dart';
import '../../../layout/news/cubit/news_states.dart';

class BusinessNewsScreen extends StatelessWidget {
  const BusinessNewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => NewsCubit()..getBusinessNews(),
        child: BlocConsumer<NewsCubit, NewsState>(
            listener: (context, state) {},
            builder: (context, state) {
          switch(state.runtimeType) {
            case GetBusinessNewsLoadingState : return const Center(child: CircularProgressIndicator(),);
            case GetBusinessNewsFailureState : return errorView(Icons.business_center, (state as GetBusinessNewsFailureState).error);
          }
          return Scaffold(
            body: ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => buildNewsItem(
                  text: NewsCubit.get(context).businessNews[index]['title'],
                    imgUrl: NewsCubit.get(context).businessNews[index]
                        ['urlToImage'],
                    context: context,
                    newsUrl: NewsCubit.get(context).businessNews[index]['url']),
              itemCount: NewsCubit.get(context).businessNews.length,
              separatorBuilder: (context, item) => const SizedBox(height:10.0),
            )
          );
        })
    );
    return const Text('Business');
  }
}
