import 'package:flutter/material.dart';
 import 'package:newsapp/Shared/api/api_manager.dart';
 import '../../category_details/news_list_widget.dart';
import '../../category_details/source-widget.dart';

class CategoryDetails extends StatefulWidget {
  CategoryModel categoryModel;
  CategoryDetails({ required this.categoryModel});
  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
int selectedSource=0;

  @override
  Widget build(BuildContext context) {
    //widget bthandle al future
    return  FutureBuilder(
        future:  ApiManager.getSources(widget.categoryModel.id),
        builder:(context, snapshot) {
          if(snapshot.connectionState==ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(),);
          }else if(snapshot.hasError || snapshot.data?.status=="error"){
            return Column(
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
          var sources=snapshot.data?.sources??[];
          return DefaultTabController(
            length:  sources.length,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TabBar(
                      onTap: (index){
                        selectedSource=index;
                        setState(() {

                        });
                      },
                      indicatorColor: Colors.transparent,
                      dividerColor: Colors.transparent,
                      isScrollable: true,
                      tabs:  sources.map((source) =>  SourceWidget(
                        source:source,
                        isSelected: selectedSource== sources.indexOf(source)?true:false,

                      )).toList()
                  ),
                  NewsListWidget(source:sources[selectedSource] ),

                ],
              ),
            ),


          );
        },  );
  }
}
