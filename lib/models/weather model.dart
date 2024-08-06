import 'package:flutter/material.dart';

class WeatherModel {
  String cityname;
  String date;
  double temp;
  double maxtemp;
  double mintemp;
  String weatherState;
  String Icon;
  WeatherModel(
      {required this.date,
      required this.temp,
      required this.maxtemp,
      required this.mintemp,
      required this.weatherState,
      required this.cityname,
      required this.Icon});
  factory WeatherModel.fromjson(dynamic data) {
    var jasondata = data['forecast']['forecastday'][0]['day'];
    // date = data['location']['localtime'];
    // temp = jasondata['avgtemp_c'];
    // maxtemp = jasondata['maxtemp_c'];
    // mintemp = jasondata['mintemp_c'];['day']['condition']['text']
    return WeatherModel(
        cityname: data['location']['name'],
        date: data['location']['localtime'],
        temp: jasondata['avgtemp_c'],
        maxtemp: jasondata['maxtemp_c'],
        mintemp: jasondata['mintemp_c'],
        weatherState: jasondata['condition']['text'],
        Icon: jasondata['condition']['icon']);
  }
  String getImage() {
    if (weatherState == 'Clear' ||
        weatherState == 'LightCloud' ||
        weatherState == 'Sunny') {
      return 'assets/images/clear.png';
    } else if (weatherState == 'Cloudy') {
      return 'assets/images/cloudy.png';
    } else if (weatherState == 'Light Rain' ||
        weatherState == 'Heavy Rain' ||
        weatherState == 'Moderate rain' ||
        weatherState == 'Patchy rain nearby') {
      return 'assets/images/rainy.png';
    } else if (weatherState == 'Thunder') {
      return 'assets/images/thunderstorm.png';
    } else {
      return 'assets/images/clear.png';
    }
  }

  MaterialColor getColor() {
    if (weatherState == 'Clear' ||
        weatherState == 'LightCloud' ||
        weatherState == 'Sunny') {
      return Colors.yellow;
    } else if (weatherState == 'Cloudy') {
      return Colors.lightBlue;
    } else if (weatherState == 'Light Rain' ||
        weatherState == 'Heavy Rain' ||
        weatherState == 'Moderate rain') {
      return Colors.blue;
    } else if (weatherState == 'Thunder') {
      return Colors.grey;
    } else {
      return Colors.blueGrey;
    }
  }

  @override
  String toString() {
    // TODO: implement toString
    return 'temp=$temp';
  }
}
