import 'dart:core';

class CovidCountry {
  final int? newConfirmed;
  final int? totalConfirmed;
  final int? newDeaths;
  final int? totalDeaths;
  final int? newRecovered;
  final int? totalRecovered;
  final DateTime date;
  final String? country;
  final String? countryCode;
  final String? slug;

  CovidCountry({
    required this.newConfirmed,
    required this.totalConfirmed,
    required this.newDeaths,
    required this.totalDeaths,
    required this.newRecovered,
    required this.totalRecovered,
    required this.date ,
    required this.country,
    required this.countryCode,
    required this.slug
  });

  factory CovidCountry.fromJson(Map<String,dynamic> json){
    return CovidCountry(
        newConfirmed: json["NewConfirmed"] ,
        totalConfirmed: json["TotalConfirmed"] ,
        newDeaths: json["NewDeaths"] ,
        totalDeaths: json["TotalDeaths"] ,
        newRecovered: json["NewRecovered"] ,
        totalRecovered: json["TotalRecovered"] ,
        date: DateTime.parse(json["Date"]) ,
        country: json["Country"],
        countryCode: json["CountryCode"],
        slug: json["Slug"]
    );
  }
}