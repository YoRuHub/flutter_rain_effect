import 'package:flutter/material.dart';
import 'package:flutter_rain_effect/flutter_rain_effect.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Rain Effect')),
        body: Center(
          child: Container(
            width: 300,
            height: 500,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 2.0,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(8.0)),
            ),
            child: const RainEffect(
              intensity: 1.0,
              rainColors: [Colors.lightBlue, Colors.cyan],
              splashCharacter: '*',
              minRainSize: 3.0,
              maxRainSize: 8.0,
              rainCharacter: [],
            ),
          ),
        ),
      ),
    );
  }
}
