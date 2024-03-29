import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingProvider extends ChangeNotifier{

  String controllerText= " ";
  Future<void> changeController(String NewController) async {

    if(controllerText==NewController)return;
    controllerText=NewController;
    notifyListeners();
  }

  String language='en';


  Future<void> changeLnaguage(String newLnaguage) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if(language == newLnaguage)return;
    language= newLnaguage;
    prefs.setString('language',language);
    notifyListeners();
  }

  Future<void> init() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    language = prefs.getString("language")??"en" ;

    notifyListeners();
  }


}