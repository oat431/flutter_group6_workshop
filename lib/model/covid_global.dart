class CovidGlobal {
  final int? newConfirmed;
  final int? totalConfirmed;
  final int? newDeaths;
  final int? totalDeaths;
  final int? newRecovered;
  final int? totalRecovered;
  final DateTime date;

  CovidGlobal({
    required this.newConfirmed,
    required this.totalConfirmed,
    required this.newDeaths,
    required this.totalDeaths,
    required this.newRecovered,
    required this.totalRecovered,
    required this.date
  });

  factory CovidGlobal.fromJson(Map<String,dynamic> json){
    return CovidGlobal(
        newConfirmed: json["NewConfirmed"] ,
        totalConfirmed: json["TotalConfirmed"] ,
        newDeaths: json["NewDeaths"] ,
        totalDeaths: json["TotalDeaths"] ,
        newRecovered: json["NewRecovered"] ,
        totalRecovered: json["TotalRecovered"] ,
        date: DateTime.parse(json["Date"])
    );
  }
}