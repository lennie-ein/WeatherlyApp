import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weatherforecast/Model/model.dart';
import 'package:weatherforecast/Network/network.dart';
import 'package:weatherforecast/UI/bottom_view.dart';



import 'mid_view.dart';

class WeatherForecast extends StatefulWidget {
  const WeatherForecast({Key? key}) : super(key: key);

  @override
  _WeatherForecastState createState() => _WeatherForecastState();
}

class _WeatherForecastState extends State<WeatherForecast> {
  late Future<WeatherForecastModel> forecastObject;
  String _cityName = "Nairobi";


  @override
  void initState() {
    super.initState();
    forecastObject = getWeather(cityName: _cityName);
    // print(getWeather(cityName: _cityName).then((welcome) => welcome.city.country));
    // forecastObject.then((value) => print(value.list[0].weather[0].main));


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
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
                  children: [midView(snapshot),
                  const SizedBox(),
                  bottomview(snapshot, context)],
                );
              } else {
                return const Center(child:CircularProgressIndicator());
              }
            }
          ),
        ],
      ),
    );
  }

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
