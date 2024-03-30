import 'package:flutter/material.dart';

import '../../../Model/newsResponse/Articles.dart';
import '../../../Model/newsResponse/NewsResponse.dart';
import '../../../Shared/api/api_manager.dart';
class NewsViewModel extends ChangeNotifier{
  bool isLoading=false;
  String? errorMessage;
  List <Article>Articles=[];

  void getNews(String sourceID)async{
    isLoading=true;
    notifyListeners();
    try{
      var response=await ApiManager.getNews( sourceID);
    isLoading=false;
    if(response.status=="error"){
      errorMessage=response.message;
    }else {
      Articles=response.articles??[];
    }
      notifyListeners();


    }catch(e){
      isLoading=false;
      errorMessage=e.toString();
      notifyListeners();
    }

  }
}