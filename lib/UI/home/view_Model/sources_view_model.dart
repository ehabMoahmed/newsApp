import 'package:flutter/material.dart';
import 'package:newsapp/Model/sourceResponse/Source.dart';
import 'package:newsapp/Model/sourceResponse/SourceResponse.dart';
import 'package:newsapp/Shared/api/api_manager.dart';

class SourcesViewModel extends ChangeNotifier{

  List<Source> sourceList=[];
  String? errorMessage;
  bool isLoading=false;

  void getSources(String categoryId)async{
    isLoading=true;//by3rd loading awl mynade 3ala al req
    notifyListeners();
    try{
      SourceResponse response= await ApiManager.getSources(categoryId);//htg3lk list mn al source
      isLoading=false;//3shan kda mfrod khalas gebt al data
      if(response.status=="error"){
        errorMessage=response.message;
      }else{
        sourceList=response.sources??[];
      }
    }catch(e){
      isLoading=false;
      //hena law fe error mgalksh mn al server la da moshklt net msln
      errorMessage=e.toString();
      notifyListeners();
    }
    notifyListeners();
  }
}