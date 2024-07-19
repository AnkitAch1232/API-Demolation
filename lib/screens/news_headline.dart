import 'package:api_demo_3/consts/country_data.dart';
import 'package:api_demo_3/models/news_model.dart';
import 'package:flutter/material.dart';
import '../services/news_service.dart';

class NewsHeadline extends StatelessWidget {
  final String countryCode;
  final String countryName;
  const NewsHeadline(
      {super.key, required this.countryCode, required this.countryName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("$countryName - $countryCode"),
      ),
      body: FutureBuilder(
          future: NewsService().getNewsHeadLineByCountry(countryCode),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text("There are no news"),
              );
            }
            if (snapshot.hasData) {
              var newsData = snapshot.data as List<NewsModel>;
              if (newsData!.length == 0) {
                return Center(
                  child: Text("No news found"),
                );
              } else {
                return ListView.builder(
                  itemCount: newsData.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Image(
                        image: NetworkImage(newsData[index].urlToImage ??
                            "https://cdn.pixabay.com/photo/2024/05/26/10/15/bird-8788491_1280.jpg"),
                      ),
                      title: Column(
                        children: [
                          Text(newsData[index].title!),
                          Text(newsData[index].author ?? "Unknown Author"),
                          Text(newsData[index].publishedAt ??
                              "No published date"),
                          Text(newsData[index].description ??
                              "No description found"),
                        ],
                      ),
                    );
                  },
                );
              }
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
