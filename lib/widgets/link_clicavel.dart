import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LinkClicavel extends StatelessWidget {
  final String text;
  final String url;

  const LinkClicavel({super.key, required this.text, required this.url});

  void _abrirLink() async {
    // ignore: deprecated_member_use
    if (await canLaunch(url)) {
      // ignore: deprecated_member_use
      await launch(url);
    } else {
      throw 'Não foi possível abrir o link: $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _abrirLink();
      },
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.blue,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}