import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Providers/weather_provider.dart';
import 'package:weather_app/models/weather%20model.dart';
import 'package:weather_app/views/pages/searchPage.dart';
import 'package:weather_app/widgets/no_weather_body.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  void UpdateUi() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Weather App',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Searchpage(
                    UpdateUi: UpdateUi,
                  );
                }));
              },
              icon: Icon(Icons.search))
        ],
      ),
      body: Provider.of<WeatherProvider>(context, listen: true).weatherData ==
              null
          ? NoWeatherBody()
          : Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                Provider.of<WeatherProvider>(context).weatherData!.getColor(),
                Colors.orange
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
              child: Column(
                children: [
                  Spacer(flex: 2),
                  Text(
                    Provider.of<WeatherProvider>(context)
                        .weatherData!
                        .cityname
                        .toString(),
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  Text(
                    Provider.of<WeatherProvider>(context).weatherData!.date,
                    style: TextStyle(
                        fontSize: 22,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  Row(
                    children: [
                      Spacer(
                        flex: 1,
                      ),
                      Image.asset(Provider.of<WeatherProvider>(context)
                          .weatherData!
                          .getImage()
                          .toString()),
                      Spacer(
                        flex: 1,
                      ),
                      Text(
                          Provider.of<WeatherProvider>(context)
                              .weatherData!
                              .temp
                              .toInt()
                              .toString(),
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                      Spacer(
                        flex: 1,
                      ),
                      Column(
                        children: [
                          Text(
                              'Max : ' +
                                  Provider.of<WeatherProvider>(context)
                                      .weatherData!
                                      .maxtemp
                                      .toInt()
                                      .toString(),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22)),
                          Text(
                            'Min : ' +
                                Provider.of<WeatherProvider>(context)
                                    .weatherData!
                                    .mintemp
                                    .toInt()
                                    .toString(),
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 22),
                          )
                        ],
                      ),
                      Spacer(
                        flex: 1,
                      )
                    ],
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  Text(
                    Provider.of<WeatherProvider>(context)
                        .weatherData!
                        .weatherState,
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  Spacer(
                    flex: 4,
                  )
                ],
              ),
            ),
    );
  }
}
