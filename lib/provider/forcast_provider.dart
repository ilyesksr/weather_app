import 'package:flutter/material.dart';
import 'package:weather_app/db/shPref.dart';

import '../models/current.dart';
import '../models/forcast.dart';

class Forcast extends ChangeNotifier {
  ({
    CurrentWeatherModel currenDay,
    ForcastWeatherModel nextDay,
    ForcastWeatherModel thirdDay
  })? forcastDays;
  bool? isDark;

  set setForcastDays(
      ({
        CurrentWeatherModel? currenDay,
        ForcastWeatherModel? nextDay,
        ForcastWeatherModel? thirdDay
      }) myDays) {
    if (myDays.currenDay != null &&
        myDays.thirdDay != null &&
        myDays.nextDay != null) {
      myDays as ({
        CurrentWeatherModel currenDay,
        ForcastWeatherModel nextDay,
        ForcastWeatherModel thirdDay
      });
      Prefs.clean();
      Prefs.storeData(myDays);
      forcastDays = myDays;
      notifyListeners();
    }
  }

  void fetshLocalData() async {
    forcastDays = await Prefs.restoreData();
    notifyListeners();
  }

  void fetshThemeData() async {
    isDark = await Prefs.getTheme();
    notifyListeners();
  }

  void toggleTheme() {
    isDark ??= false;
    isDark = !isDark!;
    Prefs.setTheme(isDark!);
    notifyListeners();
  }
}
