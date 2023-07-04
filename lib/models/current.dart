class CurrentWeatherModel {
  String name;
  String region;
  String country;
  String localTime;
  double tempC;
  double tempF;
  String condtionText;
  int code;
  int isDay;

  CurrentWeatherModel(
      {required this.name,
      required this.region,
      required this.country,
      required this.localTime,
      required this.tempC,
      required this.tempF,
      required this.condtionText,
      required this.code,
      required this.isDay});

  factory CurrentWeatherModel.fromJson(Map<String, dynamic> json) {
    return CurrentWeatherModel(
        name: json['location']['name'],
        region: json['location']['region'],
        country: json['location']['country'],
        localTime: json['location']['localtime'],
        tempC: json['current']['temp_c'],
        tempF: json['current']['temp_f'],
        condtionText: json['current']['condition']['text'],
        code: json['current']['condition']['code'],
        isDay: json['current']['is_day']);
  }
}
