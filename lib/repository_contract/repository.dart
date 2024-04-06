//interface:abstract class with abstract function

import '../data_layer/Model/newsResponse/Articles.dart';
import '../data_layer/Model/sourceResponse/Source.dart';

abstract class NewsRepository{
  //awl func htgeb al data
  Future<List<Source>>getSources(String categoryId);
  Future<List<Article>>getNews(String SourceId);
}
