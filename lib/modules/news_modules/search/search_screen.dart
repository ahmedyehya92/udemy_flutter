import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/shared/components/components.dart';

import '../../../layout/news/cubit/news_cubit.dart';
import '../../../layout/news/cubit/news_states.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);

  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Search'),
              titleSpacing: 16.0,
            ),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: defaultTextFormField(
                      labelText: 'Search',
                      textController: searchController,
                      icon: const Icon(Icons.search),
                      validator: (String? value) {
                        if (value == null || value.isEmpty == true) {
                          return 'Search must not be empty';
                        }
                      },
                      onChanged: (String? value) {
                        if (value != null && value.isEmpty == false) {
                          NewsCubit.get(context).searchNews(value);
                        }
                      }),
                ),
                Expanded(
                    child: state is SearchNewsSuccessState
                        ? ListView.separated(
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (context, index) => buildNewsItem(
                                text: NewsCubit.get(context)
                                    .searchResultNews[index]['title'],
                                imgUrl: NewsCubit.get(context)
                                    .searchResultNews[index]['urlToImage'],
                                context: context,
                                newsUrl: NewsCubit.get(context)
                                        .searchResultNews[index]['url'] ??
                                    ''),
                            itemCount:
                                NewsCubit.get(context).searchResultNews.length,
                            separatorBuilder: (context, item) =>
                                const SizedBox(height: 10.0),
                          )
                        : state is SearchNewsFailureState
                            ? errorView(Icons.business_center, (state).error)
                            : state is SearchNewsLoadingState
                                ? const Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : Center())
              ],
            ),
          );
        });
  }
}
