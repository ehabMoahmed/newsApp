class NewsModel{
  String id;
  String title;
  String image;
  String sourceName;
  NewsModel({required this.id, required this.image,required this.sourceName,required this.title});

  static  List<NewsModel> newsLists=[
    NewsModel(id: "1",image:"asset/images/football.png" ,sourceName: "BBC",title:"Why are football's biggest clubs starting a new \ntournament?" ),
    NewsModel(id: "1",image:"asset/images/football.png" ,sourceName: "BBC",title:"Why are football's biggest clubs starting a new \ntournament?" ),
    NewsModel(id: "1",image:"asset/images/football.png" ,sourceName: "BBC",title:"Why are football's biggest clubs starting a new \ntournament?" ),
    NewsModel(id: "1",image:"asset/images/football.png" ,sourceName: "BBC",title:"Why are football's biggest clubs starting a new \ntournament?" ),
    NewsModel(id: "1",image:"asset/images/football.png" ,sourceName: "BBC",title:"Why are football's biggest clubs starting a new \ntournament?" ),
    NewsModel(id: "1",image:"asset/images/football.png" ,sourceName: "BBC",title:"Why are football's biggest clubs starting a new \ntournament?" ),
  ];
}