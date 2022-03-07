import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weatherforecast/Model/model.dart';
import 'package:weatherforecast/Util/convert_icon.dart';
import 'package:weatherforecast/Util/forecast_util.dart';

Widget forecastCard(AsyncSnapshot<WeatherForecastModel> snapshot, int index) {
  var forecastList = snapshot.data?.list;
  var temperatureMax = (forecastList[index].main.tempMax);
  var temperatureMin = (forecastList[index].main.tempMin);
  var dayOfWeek = "";
  DateTime date =
      DateTime.fromMillisecondsSinceEpoch(forecastList[index].dt * 1000);
  var fullDate = Util.getFormattedDate(date);
  dayOfWeek = fullDate.split(",")[0];
  var timeOfDay = "";
  var time = forecastList[index].dtTxt.toString();
  timeOfDay = time.split(" ")[1];

  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Center(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(dayOfWeek + " " + timeOfDay),
      )),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: 33,
            child: getWeatherIcon(
                weatherDescription: forecastList[index].weather[0].main,
                color: Colors.amber,
                size: 50),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  children: [
                    Text("${temperatureMax.toStringAsFixed(0)} °C"),
                    Icon(CupertinoIcons.arrow_up_circle_fill)
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  children: [
                    Text("${temperatureMin.toStringAsFixed(0)} °C"),
                    Icon(CupertinoIcons.arrow_down_circle_fill)
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 4.0),
                child: Text("Hum : ${forecastList[index].main.humidity} %"),
              ),
            ],
          )
        ],
      )
    ],
  );
}
