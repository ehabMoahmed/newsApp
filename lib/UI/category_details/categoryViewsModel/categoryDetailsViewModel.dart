import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:newsapp/Shared/api/api_manager.dart';

import '../../../data_layer/Model/newsResponse/Articles.dart';
import '../../../data_layer/Model/sourceResponse/Source.dart';



class CategoryDetailsViewModel extends Cubit<CategoryDetailsState>{
  late ApiManager apiManager;
  CategoryDetailsViewModel( ):super(CategoryDetailsLoadingState()){
    apiManager=ApiManager();
  } //3ayz a3rf enta bad2 fe anhe State

  getSources(String categoryID)async{
    emit(CategoryDetailsLoadingState() ); //bt3ml fire bt2olo ro7 lstate gdeda
      try{
        var sourceResponse=await apiManager.getSources(categoryID);
        if(sourceResponse.status=="error"){
          emit(CategoryDetailsErrorState(sourceResponse.message??""));
        }else{
          emit( CategoryDetailsSuccessState(sourceResponse.sources??[]));
        }
      }catch(e){
        emit(CategoryDetailsErrorState(e.toString()) );
      }
      
  }
  getNews(sourceID)async{
    emit(CategoryDetailsLoadingArticleState() );
    try{
      var response=await apiManager.getNews(sourceID);
      if(response.status=="error"){
        emit(CategoryDetailsErrorArticleState(response.message??"") );
      }else{
        emit(CategoryDetailsSuccessArticleState( response.articles??[] ));
      }
    }catch(e){
      emit(CategoryDetailsErrorArticleState( e.toString()) );
    }
  }

}

//da class al parent al hyshel kol al state  law b3tlo CategoryDetailsLoadingState bdl CategoryDetailsState hywaf2 mfhom al polymorphism
abstract class CategoryDetailsState{}
class CategoryDetailsLoadingState extends CategoryDetailsState{}
class CategoryDetailsErrorState extends CategoryDetailsState{
  String errorMessage;
  CategoryDetailsErrorState(this.errorMessage);
}
class CategoryDetailsSuccessState extends CategoryDetailsState{
  List<Source> sources;
  CategoryDetailsSuccessState(this.sources);
}

class CategoryDetailsLoadingArticleState extends CategoryDetailsState{}
class CategoryDetailsErrorArticleState extends CategoryDetailsState{
  String errorMessage;
  CategoryDetailsErrorArticleState(this.errorMessage);
}
class CategoryDetailsSuccessArticleState extends CategoryDetailsState{
  List<Article> articles;
  CategoryDetailsSuccessArticleState(this.articles);
}
