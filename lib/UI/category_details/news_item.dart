import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../data_layer/Model/newsResponse/Articles.dart';

class NewsItem extends StatelessWidget {
   Article article;
  NewsItem({required this.article});

  @override
  Widget build(BuildContext context) {
    var height =MediaQuery.of(context).size.height;
    return   Column(
      children: [
        //clipRoundedRectangle
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
            child: CachedNetworkImage(
    imageUrl: article. urlToImage??"",
    progressIndicatorBuilder: (context, url, downloadProgress) =>
    Center(child: CircularProgressIndicator(value: downloadProgress.progress)),
    errorWidget: (context, url, error) => Icon(Icons.error),
    ),),
        Text(article.source?.name??""),
        Text(article.title??""),
        Align(
          alignment: Alignment.centerRight,
            child: Text(article.publishedAt??"" , )),
      ],
    );
  }
}
