import 'package:flutter/material.dart';
import 'package:newsapp/Model/category-model.dart';
import 'package:newsapp/Shared/Theme.dart';
import 'package:newsapp/Shared/app_colors.dart';
import 'package:newsapp/UI/home/widget/TextFormField.dart';
import 'package:newsapp/UI/home/widget/categories_widget.dart';
import 'package:newsapp/UI/home/widget/categoy-details.dart';
import 'package:newsapp/UI/home/widget/home-drawer-widget.dart';
import 'package:newsapp/UI/home/widget/settings-widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName="HomeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

late Widget selectedWidget ;

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedWidget =CategoriesWidget(
        CategoryClick: onCategoryItemClick );
  }

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("asset/images/pattern.jpg"),
          fit: BoxFit.cover
        )
      ),
      child: Scaffold  (
    appBar: AppBar(

      title:   Text(AppLocalizations.of(context)!.newsapp),

     ),
        drawer:HomeDrawerWidget(
          itemclick:onMeniItemClick ,
        )  ,
          body: selectedWidget,

      ),
    );
  }

  void onMeniItemClick(MenuItem item){
  switch (item){
    case MenuItem.Categories:{
      selectedWidget=CategoriesWidget(CategoryClick: onCategoryItemClick,);
      Navigator.pop(context);
      setState(() {

      });
    }
    break;

    case MenuItem.Settings:{
      selectedWidget=SettingsTab();
      Navigator.pop(context);
      setState(() {

      });
    }
  }
  }
  void onCategoryItemClick(CategoryModel categoryClick){
  //selectedWidget=CategoryDetails(category:categoryClick ,);
    Navigator.pushNamed(context, CategoryDetails.routeName,arguments: categoryClick);
  setState(() {

  });
  }



}
