import 'package:flutter/material.dart';
import 'package:weather_app/models/weather%20model.dart';

class WeatherProvider extends ChangeNotifier {
  WeatherModel? _weatherData;
  set weatherData(WeatherModel? weather) {
    _weatherData = weather;
    notifyListeners();
  }

  WeatherModel? get weatherData => _weatherData;
}
