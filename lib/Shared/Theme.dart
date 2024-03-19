import 'package:flutter/material.dart';
import 'package:newsapp/Shared/app_colors.dart';

class Apptheme{
  static  ThemeData lightTheme=ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      toolbarHeight: 70,
      centerTitle: true,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
      backgroundColor: AppColors.primaryColor,
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 22,
        color: Colors.white,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50) ,
          bottomRight: Radius.circular(50),
        )
      )
    ),

    colorScheme: ColorScheme.fromSeed(
        seedColor:  AppColors.primaryColor,
        primary:  AppColors.primaryColor,
    ),

    textTheme: TextTheme(
        headlineLarge: TextStyle(
     color: Colors.white,
     fontWeight: FontWeight.w700,
     fontSize: 24
   ),
        labelMedium: TextStyle(
            color: AppColors.TextDrawerColor,
            fontWeight: FontWeight.w700,
            fontSize: 22
        )
    ),

    iconTheme: IconThemeData(
      color: AppColors.TextDrawerColor,
      size: 30,
    )
  );
}