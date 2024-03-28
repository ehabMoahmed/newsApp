import 'package:flutter/cupertino.dart';

class SettingProvider extends ChangeNotifier{

  String controllerText= " ";
  Future<void> changeController(String NewController) async {

    if(controllerText==NewController)return;
    controllerText=NewController;
    notifyListeners();
  }


}