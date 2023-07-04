// Obtain shared preferences.
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/models/current.dart';
import 'package:weather_app/models/forcast.dart';

class Prefs {
  static SharedPreferences? prefs;
  Future<void> initSh() async {
    if (prefs == null) prefs = await SharedPreferences.getInstance();
  }

  static Future<bool?> getTheme() async {
    return await prefs!.getBool('isDark');
  }

  static Future<void> setTheme(bool isDark) async {
    await prefs!.setBool('isDark', isDark);
  }

  static void storeData(
      ({
        CurrentWeatherModel currenDay,
        ForcastWeatherModel nextDay,
        ForcastWeatherModel thirdDay
      }) data) async {
    await prefs!.setStringList('currenDay', <String>[
      data.currenDay.name,
      data.currenDay.region,
      data.currenDay.country,
      data.currenDay.localTime,
      data.currenDay.tempC.toString(),
      data.currenDay.tempF.toString(),
      data.currenDay.condtionText,
      data.currenDay.code.toString(),
    ]);
    await prefs!.setStringList('nextDay', <String>[
      data.nextDay.name,
      data.nextDay.region,
      data.nextDay.country,
      data.nextDay.condtionText,
      data.nextDay.code.toString(),
      data.nextDay.dayDate,
      data.nextDay.maxTempC.toString(),
      data.nextDay.maxTempF.toString(),
      data.nextDay.minTempC.toString(),
      data.nextDay.minTempF.toString(),
      data.nextDay.avgTempC.toString(),
      data.nextDay.avgTempF.toString(),
      data.nextDay.sunriseTime.toString(),
      data.nextDay.sunsetTime.toString(),
    ]);
    await prefs!.setStringList('thirdDay', <String>[
      data.thirdDay.name,
      data.thirdDay.region,
      data.thirdDay.country,
      data.thirdDay.condtionText,
      data.thirdDay.code.toString(),
      data.thirdDay.dayDate,
      data.thirdDay.maxTempC.toString(),
      data.thirdDay.maxTempF.toString(),
      data.thirdDay.minTempC.toString(),
      data.thirdDay.minTempF.toString(),
      data.thirdDay.avgTempC.toString(),
      data.thirdDay.avgTempF.toString(),
      data.thirdDay.sunriseTime.toString(),
      data.thirdDay.sunsetTime.toString(),
    ]);
  }

  static Future<
      ({
        CurrentWeatherModel currenDay,
        ForcastWeatherModel nextDay,
        ForcastWeatherModel thirdDay
      })?> restoreData() async {
    List<String>? currenDay = await prefs!.getStringList('currenDay');
    List<String>? nextDay = await prefs!.getStringList('nextDay');
    List<String>? thirdDay = await prefs!.getStringList('thirdDay');
    if (currenDay != null && nextDay != null && thirdDay != null) {
      ({
        CurrentWeatherModel currenDay,
        ForcastWeatherModel nextDay,
        ForcastWeatherModel thirdDay
      }) result = (
        currenDay: CurrentWeatherModel(
            name: currenDay[0],
            region: currenDay[1],
            country: currenDay[2],
            localTime: currenDay[3],
            tempC: double.parse(currenDay[4]),
            tempF: double.parse(currenDay[5]),
            condtionText: currenDay[6],
            code: int.parse(currenDay[7])),
        nextDay: ForcastWeatherModel(
            name: nextDay[0],
            region: nextDay[1],
            country: nextDay[2],
            localTime: '',
            condtionText: nextDay[3],
            code: int.parse(nextDay[4]),
            dayDate: nextDay[5],
            maxTempC: double.parse(nextDay[6]),
            maxTempF: double.parse(nextDay[7]),
            minTempC: double.parse(nextDay[8]),
            minTempF: double.parse(nextDay[9]),
            avgTempC: double.parse(nextDay[10]),
            avgTempF: double.parse(nextDay[11]),
            sunriseTime: nextDay[12],
            sunsetTime: nextDay[13]),
        thirdDay: ForcastWeatherModel(
            name: thirdDay[0],
            region: thirdDay[1],
            country: thirdDay[2],
            localTime: '',
            condtionText: thirdDay[3],
            code: int.parse(thirdDay[4]),
            dayDate: thirdDay[5],
            maxTempC: double.parse(thirdDay[6]),
            maxTempF: double.parse(thirdDay[7]),
            minTempC: double.parse(thirdDay[8]),
            minTempF: double.parse(thirdDay[9]),
            avgTempC: double.parse(thirdDay[10]),
            avgTempF: double.parse(thirdDay[11]),
            sunriseTime: thirdDay[12],
            sunsetTime: thirdDay[13]),
      );
      return result;
    }
    return null;
  }

  static Future<void> clean() async {
    await prefs!.clear();
  }
}
