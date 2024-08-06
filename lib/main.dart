import 'package:flutter/material.dart';
import 'package:weather_app/Providers/weather_provider.dart';
import 'package:weather_app/models/weather%20model.dart';
import 'package:weather_app/views/home_view.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(WeatherApp());
}

class WeatherApp extends StatelessWidget {
  WeatherModel? weather;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return WeatherProvider();
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        debugShowMaterialGrid: false,
        theme:
            ThemeData(primarySwatch: Colors.blue, brightness: Brightness.dark),
        home: HomeView(),
      ),
    );
  }
}
