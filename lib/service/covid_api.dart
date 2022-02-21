import 'dart:async';
import 'package:http/http.dart' as http;

class CovidApi {
  final String url = "api.covid19api.com";
  final String path = "/summary";

  Future<http.Response> getCovidSummary() {
    return http.get(
      Uri.https(url,path),
        headers:  {
          "Accept": "application/json",
          "Access-Control_Allow_Origin": "*"
        }
    );
  }
}