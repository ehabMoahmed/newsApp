import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../Model/articleResponse/Articles.dart';
import 'article/article_list.dart';

class NewsItem extends StatelessWidget {
  Article article;
  NewsItem({required this.article});

  @override
  Widget build(BuildContext context) {
    var height =MediaQuery.of(context).size.height;
    return   InkWell(
      onTap: (){
        Navigator.pushNamed(context,  Articlee.routeName,arguments: article);
      },
      child: Column(
        children: [
          //clipRoundedRectangle
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
              child:

          CachedNetworkImage(
            imageUrl:  article.urlToImage??"",
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                CircularProgressIndicator(value: downloadProgress.progress),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),  ),
          Text(article.source?.name??"",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w300)),
          Text(article.title??""),
          Align(
            alignment: Alignment.centerRight,
              child: Text(article.publishedAt??"",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w300) )),

        ],
      ),
    );
  }
}
