import 'package:flutter/material.dart';
import 'package:newsapp/Model/newsmodel.dart';

import 'news_item.dart';

class NewsListWidget extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(height: 20,),
          itemBuilder:  (context, index) => NewsItem(
            article: Newsmodel.newLists[index],
          ),
        itemCount: Newsmodel.newLists.length,
      ),
    );
  }
}
