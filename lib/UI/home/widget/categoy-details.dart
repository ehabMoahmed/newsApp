import 'package:flutter/material.dart';
 import 'package:newsapp/Shared/api/api_manager.dart';
import 'package:provider/provider.dart';

import '../../../Model/category-model.dart';
import '../../../Model/source-widget.dart';
import '../../../Model/sourceResponse/Sources.dart';
import '../../../Shared/app_colors.dart';
import '../../../Shared/provider/provider.dart';
import 'news_list_widget.dart';

class CategoryDetails extends StatefulWidget {
  static const routeName="CategoryDetails";
  //CategoryModel ?category;
  //CategoryDetails({  this.category});
  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
int selectedSource=0;
bool isSearching=false;

  @override
  Widget build(BuildContext context) {
    CategoryModel category=ModalRoute.of(context)?.settings.arguments as CategoryModel;
    SettingProvider provider = Provider.of<SettingProvider>(context);

    return Container(
      color: Colors.white,
      child: Scaffold(
        appBar: AppBar(

          title:  isSearching?  buildtextfield():Text("News App"),
          actions: [

            !isSearching?IconButton(onPressed: (){
              setState(() {
                isSearching=!isSearching;
              });
            },
                icon:Icon(Icons.search,size: 35,)  ):SizedBox(width: 1,),
            SizedBox(width: 20,),
          ],
        ),
        body: FutureBuilder(
            future:  ApiManager.getsources( category.id),
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
            }, ),
      ),
    );
  }
Widget  buildtextfield() {
  SettingProvider provider = Provider.of<SettingProvider>(context);

  return Container(
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30)
    ),
    child: TextField(
      decoration: InputDecoration(
        hintText: "searching...",
        fillColor: Colors.white,
        border: InputBorder.none,
        prefixIcon: IconButton(onPressed: (){
          setState(() {
            isSearching=false;
          });

        }, icon: Icon(Icons.cancel_rounded),),
        suffixIcon: Icon(Icons.search,color: AppColors.PickCategoryColor),
      ),
      autofocus:  true,
      onSubmitted: (value) {
        // Handle search operation here
      provider.changeController(value);
      },

    ),
  );
}
}
