import 'package:flutter/material.dart';
import 'package:portfolio_flutter/widgets/certificado_box.dart';

class ContCertificados extends StatelessWidget {
  const ContCertificados({super.key});

  @override
  Widget build(BuildContext context) {
    return const Wrap(
      spacing: 5.0,
      runSpacing: 50.0,
      alignment: WrapAlignment.spaceAround,
      children: [
        CertificadoBox(
          text:
              'lib/assets/certificados/AWS_Academy_Graduate___AWS_Academy_Cloud_Foundations_Badge20230603-28-jswue9_page-0001.jpg',
        ),
        CertificadoBox(
          text: 'lib/assets/certificados/clmsCertificate_page-0001.jpg',
        ),
        CertificadoBox(
          text:
              'lib/assets/certificados/CM3033-IntrodjucaoaCienciadjeDadjos-2023 (1)_page-0001.jpg',
        ),
        CertificadoBox(
          text:
              'lib/assets/certificados/CM4042-FundjamentosdjeComputacaoemNuvem-AWSAcadjemy-2023 (1)_page-0001.jpg',
        ),
        CertificadoBox(
          text: 
              'lib/assets/certificados/CC2011-DesenvolvimentodjeAplicacoesHibridjascomFlutter-2023_page-0001.jpg',
        ),
        CertificadoBox(
          text: 
              'lib/assets/certificados/CM2072-PreparatorioparaDesafiosdjeSegurancaCibernetica-2023_page-0001.jpg',
        ),
      ],
    );
  }
}
