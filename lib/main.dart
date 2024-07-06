import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portfolio_flutter/pages/home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp, // Bloqueia a orientação no modo retrato
    DeviceOrientation.portraitDown, // Bloqueia a orientação no modo retrato invertido
    DeviceOrientation.landscapeLeft, // Bloqueia a orientação no modo paisagem (esquerda)
    DeviceOrientation.landscapeRight, // Bloqueia a orientação no modo paisagem (direita)
  ]).then((_) {
  runApp(const MaterialApp(
    home: HomePage(),
    debugShowCheckedModeBanner: false,
  ));
  });
}