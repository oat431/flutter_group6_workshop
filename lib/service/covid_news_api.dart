import 'dart:async';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

class CovidNewsApi {
  var now = DateTime.now();
  var formatter = DateFormat('yyyy-MM-dd');
  final String url = "newsapi.org";
  final String path = "/v2/everything";
  final String query = "COVID";
  final String sortBy = "date";
  final String apiKey = "52416b411fea44b1be07faf152d9f178";

  Future<http.Response> getCovidNews(){
    print(formatter.format(now));
    return http.get(
        Uri.https(
            url,
            path,
            {
              'q' : query,
              'from' : formatter.format(now),
              'sortBy' : sortBy,
              'apiKey' : apiKey
            }
        ),
      headers:  {
        "Accept": "application/json",
        "Access-Control_Allow_Origin": "*"
      }
    );
  }
}