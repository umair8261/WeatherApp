import 'package:flutter/material.dart';
import 'package:weather/lottie.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Weather App",
      home: SplashScreen(),
    );
  }
}
