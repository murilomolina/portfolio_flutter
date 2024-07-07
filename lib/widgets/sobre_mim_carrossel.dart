import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_flutter/utils/breakpoints.dart';
import 'package:carousel_slider/carousel_slider.dart';

class SobreMimCarrossel extends StatefulWidget {
  const SobreMimCarrossel({super.key});

  @override
  State<SobreMimCarrossel> createState() => _SobreMimCarrosselState();
}

class _SobreMimCarrosselState extends State<SobreMimCarrossel> {
  int _currentIndex = 0;
  final CarouselController _controller = CarouselController();

  final List<String> textItems = [
    "Bem-vindo ao meu portfólio, desenvolvido inteiramente por mim, utilizando Dart/Flutter. Aqui, você encontrará meus projetos, certificados e informações sobre minha trajetória. Aprecie sua visita e sinta-se à vontade para entrar em contato!",
    "Sou um desenvolvedor back-end e front-end, tenho 21 anos, moro em Santo André, São Paulo. Estou cursando o terceiro semestre de Ciência da Computação pelo IMT - Mauá - Instituto Mauá de Tecnologia. Fluente em inglês há 5 anos",
  ];

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return Container(
      color: const Color.fromARGB(255, 2, 36, 63),
      child: Padding(
        padding: EdgeInsets.all(defineMargin(screenWidth)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  '\nOLÁ! EU SOU O MURILO MOLINA BARONE',
                  style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: CarouselSlider(
                      items: textItems.map((item) => 
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: CupertinoScrollbar(
                              thumbVisibility: true,
                              thickness: 10,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child: Text(
                                  item,
                                  style: const TextStyle(
                                    fontSize: 20, 
                                    color: Color.fromARGB(255, 255, 255, 255),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ).toList(),
                      carouselController: _controller,
                      options: CarouselOptions(
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 6),
                        enlargeCenterPage: true,
                        viewportFraction: 1.0,
                        aspectRatio: 2.0,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _currentIndex = index;
                          });
                        },
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: textItems.map((item) {
                      int index = textItems.indexOf(item);
                      return GestureDetector(
                        onTap: () => _controller.animateToPage(index),
                        child: Container(
                          width: 15.0,
                          height: 8.0,
                          margin: const EdgeInsets.only(top: 3.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _currentIndex == index
                                ? const Color.fromARGB(255, 255, 255, 255)
                                : const Color.fromARGB(102, 255, 255, 255),
                          ),
                        ),
                      );
                    }).toList(),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
