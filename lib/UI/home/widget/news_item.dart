import 'package:flutter/material.dart';
import 'package:newsapp/Model/newsmodel.dart';

class NewsItem extends StatelessWidget {
  Newsmodel article;
  NewsItem({required this.article});

  @override
  Widget build(BuildContext context) {
    var height =MediaQuery.of(context).size.height;
    return   Column(
      children: [
        //clipRoundedRectangle
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
            child:
            Image.asset( article.imagePath,height: height*0.25,width: double.infinity,fit: BoxFit.cover,)),
        Text(article.sourcename),
        Text(article.title),
        Align(
          alignment: Alignment.centerRight,
            child: Text(article.date, )),
      ],
    );
  }
}
