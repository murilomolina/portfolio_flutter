// ignore_for_file: deprecated_member_use

import 'package:url_launcher/url_launcher.dart';

void linkWidget(url) async {
    if (await canLaunch(url)) {
      await launch(url);  // Abre a URL no navegador padrão do dispositivo
    } else {
      throw 'Não foi possível abrir $url';  // Trata erro se não puder abrir a URL
    }
  }