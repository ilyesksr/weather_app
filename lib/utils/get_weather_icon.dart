import 'dart:convert';

import 'package:http/http.dart' as http;

Future<({int icon1, int icon2, int icon3})?> getIconFromCode(
    //
    int code1,
    int code2,
    int code3) async {
  String url = 'https://www.weatherapi.com/docs/weather_conditions.json';
  http.Response response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    List<dynamic> iconList = jsonDecode(response.body);
    Map<String, dynamic> icon1 =
        iconList.firstWhere((element) => element['code'] == code1);
    Map<String, dynamic> icon2 =
        iconList.firstWhere((element) => element['code'] == code2);
    Map<String, dynamic> icon3 =
        iconList.firstWhere((element) => element['code'] == code3);

    return (
      icon1: icon1['icon'] as int,
      icon2: icon2['icon'] as int,
      icon3: icon3['icon'] as int,
    );
  }
  return null;
}
