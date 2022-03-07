import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weatherforecast/Model/model.dart';
import 'package:weatherforecast/Network/network.dart';
import 'package:weatherforecast/UI/bottom_view.dart';
import 'package:weatherforecast/Util/convert_icon.dart';

import 'mid_view.dart';

class WeatherForecast extends StatefulWidget {
  const WeatherForecast({Key? key}) : super(key: key);

  @override
  _WeatherForecastState createState() => _WeatherForecastState();
}

class _WeatherForecastState extends State<WeatherForecast>
    with TickerProviderStateMixin {
  late Future<WeatherForecastModel> forecastObject;
  String _cityName = "Nairobi";


  late AnimationController animationController;

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(duration: Duration(seconds: 5), vsync: this);
    animationController.repeat();

    forecastObject = getWeather(cityName: _cityName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FutureBuilder(
          future: forecastObject,
          builder: (BuildContext context,
              AsyncSnapshot<WeatherForecastModel> snapshot) {
            if (snapshot.hasData) {
              var forecastList = snapshot.data?.list;
              return getWeatherBackground(weatherDescription: forecastList[0].weather[0].main);
            } else {
              return Center(
                  child: CircularProgressIndicator(
                    valueColor: animationController.drive(
                        ColorTween(begin: Colors.blueAccent, end: Colors.red)),
                  ));
            }
          }),
          ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: textFieldView(),
            ),
            FutureBuilder(
                future: forecastObject,
                builder: (BuildContext context,
                    AsyncSnapshot<WeatherForecastModel> snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: [
                        midView(snapshot),
                        const SizedBox(),
                        bottomview(snapshot, context)
                      ],
                    );
                  } else {
                    return Center(
                        child: CircularProgressIndicator(
                      valueColor: animationController.drive(
                          ColorTween(begin: Colors.blueAccent, end: Colors.red)),
                    ));
                  }
                }),
          ],
        ),]
      ),
    );
  }

  // Widget background(AsyncSnapshot<WeatherForecastModel> snapshot){
  //   var forecastList = snapshot.data?.list;
  //   return getWeatherBackground(weatherDescription: forecastList[0].weather[0].main,);
  // }

  Widget textFieldView() {
    return TextField(
      decoration: InputDecoration(
          hintText: "Enter City Name",
          prefixIcon: const Icon(CupertinoIcons.search),
          contentPadding: const EdgeInsets.all(8),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10), gapPadding: 10)),
      onSubmitted: (value) {
        setState(() {
          _cityName = value;
          forecastObject = getWeather(cityName: _cityName);
        });
      },
    );
  }

  Future<WeatherForecastModel> getWeather({required String cityName}) =>
      Network().getWeatherForecast(cityName: _cityName);
}
