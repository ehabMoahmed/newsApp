import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
typedef onMenuItemClick= void Function(MenuItem item);
class HomeDrawerWidget extends StatelessWidget {
  onMenuItemClick itemclick;
  HomeDrawerWidget({required this.itemclick});
  @override
  Widget build(BuildContext context) {
    return   Drawer(
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            padding: EdgeInsets.symmetric(
                vertical: 40,
             ),
              color: Theme.of(context).colorScheme.primary,
              child: Text("News APP!",style: Theme.of(context).textTheme.headlineLarge)),
          InkWell(
            onTap:(){
            itemclick( MenuItem.Categories);
            } ,
            child: Row(
              children: [
                Icon( Icons.list, ),
                SizedBox(width: 10,),
                Text("Categories",style: Theme.of(context).textTheme.labelMedium,),
              ],
            ),
          ),
          SizedBox(height: 20,),
          InkWell(
            onTap:(){
              itemclick(MenuItem.Settings);
            },
            child: Row(
              children: [
                Icon( Icons.settings, ),
                SizedBox(width: 10,),
                Text("Settings",style: Theme.of(context).textTheme.labelMedium,),
              ],
            ),
          ),

        ],
      ),
    );
  }
}

//zy al class bs byrmoz lkol variable feh b index
enum MenuItem{
  Categories,  //=0
  Settings,   //=1
}