import 'package:flutter/material.dart';
 import 'package:newsapp/Shared/api/api_manager.dart';

import '../../../Model/sourceResponse/Sources.dart';
import 'news_item.dart';

class NewsListWidget extends StatefulWidget {
  Source source;
  NewsListWidget({required this.source});

  @override
  State<NewsListWidget> createState() => _NewsListWidgetState();
}

class _NewsListWidgetState extends State<NewsListWidget> {
  @override
  Widget build(BuildContext context) {
    return  FutureBuilder(
      future: ApiManager.GetArticle(widget.source.id??""),
        builder:  (context, snapshot) {
        if(snapshot.connectionState==ConnectionState.waiting){
          return Center(child: CircularProgressIndicator());
        }
        if(snapshot.hasError || snapshot.data?.status=="error"){
          return  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(snapshot.data?.message??snapshot.error.toString()),
              ElevatedButton(onPressed: (){
                setState(() {

                });
              },
                  child: Text("Try again") )
            ],
          );
        }
          var articles=snapshot.data?.articles??[];
          return Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => SizedBox(height: 20,),
              itemBuilder:  (context, index) => NewsItem(
                article: articles[index],
              ),
              itemCount: articles.length,
            ),
          );
        },);
  }
}
/*Expanded(
      child: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(height: 20,),
          itemBuilder:  (context, index) => NewsItem(
            article: Newsmodel.newLists[index],
          ),
        itemCount: Newsmodel.newLists.length,
      ),
    );*/