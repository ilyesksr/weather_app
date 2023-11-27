import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/models/current.dart';
import 'package:weather_app/models/forcast.dart';
import 'package:weather_app/models/suggestion.dart';

class ForcastWeather {
  // Todo Get the Free key From weatherapi.com
  static const myWeatherApiKey = 'ea7a6ada9ad94cec8a0175451230107';
  Future<CurrentWeatherModel?> getCurrentWeatherResponse(String query) async {
    http.Response response = await http.get(Uri.parse(
        'https://api.weatherapi.com/v1/current.json?key=${myWeatherApiKey}&q=$query&aqi=no'));
    if (response.statusCode == 200) {
      Map<String, dynamic> map = jsonDecode(response.body);

      return CurrentWeatherModel.fromJson(map);
    }

    return null;
  }

  Future<List<SuggestionWeatherModel>?> getWeatherSuggestions(
      String query) async {
    http.Response response = await http.get(Uri.parse(
        'https://api.weatherapi.com/v1/search.json?key=${myWeatherApiKey}&q=$query'));
    if (response.statusCode == 200) {
      List responseList = jsonDecode(response.body);

      return responseList
          .map((e) => SuggestionWeatherModel.fromJson(e))
          .toList();
    }

    return null;
  }

  Future<ForcastWeatherModel?> getWeatherForcast(
      {required String query, required int dayIndex}) async {
    http.Response response = await http.get(Uri.parse(
        'https://api.weatherapi.com/v1/forecast.json?key=${myWeatherApiKey}&q=$query&days=3&aqi=no&alerts=no'));
    if (response.statusCode == 200) {
      Map<String, dynamic> map = jsonDecode(response.body);
      return ForcastWeatherModel.fromJson(map, dayIndex);
    }

    return null;
  }
}
