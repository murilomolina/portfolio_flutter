import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_flutter/utils/breakpoints.dart';
import 'package:portfolio_flutter/utils/descricao_projetos.dart';
import 'package:portfolio_flutter/widgets/link_clicavel.dart';
import 'package:portfolio_flutter/widgets/video_manager.dart';

class PaginaProjetos extends StatefulWidget {
  const PaginaProjetos({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _PaginaProjetosState createState() => _PaginaProjetosState();
}

class _PaginaProjetosState extends State<PaginaProjetos> {
  final projetos = [
    const (
      imagem: 'lib/assets/pre_exibicao/proj_missao_ambiental.jpg',
      titulo: 'Projeto Site Missão Ambiental',
      descricao: descricao_proj_missao_ambiental,
      urlProjeto: 'https://github.com/Parelho/PI_2_Semestre',
      isvideo: false
    ),
    const (
      imagem: 'lib/assets/pre_exibicao/exemplo.jpg',
      titulo: 'Documento de Memorial de Cálculos Básicos para OODC e EIV/RIT',
      descricao: descricao_proj_gerar_doc,
      urlProjeto: 'https://github.com/murilomolina?tab=repositories',
      isvideo: false
    ),
    const (
      descricao: descricao_proj_relatorio_eizemitz,
      titulo: 'Webscrapping/Extração de dados e envio de relatorio para a empresa EizeMitz',
      urlProjeto: 'https://github.com/murilomolina/relatorio_diario_eizemitz.git',
      imagem: 'lib/assets/pre_exibicao/eizemitz_executado.mp4',
      isvideo: true
      )
  ];

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
    final isTabletOrBigger = MediaQuery.of(context).size.width >= tabletBreakpoint;
    int numProjetos = projetos.length;
    var screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 2, 36, 63),
        body: Center(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Stack(
                children: [
                  PageView.builder(
                    controller: _pageController,
                    itemCount: projetos.length,
                    onPageChanged: (index) {
                      setState(() {
                        _currentPage = index;
                      });
                    },
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.all(defineMargin(screenWidth)),
                        child: isTabletOrBigger
                            ? Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          projetos[index].titulo,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        Expanded(
                                          child: SingleChildScrollView(
                                            child: Text(
                                              projetos[index].descricao,
                                              style: const TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                        LinkClicavel(
                                          text:
                                              'Clique aqui para acessar repositório do projeto!',
                                          url: projetos[index].urlProjeto,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: (projetos[index].isvideo) ?
                                  AspectRatio(
                                    aspectRatio: 16 / 9,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10.0),
                                      child: VideoManager(videoPath: projetos[index].imagem)
                                    ),
                                  ): AspectRatio(
                                    aspectRatio: 16 / 9,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10.0),
                                      child: Image.asset(
                                        projetos[index].imagem,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  ),
                                ],
                              )
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    projetos[index].titulo,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  (projetos[index].isvideo) ?
                                  AspectRatio(
                                    aspectRatio: 16 / 9,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10.0),
                                      child: VideoManager(videoPath: projetos[index].imagem),
                                    ),
                                  ): AspectRatio(
                                    aspectRatio: 16 / 9,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10.0),
                                      child: Image.asset(
                                        projetos[index].imagem,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Expanded(
                                    child: CupertinoScrollbar(
                                      thickness: 10,
                                      thumbVisibility: true,
                                      child: SingleChildScrollView(
                                        child: Column(
                                          children: [
                                            Text(
                                              projetos[index].descricao,
                                              style: const TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                            const SizedBox(height: 10),
                                            LinkClicavel(
                                              text:
                                                  'Clique aqui para acessar repositório do projeto!',
                                              url: projetos[index].urlProjeto,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                      );
                    },
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
                                projetos.length - 1,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.ease,
                              );
                            }
                          },
                          color: Colors.white,
                        ),
                        SizedBox(
                          child: Text('${_currentPage + 1}/$numProjetos',
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255))),
                        ),
                        IconButton(
                          icon: const Icon(Icons.arrow_forward),
                          onPressed: () {
                            if (_currentPage < projetos.length - 1) {
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
              );
            },
          ),
        ),
      ),
    );
  }
}
