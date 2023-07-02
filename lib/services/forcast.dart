import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/models/current.dart';
import 'package:weather_app/models/suggestion.dart';

class ForcastWeather {
  Future<CurrentWeatherModel?> getCurrentWeatherResponse(String query) async {
    http.Response response = await http.get(Uri.parse(
        'http://api.weatherapi.com/v1/current.json?key=ea7a6ada9ad94cec8a0175451230107&q=$query&aqi=no'));
    if (response.statusCode == 200) {
      Map<String, dynamic> map = jsonDecode(response.body);

      return CurrentWeatherModel.fromJson(map);
    }
    print(response.body);
    return null;
  }

  Future<List<SuggestionWeatherModel>?> getWeatherSuggestions(
      String query) async {
    http.Response response = await http.get(Uri.parse(
        'http://api.weatherapi.com/v1/search.json?key=ea7a6ada9ad94cec8a0175451230107&q=$query'));
    if (response.statusCode == 200) {
      List responseList = jsonDecode(response.body);

      return responseList
          .map((e) => SuggestionWeatherModel.fromJson(e))
          .toList();
    }

    print(response.body);
    return null;
  }
}
