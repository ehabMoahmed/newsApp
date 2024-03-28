import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../Model/articleResponse/NewsResponse.dart';
import '../../Model/sourceResponse/SourceResponse.dart';
class ApiManager {
  static const String baseUrl = "newsapi.org";
  static const String ApiSources = "/v2/top-headlines/sources";
  static const String ApiKey = "e02af022aefe4b13ab04dde3f098b717";

//https://newsapi.org/v2/top-headlines/sources?apiKey=e02af022aefe4b13ab04dde3f098b717&category=business
  static Future<SourceResponse> getsources(String categoryID) async {
    var url = Uri.https(baseUrl, ApiSources, {
      "apiKey": ApiKey,
      "category": categoryID
    });
    var response = await http.get(url);
    var json = jsonDecode(response.body);
    SourceResponse sourceResponse = SourceResponse.fromJson(json);
    return sourceResponse;
  }

  //https://newsapi.org/v2/everything?q=bitcoin&apiKey=e02af022aefe4b13ab04dde3f098b717&sources=ars-technica
  static Future<NewsResponse> GetArticle(String sourcesID) async {
    var url = Uri.https(baseUrl, "/v2/everything", {
      "apiKey": ApiKey,
      "sourcesID": sourcesID
    });
    var response = await http.get(url);
    var json = jsonDecode(response.body);
    NewsResponse newsResponse = NewsResponse.fromJson(json);
    return newsResponse;
  }
}