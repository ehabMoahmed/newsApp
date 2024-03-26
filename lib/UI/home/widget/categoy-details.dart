import 'package:flutter/material.dart';
import 'package:newsapp/Model/source_model.dart';

import '../../../Model/source-widget.dart';
import 'news_list_widget.dart';

class CategoryDetails extends StatefulWidget {
  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
int selectedSource=0;

  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
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


    );
  }
}
