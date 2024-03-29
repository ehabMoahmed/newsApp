import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/Model/articleResponse/Articles.dart';
import 'package:url_launcher/url_launcher.dart';

class Articlee extends StatelessWidget {
  static const String routeName = "Articlee";

  // Article? article;
//Articlee({  this.article});

  @override
  Widget build(BuildContext context) {
    Article article =
    ModalRoute
        .of(context)
        ?.settings
        .arguments as Article;
    final Uri _url = Uri.parse( article.url.toString());

    return Container(
      color: Colors.white,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(article.title ?? ""),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 25),
          child: Column(
            children: [
              //clipRoundedRectangle
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child:

                CachedNetworkImage(
                  imageUrl: article.urlToImage ?? " ",
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      CircularProgressIndicator(
                          value: downloadProgress.progress),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),),
              Text(article.source?.name ?? "",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300)),
              Text(article.title ?? ""),
              Align(
                  alignment: Alignment.centerRight,
                  child: Text(article?.publishedAt ?? "", style: TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w300))),
              SizedBox(height: 35,),
              Expanded(child: Text(""" ${article.content}""",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300))),

              Padding(
                padding: const EdgeInsets.only(bottom: 40, right: 20),
                child: GestureDetector(
                  onTap: () {
                    _launchUrl(_url);
                  },
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                            child: Text("view Full Article",
                              style: TextStyle(fontWeight: FontWeight.bold),)
                        ),
                        Icon(Icons.arrow_right),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _launchUrl(Uri _url) async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}
