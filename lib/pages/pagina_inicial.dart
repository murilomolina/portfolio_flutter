import 'package:flutter/material.dart';
import 'package:portfolio_flutter/components/sobre_mim.dart';
import 'package:portfolio_flutter/widgets/sobre_mim_carrossel.dart';
import 'package:portfolio_flutter/utils/breakpoints.dart';

class PaginaInicial extends StatelessWidget {
  const PaginaInicial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return  Scaffold(
      backgroundColor: const Color.fromARGB(255, 2, 36, 63),
      body: (screenWidth > tabletBreakpoint)?
      Padding(
        padding: EdgeInsets.all(defineMargin(screenWidth)),
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SobreMim()
            ],
          ),
        ),
      ):
      const SobreMimCarrossel(),
    );
  }
}