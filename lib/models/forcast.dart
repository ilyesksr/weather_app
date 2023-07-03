class ForcastWeatherModel {
  String name;
  String region;
  String country;
  String localTime;
  String condtionText;
  int code;
  String dayDate;
  double maxTempC;
  double maxTempF;
  double minTempC;
  double minTempF;
  double avgTempC;
  double avgTempF;
  String sunriseTime;
  String sunsetTime;
  ForcastWeatherModel(
      {required this.name,
      required this.region,
      required this.country,
      required this.localTime,
      required this.condtionText,
      required this.code,
      required this.maxTempC,
      required this.maxTempF,
      required this.minTempC,
      required this.minTempF,
      required this.avgTempC,
      required this.avgTempF,
      required this.dayDate,
      required this.sunriseTime,
      required this.sunsetTime});

  factory ForcastWeatherModel.fromJson(
      Map<String, dynamic> json, int dayIndex) {
    return ForcastWeatherModel(
      name: json['location']['name'],
      region: json['location']['region'],
      country: json['location']['country'],
      localTime: json['location']['localtime'],
      dayDate: json['forecast']['forecastday'][dayIndex]['date'],
      maxTempC: json['forecast']['forecastday'][dayIndex]['day']['maxtemp_c'],
      maxTempF: json['forecast']['forecastday'][dayIndex]['day']['maxtemp_f'],
      minTempC: json['forecast']['forecastday'][dayIndex]['day']['mintemp_c'],
      minTempF: json['forecast']['forecastday'][dayIndex]['day']['mintemp_f'],
      avgTempC: json['forecast']['forecastday'][dayIndex]['day']['avgtemp_c'],
      avgTempF: json['forecast']['forecastday'][dayIndex]['day']['avgtemp_f'],
      condtionText: json['forecast']['forecastday'][dayIndex]['day']
          ['condition']['text'],
      code: json['forecast']['forecastday'][dayIndex]['day']['condition']
          ['code'],
      sunriseTime: json['forecast']['forecastday'][dayIndex]['astro']
          ['sunrise'],
      sunsetTime: json['forecast']['forecastday'][dayIndex]['astro']['sunset'],
    );
  }
}
