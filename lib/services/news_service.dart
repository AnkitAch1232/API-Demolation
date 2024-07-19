import 'dart:convert';
import 'package:api_demo_3/consts/key.dart';
import 'package:http/http.dart' as http;
import '../models/news_model.dart';

class NewsService {
  String baseUrl = "https://newsapi.org/v2/";

  Future<List<NewsModel>> getNewsHeadLineByCountry(String countryCode) async {
    List<NewsModel> allNews = [];
    try {
      var response = await http.get(
        Uri.parse(
          baseUrl + "top-headlines?country=$countryCode",
        ),
        headers: {
          'X-Api-Key': ApiKeys.newsApiKey,
        },
      );
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        var articles = jsonData['articles'];
        print("THE vARIABLES   ISS ${articles.toString()}");

        for (int i = 0; i < articles.length; i++) {
          NewsModel newNews = NewsModel.fromJson(articles[i]);
          allNews.add(newNews);
        }
        print("The json data is $jsonData");
      } else {
        throw Exception(
            "Unable to get news because of ${response.body} and the status code is ${response.statusCode}");
      }
    } catch (e) {
      print(
        "The Exception is ${e.toString()}",
      );
    }
    print("THE LIST ISS ${allNews.toString()}");

    return allNews;
  }
}
