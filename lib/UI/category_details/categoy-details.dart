import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
 import 'package:newsapp/Shared/api/api_manager.dart';
import 'package:newsapp/UI/category_details/categoryViewsModel/categoryDetailsViewModel.dart';
import '../../data_layer/Model/category-model.dart';
import 'source-widget.dart';
import 'news_list_widget.dart';

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
    return BlocProvider(
      //wenta b create al obj nade 3ala haga mn al class da
        create:(context) => CategoryDetailsViewModel()..getSources(widget.categoryModel.id),
        //al logic bythandle 3n tre2 BlocBuilder aw fe kza widget
        child: BlocBuilder<CategoryDetailsViewModel,CategoryDetailsState>(
            builder:  (context, state) {
              if(state is CategoryDetailsSuccessState){
                var sources=state .sources??[];
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
              }
              else if(state is CategoryDetailsErrorState){
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text( state.errorMessage),
                    ElevatedButton(onPressed: (){
                      setState(() {

                      });
                    },
                        child: Text("Try again") )
                  ],
                );
              }
              return Center(child: CircularProgressIndicator(),);

            },
        ),
    ) ;
  }
}
/*FutureBuilder(
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
        },  )*/