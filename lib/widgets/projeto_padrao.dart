import 'package:flutter/material.dart';
import 'package:portfolio_flutter/widgets/link_clicavel.dart';

class ProjetoPadrao extends StatelessWidget {
  final String imagem;
  final String titulo;
  final String descricao;
  final String urlProjeto;

  const ProjetoPadrao({
    Key? key,
    required this.imagem,
    required this.titulo,
    required this.descricao,
    required this.urlProjeto,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenheight = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.only(top: 40.0, bottom: 40.0,left: 40.0, right: 40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(imagem, width: screenWidth * 0.3),
              const SizedBox(width: 20),
              Flexible(
                child: SizedBox(
                  height: screenheight * 0.25,
                  child: SingleChildScrollView(
                    child: Text(
                      descricao,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          LinkClicavel(
              text: 'Clique aqui para acessar repositório do projeto!', url: urlProjeto),
        ],
      ),
    );
  }
}
