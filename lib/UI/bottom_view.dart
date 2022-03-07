import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:weatherforecast/Model/model.dart';

import 'forecast_card.dart';

Widget bottomview(
    AsyncSnapshot<WeatherForecastModel> snapshot, BuildContext context) {
  var forecastList = snapshot.data?.list;


  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      SizedBox(height: 25),
      Text(
        "3 Hours Weather Forecast".toUpperCase(),
        style: TextStyle(color: Colors.grey),
      ),
      SizedBox(height: 25),
      Container(
        height: 170,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 16),
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          separatorBuilder: (context, index) => SizedBox(
            width: 8,
          ),
          itemCount: forecastList.length,
          itemBuilder: (context, index) => ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            child: Container(
              width: MediaQuery.of(context).size.width / 2.7,
              height: 160,
              child: forecastCard(snapshot, index),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.blueGrey, Colors.black38],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight)),
            ),
          ),
        ),
      )
    ],
  );
}
