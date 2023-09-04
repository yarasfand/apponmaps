import 'package:flutter/material.dart';
import 'package:mapsdoing/home/addressonmaps.dart';
import 'package:mapsdoing/home/getlatlong.dart';
import 'package:mapsdoing/home/goonmap.dart';
import 'package:mapsdoing/home/homebody.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      routes: {
        '/latLong': (context) => getLatLong(),
        '/searchonamp': (context) => doSearchOnMap(),
        '/homeonmap': (context) => addressOnMap()
      },
    );
  }
}
