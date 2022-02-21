import 'package:se494_rr_workshop/model/covid_articles.dart';

class CovidNews {
  final String status;
  final int totalResults;
  final List<CovidArticles> articles;

  CovidNews({
    required this.status,
    required this.totalResults,
    required this.articles
  });

  factory CovidNews.fromJson(Map<String,dynamic> json){
    return CovidNews(
        status:json["status"] ,
        totalResults:json["totalResults"] ,
        articles:json["articles"]
    );
  }
}