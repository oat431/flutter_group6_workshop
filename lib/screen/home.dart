import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:se494_rr_workshop/component/rr_swiper.dart';
import 'package:se494_rr_workshop/model/covid_articles.dart';
import 'package:se494_rr_workshop/model/covid_global.dart';
import 'package:se494_rr_workshop/widget/rr_info_card.dart';

import 'package:se494_rr_workshop/state/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late CovidGlobal covidGlobal;
  late List<CovidArticles> recommend;

  List<CovidArticles> getTopArticle(){
    List<CovidArticles> news = [];
    var covidNewsPro = Provider.of<CovidInfoProvider>(context);
    for(int i=0;i<5;i++){
      news.add(covidNewsPro.getCovidArticles()[i]);
    }
    return news;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var covidGlobal = Provider.of<CovidInfoProvider>(context);
    return FutureBuilder<CovidGlobal>(
      future: covidGlobal.getOverviewStatus(),
      builder: (context, snapshot) {
        var covidOverview = covidGlobal.getCovidGlobal();
        if (snapshot.hasError) {
          return const Center(child: Text("Something wrong on our network."));
        } else if (snapshot.hasData) {
          return Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: MyInfoBox(
                        color: Colors.green[600],
                        title: "Total Recovered",
                        subtitle: "${covidOverview.totalRecovered}",
                        detail:
                            "New Recover Today : ${covidOverview.newRecovered}"),
                  ),
                ],
              ),
              Row(
                children: [
                  MyInfoBox(
                    color: Colors.black38,
                    title: "Total Death",
                    subtitle: "${covidOverview.totalDeaths}",
                    detail: "New Death today ${covidOverview.newDeaths}",
                  ),
                  Expanded(
                    child: MyInfoBox(
                      color: Colors.red[300],
                      title: "Total Confirmed",
                      subtitle: "${covidOverview.totalConfirmed}",
                      detail: "New case today ${covidOverview.newConfirmed}",
                    ),
                  ),
                ],
              ),
              Expanded(
                  child: RustyRiverSwiper(recommend: getTopArticle())
              )
            ],
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
