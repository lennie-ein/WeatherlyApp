import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_weather_bg_null_safety/bg/weather_bg.dart';
import 'package:flutter_weather_bg_null_safety/flutter_weather_bg.dart';
import 'package:flutter_weather_bg_null_safety/utils/weather_type.dart';

Widget getWeatherIcon(
    {
    required String weatherDescription,
    required Color color,
    required double size}) {
  // var forecastList = snapshot.data?.list;

  switch(weatherDescription) {
    case "Clear":
      { return Icon(FontAwesomeIcons.sun, color: color, size: size); }
    case "Clouds":
      { return Icon(FontAwesomeIcons.cloud, color: color, size: size); }
    case "Rain":
      { return Icon(FontAwesomeIcons.cloudRain,color: color,size: size,);}
    case "Snow":
      {return Icon(FontAwesomeIcons.snowman,color: color,size: size,);}
    default: {return Icon(FontAwesomeIcons.sun,color: color,size: size,);}

  }
}

Widget getWeatherBackground({required String weatherDescription,}){

  switch(weatherDescription) {
    case "Clear":
      { return WeatherBg(weatherType: WeatherType.sunny, width: 1280, height: 1920); }
    case "Clouds":
      { return WeatherBg(weatherType: WeatherType.cloudy, width: 1280, height: 1920); }
    case "Rain":
      { return WeatherBg(weatherType: WeatherType.middleRainy, width: 1280, height: 1920);}
    case "Snow":
      {return WeatherBg(weatherType: WeatherType.middleSnow, width: 1280, height: 1920);}
    default: {return WeatherBg(weatherType: WeatherType.sunny, width: 1280, height: 1920);}

  }
}