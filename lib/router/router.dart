import 'package:flutter/material.dart';
import 'package:se494_rr_workshop/screen/about.dart';
import 'package:se494_rr_workshop/screen/covid_news.dart';
import 'package:se494_rr_workshop/screen/covid_statistic.dart';
import 'package:se494_rr_workshop/screen/home.dart';
import 'package:se494_rr_workshop/screen/landing_page.dart';

class AppRouter {
  static Map<String, WidgetBuilder> initRouter() {
    return {
      '/': (BuildContext context) => const LandingPage(),
      '/home': (BuildContext context) => const Home(),
      '/covid-status': (BuildContext context) => const CovidStatistic(),
      '/covid-news': (BuildContext context) => const CovidNews(),
      '/about': (BuildContext context) => const About()
    };
  }
}