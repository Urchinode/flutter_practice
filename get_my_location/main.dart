import 'package:flutter/material.dart';
import 'package:flutter_practice/screens/weather_page.dart';

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        fontFamily: 'gmarket',
      ),
      debugShowCheckedModeBanner: false,
      home: const WeatherPage(),
      // home: TextToSpeechTest(),
    );
  }
}
