import 'dart:ui';

class Newsmodel{
  String id;
  String title;
  String imagePath;
  String sourcename;
  String date;
  Newsmodel({required this.title,required this.id , required this.sourcename,required this.imagePath,required this.date});

  static   List <Newsmodel>newLists=[
    Newsmodel(title: "Why are football's biggest clubs starting a newtournament?", id: "1", sourcename: "bbc", imagePath: "asset/images/football.png",date: "3hours ago"),
    Newsmodel(title: "Why are football's biggest clubs starting a newtournament?", id: "1", sourcename: "bbc", imagePath: "asset/images/football.png",date: "3hours ago"),
    Newsmodel(title: "Why are football's biggest clubs starting a newtournament?", id: "1", sourcename: "bbc", imagePath: "asset/images/football.png",date: "3hours ago"),
    Newsmodel(title: "Why are football's biggest clubs starting a newtournament?", id: "1", sourcename: "bbc", imagePath: "asset/images/football.png",date: "3hours ago"),
    Newsmodel(title: "Why are football's biggest clubs starting a newtournament?", id: "1", sourcename: "bbc", imagePath: "asset/images/football.png",date: "3hours ago"),

  ];

}