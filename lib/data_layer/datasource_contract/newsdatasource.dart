import '../Model/newsResponse/Articles.dart';
import '../Model/sourceResponse/Source.dart';

abstract class NewsDataSource{
  Future<List<Source>>getSources(String categoryId);
  Future<List<Article>>getNews(String sourceId);
}