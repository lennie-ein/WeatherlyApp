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
      const SizedBox(height: 25),
      Text(
        "3 Hours Weather Forecast".toUpperCase(),
        style: const TextStyle(color: Colors.grey),
      ),
      const SizedBox(height: 25),
      Container(
        height: 170,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          separatorBuilder: (context, index) => const SizedBox(
            width: 8,
          ),
          itemCount: forecastList.length,
          itemBuilder: (context, index) => ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            child: Container(
              width: MediaQuery.of(context).size.width / 2.7,
              height: 160,
              child: forecastCard(snapshot, index),
              decoration: BoxDecoration(

                  gradient: LinearGradient(
                      colors: [Colors.blueGrey.withOpacity(0.2), Colors.black38.withOpacity(0.2)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight)),
            ),
          ),
        ),
      )
    ],
  );
}
