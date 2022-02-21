import 'dart:convert';
import 'dart:core';

import 'package:flutter/material.dart';

import 'package:se494_rr_workshop/model/covid_articles.dart';
import 'package:se494_rr_workshop/screen/covid_statistic.dart';
import 'package:se494_rr_workshop/service/covid_news_api.dart';

import 'package:se494_rr_workshop/model/covid_country.dart';
import 'package:se494_rr_workshop/model/covid_global.dart';
import 'package:se494_rr_workshop/service/covid_api.dart';

class CovidInfoProvider extends ChangeNotifier {
  late final CovidNewsApi covidNewsApi = CovidNewsApi();
  late List<CovidArticles> covidArticles = [];
  late final CovidApi covidApi = CovidApi();
  late CovidGlobal covidGlobal;
  late List<CovidCountry> covidCountry = [];

  CovidInfoProvider(){
    getAllCovidArticle();
    getAllCovidStatus();
    notifyListeners();
  }

  Future<List<CovidArticles>> getAllCovidArticle() async {
    var response = await covidNewsApi.getCovidNews();
    List res = json.decode(response.body)["articles"];
    covidArticles = res
        .map((covidArticles) => CovidArticles.fromJson(covidArticles))
        .toList();
    return covidArticles;
  }

  Future<List<CovidCountry>> getAllCovidStatus() async {
    var response = await covidApi.getCovidSummary();
    List res = json.decode(response.body)["Countries"];
    covidCountry = res.map((status) => CovidCountry.fromJson(status)).toList();
    covidGlobal = CovidGlobal.fromJson(json.decode(response.body));
    return covidCountry;
  }

  Future<CovidGlobal> getOverviewStatus() async {
    var response = await covidApi.getCovidSummary();
    covidGlobal = CovidGlobal.fromJson(json.decode(response.body)["Global"]);
    return covidGlobal;
  }


  List<CovidArticles> getCovidArticles(){
    return covidArticles;
  }

  CovidGlobal getCovidGlobal(){
    return covidGlobal;
  }

  List<CovidCountry> getCovidCountry(){
    return covidCountry;
  }


}