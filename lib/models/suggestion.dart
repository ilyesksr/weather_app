class SuggestionWeatherModel {
  String name;
  String region;
  String country;
  SuggestionWeatherModel(
      {required this.name, required this.country, required this.region});
  factory SuggestionWeatherModel.fromJson(Map<String, dynamic> json) {
    return SuggestionWeatherModel(
        name: json['name'], country: json['country'], region: json['region']);
  }
}
