import 'package:flutter/material.dart';

class CertificadoBox extends StatelessWidget {
  final String text;

  const CertificadoBox({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 138, 147, 231),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Image.asset(
        text,
      )
    );
  }
}
