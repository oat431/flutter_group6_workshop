import 'package:flutter/material.dart';
import 'package:se494_rr_workshop/model/covid_country.dart';

class ShowCountryInfo extends StatelessWidget {
  const ShowCountryInfo({Key? key, required this.country}) : super(key: key);

  final CovidCountry country;

  Widget infoText(String msg) {
    return Text(
      msg,
      style: const TextStyle(
        fontSize: 18,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints:
          const BoxConstraints(maxHeight: 550, maxWidth: double.infinity),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 20, spreadRadius: 10)
        ],
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(50),
          child: Column(
            children: [
              Image.network(
                "https://flagcdn.com/w320/${country.countryCode?.toLowerCase()}.png",
                width: 50,
                height: 50,
              ),
              infoText("${country.slug}\n"),
              Column(
                children: [
                  infoText("total recovered"),
                  const SizedBox(height: 10,),
                  infoText("${country.totalRecovered}\n"),
                ],
              ),
              const SizedBox(
                width: 25,
              ),
              Column(
                children: [
                  infoText("new recovered"),
                  const SizedBox(height: 10,),
                  infoText("${country.newRecovered}\n"),
                ],
              ),
              Column(
                children: [
                  infoText("total deaths"),
                  const SizedBox(height: 10,),
                  infoText("${country.totalDeaths}\n"),
                ],
              ),
              const SizedBox(
                width: 25,
              ),
              Column(
                children: [
                  infoText("new deaths"),
                  const SizedBox(height: 10,),
                  infoText("${country.newDeaths}\n"),
                ],
              ),
              infoText("update: ${country.date}"),
            ],
          ),
        ),
      ),
    );
  }
}
