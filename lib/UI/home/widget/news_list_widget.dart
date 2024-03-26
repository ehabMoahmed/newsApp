import 'package:flutter/material.dart';
import 'package:newsapp/Model/category-model.dart';
 import 'package:newsapp/Shared/api/api_manager.dart';

import '../../../Model/sourceResponse/Source.dart';
import 'news_item.dart';

class NewsListWidget extends StatefulWidget {
final Source source; //bykhle fe al runtime const y3ny b3d create al obj
NewsListWidget({ required this.source});

  @override
  State<NewsListWidget> createState() => _NewsListWidgetState();
}

class _NewsListWidgetState extends State<NewsListWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiManager.getNews(widget.source.id?? ""),
        builder:(context, snapshot) {
          if(snapshot.connectionState==ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(),);
          }else if(snapshot.hasError || snapshot.data?.status=="error"){
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
          var newslist=snapshot.data?.articles??[];
          return Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => SizedBox(height: 20,),
              itemBuilder:  (context, index) => NewsItem(
                article: newslist[index],
              ),
              itemCount:   newslist .length,
            ),
          );
        },  );
  }
}
