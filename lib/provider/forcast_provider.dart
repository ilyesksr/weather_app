import 'package:flutter/material.dart';

import '../models/current.dart';
import '../models/forcast.dart';

class Forcast extends ChangeNotifier {
  ({
    CurrentWeatherModel currenDay,
    ForcastWeatherModel nextDay,
    ForcastWeatherModel nnextDay
  })? forcastDays;

  set setForcastDays(
      ({
        CurrentWeatherModel? currenDay,
        ForcastWeatherModel? nextDay,
        ForcastWeatherModel? nnextDay
      }) myDays) {
    if (myDays.currenDay != null &&
        myDays.nnextDay != null &&
        myDays.nextDay != null) {
      myDays as ({
        CurrentWeatherModel currenDay,
        ForcastWeatherModel nextDay,
        ForcastWeatherModel nnextDay
      });

      forcastDays = myDays;
      notifyListeners();
    }
  }
}
