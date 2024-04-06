import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  int index;
Color background;
String title;
String image;
CategoryWidget({required this.title,required this.image
,required this.background,required this.index});
  @override
  Widget build(BuildContext context) {
    double height= MediaQuery.of(context).size.height;
    return  Container (
      padding: EdgeInsets.only(top: 18),
       decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight:  Radius.circular(24),
          bottomRight: Radius.circular(index.isEven?24:0),
          bottomLeft: Radius.circular(index.isEven?0:24),
        )
      ),
      child: Column(
        children: [
          Image.asset(image,height: height*0.1,),
          Text(title,style: TextStyle(
            color: Colors.white,
            fontSize: 22
          )),
        ],
      ),
    );
  }
}
