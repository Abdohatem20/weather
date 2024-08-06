import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Providers/weather_provider.dart';
import 'package:weather_app/main.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather model.dart';

class Searchpage extends StatelessWidget {
  String? cityname;
  Searchpage({this.UpdateUi});
  VoidCallback? UpdateUi;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 123, 117, 100),
        title: Text('search a city'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                onSubmitted: (data) async {
                  cityname = data;
                  Weathersearvice searvice = Weathersearvice();
                  WeatherModel? weather =
                      await searvice.getWeather(CityName: cityname!);
                  Provider.of<WeatherProvider>(context, listen: false)
                      .weatherData = weather;
                  Navigator.pop(context);
                },
                style: TextStyle(fontSize: 20),
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(32),
                    label: Text('Search'),
                    border: OutlineInputBorder(),
                    hintText: 'Enter a city',
                    suffixIcon:
                        IconButton(onPressed: () {}, icon: Icon(Icons.search))),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Weathersearvice {
  Future<WeatherModel?> getWeather({required String CityName}) async {
    WeatherModel? weather;
    try {
      String baseUrl = 'http://api.weatherapi.com/v1';
      String abikey = '61696612f42f48dfaad122448242107';
      Uri url = Uri.parse(
          '$baseUrl/forecast.json?key=$abikey&q=$CityName&days=1&aqi=no&alerts=no');
      http.Response response = await http.get(url);
      Map<String, dynamic> data = jsonDecode(response.body);
      var jsondata = data['forecast']['forecastday'][0];
      weather = WeatherModel.fromjson(data);
    } catch (e) {
      print(e);
    }
    return weather;
  }
}
