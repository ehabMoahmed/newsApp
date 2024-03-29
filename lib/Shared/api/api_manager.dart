import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../Model/articleResponse/NewsResponse.dart';
import '../../Model/sourceResponse/SourceResponse.dart';
class ApiManager {
  static const String baseUrl = "newsapi.org";
  static const String ApiSources = "/v2/top-headlines/sources";
  //apiali  d3e16e322c2e4c00b4b4f4967c290a7f
  //apibta3e  e02af022aefe4b13ab04dde3f098b717
  static const String ApiKey = "d3e16e322c2e4c00b4b4f4967c290a7f";

//https://newsapi.org/v2/top-headlines/sources?apiKey=e02af022aefe4b13ab04dde3f098b717&category=business&language=en
  static Future<SourceResponse> getsources(String categoryID ) async {
    var url = Uri.https(baseUrl, ApiSources, {
      "apiKey": ApiKey,
      "category": categoryID,

    });
    var response = await http.get(url);
    var json = jsonDecode(response.body);
    SourceResponse sourceResponse = SourceResponse.fromJson(json);
    return sourceResponse;
  }

  //https://newsapi.org/v2/everything?apiKey=02af022aefe4b13ab04dde3f098b717&sources
  //https://newsapi.org/v2/everything?q=bitcoin&apiKey=02af022aefe4b13ab04dde3f098b717&sources
  static Future<NewsResponse> GetArticle(String sourcesID,String searchtext) async {
    var url = Uri.https(baseUrl, "/v2/everything", {
      "apiKey": ApiKey,
      "sources": sourcesID,
      "q":searchtext,

    });
    var response = await http.get(url);
    var json = jsonDecode(response.body);
    NewsResponse newsResponse = NewsResponse.fromJson(json);
    return newsResponse;
  }
import 'package:newsapp/Model/sourceResponse/SourceResponse.dart';

import '../../Model/newsResponse/NewsResponse.dart';
class ApiManager{
static const String baseUrl="newsapi.org"; //domain
static const String endpoint="/v2/top-headlines/sources"; //api
static const String apiKey="e02af022aefe4b13ab04dde3f098b717"; //parameter

  //awl haga 3ayz agebha api al sources
 static Future<SourceResponse> getSources(String categoryId) async {
    //https://newsapi.org/v2/top-headlines/sources?apiKey=e02af022aefe4b13ab04dde3f098b717&category=sports
    var url=Uri.https(baseUrl,"/v2/top-headlines/sources",{
      "apiKey":apiKey,
      "category": categoryId //3shan ttghyr 3ala hsb dost 3ala eh
    });
    //feha uri.parse momkn takhodha copy mn fo2 aw t3ml zy mana 3mlt + header bs ana m3ndesh header
    var response =await http.get(url);
    //response.body -> json ->object
   var json = jsonDecode(response.body );//btakhdo al string t7wlo le json
   SourceResponse sourceResponse = SourceResponse.fromJson(json);//btakhdo al json t7wlo le obj
   return sourceResponse;

  }
//https://newsapi.org/v2/everything?apiKey=e02af022aefe4b13ab04dde3f098b717&sources=business-insider
  static Future<NewsResponse> getNews(String sourceID)async{

   var url=Uri.https(baseUrl,"/v2/everything",{
     "apiKey":apiKey,
     "sources":sourceID
   });
   var response= await http.get(url);
   var json =jsonDecode(response.body);
   NewsResponse newsResponse=NewsResponse.fromJson(json);
   return newsResponse;
  }

}