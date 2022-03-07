import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weatherforecast/Model/model.dart';
import 'package:weatherforecast/Util/convert_icon.dart';
import 'package:weatherforecast/Util/forecast_util.dart';


Widget midView(AsyncSnapshot<WeatherForecastModel> snapshot) {
  var forecastList = snapshot.data?.list;
  var country = snapshot.data?.city.country;
  var city = snapshot.data?.city.name;
  var formattedDate =
      DateTime.fromMillisecondsSinceEpoch(forecastList[0].dt * 1000);
  var temperature = (forecastList[0].main.temp);

  Container midView = Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 14.0),
          child: Text(
            "$city, $country",
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ),
        Text(
          Util.getFormattedDate(formattedDate),
          style: const TextStyle(fontSize: 14),
        ),
        const SizedBox(),
        // const Icon(
        //   FontAwesomeIcons.cloud,
        //   size: 195,
        // ),
        getWeatherIcon(weatherDescription: forecastList[0].weather[0].main, color: Colors.amber, size: 195),


        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${temperature.toStringAsFixed(0)} °C",
                style: const TextStyle(fontSize: 34),
              ),
              Text(
                "   ${forecastList[0].weather[0].description.toUpperCase()}",
                style: const TextStyle(fontStyle: FontStyle.italic),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text(
                    "${(forecastList[0].wind.speed).toStringAsFixed(0)} Km/h",
                    style: const TextStyle(color: Colors.lightBlue),
                  ),
                  const Icon(
                    FontAwesomeIcons.wind,
                    color: Colors.lightBlue,
                    size: 20,
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      "${forecastList[0].main.humidity} %",
                      style: const TextStyle(color: Colors.brown),
                    ),
                    const Icon(
                      FontAwesomeIcons.solidGrinBeamSweat,
                      size: 20,
                      color: Colors.brown,
                    )
                  ],
                ),
              ),
              Column(
                children: [
                  Text(
                      "${(forecastList[0].main.tempMax ).toStringAsFixed(0)} °C "),
                  const Icon(
                    FontAwesomeIcons.temperatureHigh,
                    size: 20,
                  )
                ],
              )
            ],
          ),
        ),
      ],
    ),
  );

  return midView;
}
