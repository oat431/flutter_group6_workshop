import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:provider/provider.dart';
import 'package:se494_rr_workshop/component/rr_show_country_info.dart';
import 'package:se494_rr_workshop/model/covid_country.dart';

import 'package:se494_rr_workshop/state/provider.dart';

class CovidStatistic extends StatefulWidget {
  const CovidStatistic({Key? key}) : super(key: key);

  @override
  _CovidStatisticState createState() => _CovidStatisticState();
}

class _CovidStatisticState extends State<CovidStatistic> {
  late List<CovidCountry> covidCountry = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var covidstatusPro = Provider.of<CovidInfoProvider>(context);
    return FutureBuilder<List<CovidCountry>>(
      future: covidstatusPro.getAllCovidStatus(),
      builder: (context, snapshot) {
        covidCountry = covidstatusPro.getCovidCountry();
        if (snapshot.hasError) {
          return const Center(
              child: Text("There something error with our network."));
        } else if (snapshot.hasData) {
          return ListView.builder(
            itemCount: covidCountry.length,
            itemBuilder: (context, i) {
              final item = covidCountry[i];
              final code = item.countryCode;
              return ListTile(
                leading: Image.network(
                  "https://flagcdn.com/w320/${code?.toLowerCase()}.png",
                  width: 50,
                  height: 50,
                ),
                title: Text("${item.country}"),
                subtitle: Text("All case : ${item.totalConfirmed}"),
                trailing: Text("today case : ${item.newConfirmed}"),
                onTap: () => {
                  SmartDialog.showToast("You select ${item.country}"),
                  SmartDialog.show(
                      widget: ShowCountryInfo(country: item,),
                      alignmentTemp: Alignment.bottomCenter,
                      clickBgDismissTemp: true,
                  )
                },
                style: ListTileStyle.drawer,
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
