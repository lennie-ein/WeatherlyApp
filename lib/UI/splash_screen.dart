import 'dart:async';

import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:weatherforecast/UI/weather_forecast.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: const Duration(seconds: 6),
      vsync: this,
    );
    animation = ColorTween(begin: Colors.blueGrey, end: Colors.white30)
        .animate(controller);
    controller.forward();
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reverse(from: 1.0);
      } else if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
      {}
    });

    controller.addListener(() {
      setState(() {});
    });

    Timer(
        const Duration(seconds: 6),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const WeatherForecast())));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Image.asset("assets/cloudycon.png"),
                  height: 120.0,
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 300.0,
              child: DefaultTextStyle(
                style: const TextStyle(
                  fontSize: 45.0,
                  color: Colors.black,
                  fontWeight: FontWeight.w900,
                ),
                child: AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText('Dr. Weatherly',
                        textAlign: TextAlign.center),
                    TypewriterAnimatedText('Your one stop weather updater'),
                    TypewriterAnimatedText('Dr. Weatherly',
                        textAlign: TextAlign.center),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
