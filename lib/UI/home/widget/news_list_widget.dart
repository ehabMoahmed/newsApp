import 'package:flutter/material.dart';
import 'package:newsapp/Model/category-model.dart';
 import 'package:newsapp/Shared/api/api_manager.dart';
import 'package:provider/provider.dart';

import '../../../Model/sourceResponse/Source.dart';
import '../view_Model/news_view_model.dart';
import 'news_item.dart';

class NewsListWidget extends StatefulWidget {
final Source source; //bykhle fe al runtime const y3ny b3d create al obj
NewsListWidget({ required this.source});

  @override
  State<NewsListWidget> createState() => _NewsListWidgetState();

}
var viewModel=NewsViewModel();

class _NewsListWidgetState extends State<NewsListWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getNews(widget.source.id??"");
  }
  @override
  void didUpdateWidget(covariant NewsListWidget oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    viewModel.getNews(widget.source.id??"");

  }
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create:(context) =>viewModel ,
    child: Consumer<NewsViewModel>(
      builder: (context,NewsViewModel value,Widget? child) {
       if(viewModel.isLoading){
         return Center(child: CircularProgressIndicator(),);
       }
       else if(viewModel.errorMessage != null){
         return  Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             Text( viewModel.errorMessage??""),
             ElevatedButton(onPressed: (){
               setState(() {
                 viewModel.getNews(widget.source.id??"");

               });
             },
                 child: Text("Try again") )
           ],
         );
       }

       var newslist= viewModel.Articles??[];
       return Expanded(
         child: ListView.separated(
           separatorBuilder: (context, index) => SizedBox(height: 20,),
           itemBuilder:  (context, index) => NewsItem(
             article: newslist[index],
           ),
           itemCount:   newslist .length,
         ),
       );

    },),
    );
  }
}
/*
* FutureBuilder(
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
        * */