import 'package:flutter/material.dart';
import 'package:newsapp/Shared/Theme.dart';
import 'package:provider/provider.dart';

import 'Shared/provider/provider.dart';
import 'UI/home/home_screen.dart';
import 'UI/home/widget/article/article_list.dart';
import 'UI/home/widget/categories_widget.dart';
import 'UI/home/widget/categoy-details.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => SettingProvider(),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme:  Apptheme.lightTheme,
      initialRoute:   HomeScreen.routeName,
      routes:{
        Articlee.routeName:(context) => Articlee( ),
        HomeScreen.routeName:(context) => HomeScreen(),
        CategoryDetails.routeName:(context) => CategoryDetails(  ),
      },
    );
  }
}

