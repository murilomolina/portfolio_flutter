import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SobreMim extends StatelessWidget {
  const SobreMim({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: const Color.fromARGB(255, 2, 36, 63),
        child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '\nOLÁ! EU SOU O MURILO MOLINA BARONE',
                style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 255, 255, 255)),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Text(
                'Bem-vindo ao meu portfólio, desenvolvido inteiramente por mim, utilizando Dart/Flutter. Aqui, você encontrará meus projetos, certificados e informações sobre minha trajetória. Aprecie sua visita e sinta-se à vontade para entrar em contato!\n\t\tSou um desenvolvedor back-end e front-end, tenho 21 anos, moro em Santo André, São Paulo. Estou cursando o terceiro semestre de Ciência da Computação pelo IMT - Mauá - Instituto Mauá de Tecnologia. Fluente em inglês há 5 anos',
                style: TextStyle(
                    fontSize: 20,
                    color: Color.fromARGB(255, 255, 255, 255)),
                textAlign: TextAlign.center,
              ),
            ]));
  }
}
