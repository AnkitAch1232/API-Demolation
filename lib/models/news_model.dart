//import 'package:api_demo_3/consts/country_data.dart';

class NewsModel {
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;

  NewsModel(
      {this.author,
      this.description,
      this.publishedAt,
      this.title,
      this.url,
      this.urlToImage});

  NewsModel.fromJson(Map<String, dynamic> data) {
    author = data['author'];
    description = data['description'];
    publishedAt = data['punlishedAt'];
    title = data['title'];
    url = data['url'];
    urlToImage = data['urlToImage'];
  }
}
