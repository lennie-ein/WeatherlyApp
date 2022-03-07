import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_weather_bg_null_safety/bg/weather_bg.dart';
import 'package:flutter_weather_bg_null_safety/bg/weather_cloud_bg.dart';
import 'package:flutter_weather_bg_null_safety/bg/weather_color_bg.dart';
import 'package:flutter_weather_bg_null_safety/bg/weather_night_star_bg.dart';
import 'package:flutter_weather_bg_null_safety/bg/weather_rain_snow_bg.dart';
import 'package:flutter_weather_bg_null_safety/bg/weather_thunder_bg.dart';
import 'package:flutter_weather_bg_null_safety/flutter_weather_bg.dart';
import 'package:flutter_weather_bg_null_safety/utils/image_utils.dart';
import 'package:flutter_weather_bg_null_safety/utils/print_utils.dart';
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
      break;
    case "Clouds":
      { return Icon(FontAwesomeIcons.cloud, color: color, size: size); }
      break;
    case "Rain":
      { return Icon(FontAwesomeIcons.cloudRain,color: color,size: size,);}
      break;
    case "Snow":
      {return Icon(FontAwesomeIcons.snowman,color: color,size: size,);}
      break;
    default: {return Icon(FontAwesomeIcons.sun,color: color,size: size,);}
    break;

  }
}

Widget getWeatherBackground({required String weatherDescription,}){

  switch(weatherDescription) {
    case "Clear":
      { return WeatherBg(weatherType: WeatherType.sunny, width: 1280, height: 1920); }
      break;
    case "Clouds":
      { return WeatherBg(weatherType: WeatherType.cloudy, width: 1280, height: 1920); }
      break;
    case "Rain":
      { return WeatherBg(weatherType: WeatherType.middleRainy, width: 1280, height: 1920);}
      break;
    case "Snow":
      {return WeatherBg(weatherType: WeatherType.middleSnow, width: 1280, height: 1920);}
      break;
    default: {return WeatherBg(weatherType: WeatherType.sunny, width: 1280, height: 1920);}
    break;

  }
}