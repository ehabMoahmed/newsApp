import 'package:flutter/material.dart';
 import 'package:newsapp/Shared/api/api_manager.dart';

import '../../../Model/category-model.dart';
import '../../../Model/source-widget.dart';
import '../../../Model/sourceResponse/Sources.dart';
import 'news_list_widget.dart';

class CategoryDetails extends StatefulWidget {
  CategoryModel category;
  CategoryDetails({required this.category});
  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
int selectedSource=0;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future:  ApiManager.getsources( widget.category.id),
        builder: (context, snapshot) {
          if(snapshot.connectionState==ConnectionState.waiting){
            return Center(child: CircularProgressIndicator());
          }
          if(snapshot.hasError || snapshot.data?.status=="error"){
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                Text(snapshot.data?.message??snapshot.error.toString()),
                ElevatedButton(onPressed:  (){
                  setState(() {

                  });
                }, child: Text("Try Again")),
              ],
            );
          }
          var sources=snapshot.data?.sources??[];
          return DefaultTabController(
            length: sources.length,
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
                        source:source ,
                        isSelected: selectedSource== sources.indexOf(source)?true:false,

                      )).toList()
                  ),
                  NewsListWidget(source: sources[selectedSource],),

                ],
              ),
            ),


          );
        }, );
  }
}
/*
DefaultTabController(
length: SourceModel.sources.length,
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
tabs: SourceModel.sources.map((source) =>  SourceWidget(
source:source,
isSelected: selectedSource==SourceModel.sources.indexOf(source)?true:false,

)).toList()
),
NewsListWidget(),

],
),
),


);*/
