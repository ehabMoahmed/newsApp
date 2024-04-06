
import 'package:newsapp/data_layer/Model/newsResponse/Articles.dart';

import '../Model/sourceResponse/Source.dart';
import '../datasource_contract/newsdatasource.dart';

class NewscacheDataSourceImpl extends NewsDataSource{
  @override
  Future<List<Source>> getSources(String categoryId) {
    // TODO: implement getSources
    throw UnimplementedError();
  }

  @override
  Future<List<Article>> getNews(String sourceId) {
    // TODO: implement getNews
    throw UnimplementedError();
  }

}