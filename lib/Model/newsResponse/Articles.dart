import '../sourceResponse/Source.dart';

/// source : {"id":"business-insider","name":"Business Insider"}
/// author : "mhumphries@businessinsider.com (Monica Humphries)"
/// title : "A family's $6,300 vacation was at risk when the passport office lost their daughter's photo and replaced it with the wrong child"
/// description : "Jasmeen Basi said her daughter's passport was delayed because the 3-year-old's image had been accidentally replaced with a photo of an older child."
/// url : "https://www.businessinsider.com/passport-office-lost-childs-photo-parent-says-2024-3"
/// urlToImage : "https://i.insider.com/65fd8e4f895d822030333ea3?width=1200&format=jpeg"
/// publishedAt : "2024-03-25T13:56:20Z"
/// content : "Jasmeen Basi and Dillon Birring's family vacation was quickly approaching.\r\nIt would be their first trip abroad as a family of four. At the end of March, they'd travel from their home in England to E… [+4007 chars]"

class Article {
  Article({
      this.source, 
      this.author, 
      this.title, 
      this.description, 
      this.url, 
      this.urlToImage, 
      this.publishedAt, 
      this.content,});

  Article.fromJson(dynamic json) {
    source = json['source'] != null ? Source.fromJson(json['source']) : null;
    author = json['author'];
    title = json['title'];
    description = json['description'];
    url = json['url'];
    urlToImage = json['urlToImage'];
    publishedAt = json['publishedAt'];
    content = json['content'];
  }
  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;
Article copyWith({  Source? source,
  String? author,
  String? title,
  String? description,
  String? url,
  String? urlToImage,
  String? publishedAt,
  String? content,
}) => Article(  source: source ?? this.source,
  author: author ?? this.author,
  title: title ?? this.title,
  description: description ?? this.description,
  url: url ?? this.url,
  urlToImage: urlToImage ?? this.urlToImage,
  publishedAt: publishedAt ?? this.publishedAt,
  content: content ?? this.content,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (source != null) {
      map['source'] = source?.toJson();
    }
    map['author'] = author;
    map['title'] = title;
    map['description'] = description;
    map['url'] = url;
    map['urlToImage'] = urlToImage;
    map['publishedAt'] = publishedAt;
    map['content'] = content;
    return map;
  }

}