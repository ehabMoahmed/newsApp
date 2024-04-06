

import 'package:newsapp/data_layer/Model/newsResponse/Articles.dart';

import '../../repository_contract/repository.dart';
import '../Model/sourceResponse/Source.dart';
import '../datasource_contract/newsdatasource.dart';

class NewsRepositoryimpl extends NewsRepository{
  NewsDataSource ApiDataSource;
  NewsRepositoryimpl(this.ApiDataSource);

  @override
  Future<List<Source>> getSources(String categoryId) {
  return ApiDataSource.getSources(categoryId);
  }

  @override
  Future<List<Article>> getNews(String SourceId) {
   return ApiDataSource.getNews(SourceId);
  }
  
}