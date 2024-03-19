import 'package:flutter/material.dart';
import 'package:newsapp/Shared/Theme.dart';

import 'UI/home/home_screen.dart';

void main() {
  runApp(const MyApp());
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
        HomeScreen.routeName:(context) => HomeScreen(),
      },
    );
  }
}

