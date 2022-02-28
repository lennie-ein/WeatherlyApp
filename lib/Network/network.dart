import 'dart:convert';

import 'package:http/http.dart';
import 'package:weatherforecast/Model/backup_model.dart';
import 'package:weatherforecast/Model/model.dart';
import 'package:weatherforecast/Util/config.dart';
import 'package:weatherforecast/Util/forecast_util.dart';

class Network {
  Future<WeatherForecastModel> getWeatherForecast({required String cityName}) async{
    var finalUrl = "https://api.openweathermap.org/data/2.5/forecast?q="+cityName+
        "&appid="+Config.appId + "&units=metric";

    final response = await get(Uri.parse(finalUrl));
    print("URL: ${Uri.parse(finalUrl)}");

    if (response.statusCode == 200) {
      print("weather data: ${response.body}");
      return WeatherForecastModel.fromJson(json.decode(response.body));
    }else {
      throw Exception("Error getting weather forecast");
    }


  }
}