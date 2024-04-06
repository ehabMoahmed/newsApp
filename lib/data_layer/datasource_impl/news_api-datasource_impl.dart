 import 'package:newsapp/Shared/api/api_manager.dart';
import 'package:newsapp/data_layer/Model/newsResponse/Articles.dart';

import '../Model/sourceResponse/Source.dart';
import '../datasource_contract/newsdatasource.dart';

class NewsApiDataSourceImpl extends NewsDataSource{
  ApiManager apimanager;
  NewsApiDataSourceImpl(this.apimanager); //constructor injection: 72nto b obj al apiManager y3ny lama class yst5dm obj mn al impl yb3tlo al apimanager wana mlesh da3wa al apiManager 7sl feh tghyer waala aw hslo create ezay

  @override
  //mhtag obj mn al apiMnager 3shan y3ml req
  Future<List<Source>> getSources(String categoryId) async{
   var sourceResponse= await apimanager.getSources(categoryId);
   return sourceResponse.sources??[];
  }

  @override
  Future<List<Article>> getNews(String sourceId)async {
 var response=await apimanager.getNews(sourceId);
 return response.articles??[];
  }

}