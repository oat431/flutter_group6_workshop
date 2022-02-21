import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:se494_rr_workshop/model/covid_articles.dart';
import 'package:se494_rr_workshop/state/provider.dart';
import 'package:se494_rr_workshop/widget/rr_card.dart';

class CovidNews extends StatefulWidget {
  const CovidNews({Key? key}) : super(key: key);

  @override
  _CovidNewsState createState() => _CovidNewsState();
}

class _CovidNewsState extends State<CovidNews> {

  late List<CovidArticles> covidArticles = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var covidNewsPro = Provider.of<CovidInfoProvider>(context);
    return FutureBuilder<List<CovidArticles>> (
      future: covidNewsPro.getAllCovidArticle(),
      builder: (context, snapshot) {
        covidArticles = covidNewsPro.getCovidArticles();
        if (snapshot.hasError) {
          return const Center(child: Text("Something wrong on our network."));
        } else if (snapshot.hasData) {
          return ListView.builder(
            itemCount: covidArticles.length,
            itemBuilder: (context, index) {
              final item = covidArticles[index];
              return MyBox(
                imageUrl: item.urlToImage,
                title: item.title,
                detail: item.description,
                subtitle: item.source,
                url: item.url,
              );
            },
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
