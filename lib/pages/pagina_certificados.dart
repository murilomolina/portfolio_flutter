import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:portfolio_flutter/widgets/certificado_box.dart';

class PaginaCertificados extends StatefulWidget {
  const PaginaCertificados({Key? key}) : super(key: key);

  @override
  State<PaginaCertificados> createState() => _PaginaCertificadosState();
}

class _PaginaCertificadosState extends State<PaginaCertificados> {
  final certificados = [
    const CertificadoBox(
      text:
          'lib/assets/certificados/AWS_Academy_Graduate___AWS_Academy_Cloud_Foundations_Badge20230603-28-jswue9_page-0001.jpg',
    ),
    const CertificadoBox(
      text: 'lib/assets/certificados/clmsCertificate_page-0001.jpg',
    ),
    const CertificadoBox(
      text:
          'lib/assets/certificados/CM3033-IntrodjucaoaCienciadjeDadjos-2023 (1)_page-0001.jpg',
    ),
    const CertificadoBox(
      text:
          'lib/assets/certificados/CM4042-FundjamentosdjeComputacaoemNuvem-AWSAcadjemy-2023 (1)_page-0001.jpg',
    ),
    const CertificadoBox(
      text:
          'lib/assets/certificados/CC2011-DesenvolvimentodjeAplicacoesHibridjascomFlutter-2023_page-0001.jpg',
    ),
    const CertificadoBox(
      text:
          'lib/assets/certificados/CM2072-PreparatorioparaDesafiosdjeSegurancaCibernetica-2023_page-0001.jpg',
    ),
    const CertificadoBox(
      text:
          'lib/assets/certificados/CA4010-DescubraoPodjerdjoWebscrapingDomineaArtedjeExtrairDadjosdjaWeb-2024_page-0001.jpg',
    ),
    const CertificadoBox(
      text:
          'lib/assets/certificados/EN3016-DesenvolvimentodjeaplicativosdjecelularatravesdjoAndjroidjStudjio-2024_page-0001.jpg',
    ),
  ];

  late PageController _pageController;
  int _currentPage = 0;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPage);
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // var screenWidth = MediaQuery.of(context).size.width;
    int numCertificados = certificados.length;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 2, 36, 63),
      body: Padding(
        padding: const EdgeInsets.all(30), // optei por não deixar nòpadrão pois se não o texto do certificado fica muito pequeno, e o zoom não fica legal.
        child: LayoutBuilder(builder: (context, constraints) {
          return Stack(
            children: [
              PageView.builder(
                controller: _pageController,
                itemCount: certificados.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Center(
                          child: isLoading
                            ? LoadingAnimationWidget.discreteCircle(
                              color: Colors.white,
                              size: 100,
                              )
                              : SizedBox(
                                child: certificados[index],
                                )
                              ),
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
                                    duration:
                                        const Duration(milliseconds: 500),
                                    curve: Curves.ease,
                                  );
                                } else {
                                  _pageController.animateToPage(
                                      certificados.length - 1,
                                      duration:
                                          const Duration(milliseconds: 500),
                                      curve: Curves.ease);
                                }
                              },
                              color: Colors.white,
                            ),
                            SizedBox(
                              child: Text('${_currentPage +1}/$numCertificados', style: const TextStyle(color: Color.fromARGB(255, 255, 255, 255))),
                            ), // Espaçamento entre os ícones e o certificado
                            IconButton(
                              icon: const Icon(Icons.arrow_forward),
                              onPressed: () {
                                if (_currentPage < certificados.length - 1) {
                                  _pageController.nextPage(
                                    duration:
                                        const Duration(milliseconds: 500),
                                    curve: Curves.ease,
                                  );
                                } else {
                                  _pageController.animateToPage(0,
                                      duration:
                                          const Duration(milliseconds: 500),
                                      curve: Curves.ease);
                                }
                              },
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              )
            ],
          );
        }),
      ),
    );
  }
}
