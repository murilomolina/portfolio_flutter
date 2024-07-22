import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portfolio_flutter/pages/home_page.dart';

void main() {
  runApp(const MaterialApp(
    home: HomePage(),
    debugShowCheckedModeBanner: false,
  ));
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp, // Bloqueia a orientação no modo retrato
  ]);
}