

import 'package:flutter/material.dart';
import 'package:newsapp/UI/home/widget/source-widget.dart';
import 'package:provider/provider.dart';

import '../../../Model/category-model.dart';
import '../view_Model/sources_view_model.dart';
import 'news_list_widget.dart';

class CategoryDetails extends StatefulWidget {
  CategoryModel categoryModel;
  CategoryDetails({ required this.categoryModel});
  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  int selectedSource = 0;
  var viewModel = SourcesViewModel();

  //SourcesViewModel viewModel=Provider.of<SourcesViewModel>(context);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getSources(widget.categoryModel.id);
  }

  @override
  Widget build(BuildContext context) {
    //l2n al provider da tb3 widget wahda bs khle balk
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Consumer<SourcesViewModel>(
        builder: (context, value, child) {
          //b3ml return le al widget ale 3ayz a3rdha
          if (viewModel.isLoading) {
            return Center(child: CircularProgressIndicator(),);
          }
          else if (viewModel.errorMessage != null) {
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(viewModel.errorMessage ?? ""),
                ElevatedButton(onPressed: () {
                  viewModel.getSources(widget.categoryModel.id);

                },
                    child: Text("Try again"))
              ],
            );
          }
          var sources = viewModel.sourceList ?? [];
          return DefaultTabController(
            length: sources.length,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TabBar(
                      onTap: (index) {
                        selectedSource = index;
                        setState(() {

                        });
                      },
                      indicatorColor: Colors.transparent,
                      dividerColor: Colors.transparent,
                      isScrollable: true,
                      tabs: sources.map((source) =>
                          SourceWidget(
                            source: source,
                            isSelected: selectedSource ==
                                sources.indexOf(source) ? true : false,

                          )).toList()
                  ),
                  NewsListWidget(source: sources[selectedSource]),

                ],
              ),
            ),


          );;
        },),
    );
  }
}
/* FutureBuilder(
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
        },  );*/