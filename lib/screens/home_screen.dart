import 'package:api_demo_3/consts/country_data.dart';
import 'package:api_demo_3/screens/news_headline.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News App"),
      ),
      body: ListView.builder(
        itemCount: countries.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return NewsHeadline(
                    countryCode: countries[index]['cc'],
                    countryName: countries[index]['name']);
              }));
            },
            title: Text(
              countries[index]['name'],
            ),
            subtitle: Text(
              countries[index]['cc'],
            ),
          );
        },
      ),
    );
  }
}
