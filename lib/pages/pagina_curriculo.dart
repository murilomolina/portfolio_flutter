import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_flutter/components/tabela_competencias.dart';
import 'package:portfolio_flutter/utils/breakpoints.dart';
import 'package:widget_zoom/widget_zoom.dart';

class PaginaCurriculo extends StatefulWidget {
  const PaginaCurriculo({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _PaginaCurriculoState createState() => _PaginaCurriculoState();
}

class _PaginaCurriculoState extends State<PaginaCurriculo> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPage);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    double paddingPercentage = 0.05;
    final paddingValue = screenWidth * paddingPercentage;
    int numPag = 2; //numero de páginas quando o carrossel é exibido

    return Scaffold(
      body: Container(
        color: const Color.fromARGB(255, 2, 36, 63),
        child: LayoutBuilder(builder: (context, constraints) {
          var maxWidth = constraints.maxWidth;
          if (screenWidth <= tabletBreakpoint) {
            return Padding(
              padding:  EdgeInsets.all(defineMargin(maxWidth)),
              child: Stack(
                children: [
                  PageView(
                    controller: _pageController,
                    onPageChanged: (index) {
                      setState(() {
                        _currentPage = index;
                      });
                    },
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          children: [
                            const Text(
                              "Clique no curriculo para dar zoom!",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                            ),
                            const Text("Na barra lateral (esquerda, ultimo item) é possível fazer o download do currículo em PDF!",
                              style:
                                    TextStyle(color: Colors.white, fontSize: 14),
                            ),
                            Padding(
                              padding: EdgeInsets.all(paddingValue),
                              child: WidgetZoom(
                                heroAnimationTag: 'tag',
                                zoomWidget: Image.asset(
                                  'lib/assets/curriculo/curriculo.jpg',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(paddingValue),
                        child: const CupertinoScrollbar(
                          thumbVisibility: true,
                          thickness: 10,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Column(
                              children: [
                                Text(
                                  'Minhas Competências:',
                                  style: TextStyle(
                                    fontSize: 34,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 255, 255, 255),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                TabelaCompetencias(),
                                SizedBox(height: 10.0),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.arrow_back),
                          onPressed: () {
                            if (_currentPage > 0) {
                              _pageController.previousPage(
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.ease,
                              );
                            } else {
                              _pageController.animateToPage(
                                1,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.ease,
                              );
                            }
                          },
                          color: Colors.white,
                        ),
                        SizedBox(
                          child: Text('${_currentPage + 1}/$numPag',
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255))),
                        ), // Espaçamento entre os ícones e o certificado
                        IconButton(
                          icon: const Icon(Icons.arrow_forward),
                          onPressed: () {
                            if (_currentPage < 1) {
                              _pageController.nextPage(
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.ease,
                              );
                            } else {
                              _pageController.animateToPage(
                                0,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.ease,
                              );
                            }
                          },
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Column(
              children: [
                const Text(
                  "Clique no curriculo para dar zoom!",
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
                const Text("Na barra lateral (esquerda, ultimo item) é possível fazer o download do currículo em PDF!",
                            style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                          ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(paddingValue),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          WidgetZoom(
                            heroAnimationTag: 'tag',
                            zoomWidget: Image.asset(
                              'lib/assets/curriculo/curriculo.jpg',
                            ),
                          ),
                          const SizedBox(width: 20.0),
                          const CupertinoScrollbar(
                            thumbVisibility: true,
                            thickness: 10,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Column(
                                children: [
                                  Text(
                                    'Minhas Competências:',
                                    style: TextStyle(
                                      fontSize: 34,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 255, 255, 255),
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  TabelaCompetencias(),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          }
        }),
      ),
    );
  }
}