import 'package:flutter/material.dart';
import 'package:portfolio_flutter/utils/breakpoints.dart';

class TabelaCompetencias extends StatelessWidget {
  const TabelaCompetencias({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: LayoutBuilder(builder: (context, constraints) {
        final screenWidth = MediaQuery.of(context).size.width;
        double fonte = screenWidth < mobileBreakpoint ? 19.0 : 20.0;
        const fontSizeMin = 18.0;
        if (fonte < fontSizeMin) {
          fonte = fontSizeMin;
        }

        return Scrollbar(
          thumbVisibility: true,
          thickness: 10,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Center(
              child: Align(
                alignment: Alignment.center,
                child: FittedBox(
                  child: DataTable(
                    // ignore: deprecated_member_use
                    dataRowHeight: 60.0,
                    columns: const [
                      DataColumn(
                        label: Text(
                          'Competência',
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          // textAlign: TextAlign.center,
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Instituição',
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          // textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                    rows: [
                      DataRow(cells: [
                        DataCell(
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              'Banco de Dados',
                              style: TextStyle(
                                fontSize: fonte,
                                color: Colors.white,
                              ),
                              maxLines: 3,
                              // textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        DataCell(
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              'IMT - Mauá\nInstituto Mauá de Tecnologia\n',
                              style: TextStyle(
                                fontSize: fonte,
                                color: Colors.white,
                              ),
                              // textAlign: TextAlign.center,
                              maxLines: 3,
                            ),
                          ),
                        ),
                      ]),
                      DataRow(cells: [
                        DataCell(
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              'SQL',
                              style: TextStyle(
                                fontSize: fonte,
                                color: Colors.white,
                              ),
                              // textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        DataCell(
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              'IMT - Mauá\nInstituto Mauá de Tecnologia\n',
                              style: TextStyle(
                                fontSize: fonte,
                                color: Colors.white,
                              ),
                              // textAlign: TextAlign.center,
                              maxLines: 3,
                            ),
                          ),
                        ),
                      ]),
                      DataRow(cells: [
                        DataCell(
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              'Ciência de Dados',
                              style: TextStyle(
                                fontSize: fonte,
                                color: Colors.white,
                              ),
                              // textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        DataCell(
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              'IMT - Mauá\nInstituto Mauá de Tecnologia\n',
                              style: TextStyle(
                                fontSize: fonte,
                                color: Colors.white,
                              ),
                              // textAlign: TextAlign.center,
                              maxLines: 3,
                            ),
                          ),
                        ),
                      ]),
                      DataRow(cells: [
                        DataCell(
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              'Microsoft Azure',
                              style: TextStyle(
                                fontSize: fonte,
                                color: Colors.white,
                              ),
                              // textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        DataCell(
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              'IMT - Mauá\nInstituto Mauá de Tecnologia\n',
                              style: TextStyle(
                                fontSize: fonte,
                                color: Colors.white,
                              ),
                              // textAlign: TextAlign.center,
                              maxLines: 3,
                            ),
                          ),
                        ),
                      ]),
                      DataRow(cells: [
                        DataCell(
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              'Python',
                              style: TextStyle(
                                fontSize: fonte,
                                color: Colors.white,
                              ),
                              // textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        DataCell(
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              'IMT - Mauá\nInstituto Mauá de Tecnologia\n',
                              style: TextStyle(
                                fontSize: fonte,
                                color: Colors.white,
                              ),
                              // textAlign: TextAlign.center,
                              maxLines: 3,
                            ),
                          ),
                        ),
                      ]),
                      DataRow(cells: [
                        DataCell(
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              'Modelagem de Dados',
                              style: TextStyle(
                                fontSize: fonte,
                                color: Colors.white,
                              ),
                              // textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        DataCell(
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              'IMT - Mauá\nInstituto Mauá de Tecnologia\n',
                              style: TextStyle(
                                fontSize: fonte,
                                color: Colors.white,
                              ),
                              // textAlign: TextAlign.center,
                              maxLines: 3,
                            ),
                          ),
                        ),
                      ]),
                      DataRow(cells: [
                        DataCell(
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              'Java',
                              style: TextStyle(
                                fontSize: fonte,
                                color: Colors.white,
                              ),
                              // textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        DataCell(
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              'IMT - Mauá\nInstituto Mauá de Tecnologia\n',
                              style: TextStyle(
                                fontSize: fonte,
                                color: Colors.white,
                              ),
                              // textAlign: TextAlign.center,
                              maxLines: 3,
                            ),
                          ),
                        ),
                      ]),
                      DataRow(cells: [
                        DataCell(
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              'UML\n(Linguagem de modelagem unificada)',
                              style: TextStyle(
                                fontSize: fonte,
                                color: Colors.white,
                              ),
                              // textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        DataCell(
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              'IMT - Mauá\nInstituto Mauá de Tecnologia\n',
                              style: TextStyle(
                                fontSize: fonte,
                                color: Colors.white,
                              ),
                              // textAlign: TextAlign.center,
                              maxLines: 3,
                            ),
                          ),
                        ),
                      ]),
                      DataRow(cells: [
                        DataCell(
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              'Desenvolvimento Front End',
                              style: TextStyle(
                                fontSize: fonte,
                                color: Colors.white,
                              ),
                              // textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        DataCell(
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              'IMT - Mauá\nInstituto Mauá de Tecnologia\n',
                              style: TextStyle(
                                fontSize: fonte,
                                color: Colors.white,
                              ),
                              // textAlign: TextAlign.center,
                              maxLines: 3,
                            ),
                          ),
                        ),
                      ]),
                      DataRow(cells: [
                        DataCell(
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              'Dart/flutter',
                              style: TextStyle(
                                fontSize: fonte,
                                color: Colors.white,
                              ),
                              // textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        DataCell(
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              'IMT - Mauá\nInstituto Mauá de Tecnologia\n',
                              style: TextStyle(
                                fontSize: fonte,
                                color: Colors.white,
                              ),
                              // textAlign: TextAlign.center,
                              maxLines: 3,
                            ),
                          ),
                        ),
                      ]),
                      DataRow(cells: [
                        DataCell(
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              'UI/UX',
                              style: TextStyle(
                                fontSize: fonte,
                                color: Colors.white,
                              ),
                              // textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        DataCell(
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              'IMT - Mauá\nInstituto Mauá de Tecnologia\n',
                              style: TextStyle(
                                fontSize: fonte,
                                color: Colors.white,
                              ),
                              // textAlign: TextAlign.center,
                              maxLines: 3,
                            ),
                          ),
                        ),
                      ]),
                      DataRow(cells: [
                        DataCell(
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              'Microsoft Azure',
                              style: TextStyle(
                                fontSize: fonte,
                                color: Colors.white,
                              ),
                              // textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        DataCell(
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              'IMT - Mauá\nInstituto Mauá de Tecnologia\n',
                              style: TextStyle(
                                fontSize: fonte,
                                color: Colors.white,
                              ),
                              // textAlign: TextAlign.center,
                              maxLines: 3,
                            ),
                          ),
                        ),
                      ]),
                      DataRow(cells: [
                        DataCell(
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              'AWS(cloud)',
                              style: TextStyle(
                                fontSize: fonte,
                                color: Colors.white,
                              ),
                              // textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        DataCell(
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              'IMT - Mauá\nInstituto Mauá de Tecnologia\n',
                              style: TextStyle(
                                fontSize: fonte,
                                color: Colors.white,
                              ),
                              // textAlign: TextAlign.center,
                              maxLines: 3,
                            ),
                          ),
                        ),
                      ]),
                      DataRow(cells: [
                        DataCell(
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              'Android Studio',
                              style: TextStyle(
                                fontSize: fonte,
                                color: Colors.white,
                              ),
                              // textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        DataCell(
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              'IMT - Mauá\nInstituto Mauá de Tecnologia\n',
                              style: TextStyle(
                                fontSize: fonte,
                                color: Colors.white,
                              ),
                              // textAlign: TextAlign.center,
                              maxLines: 3,
                            ),
                          ),
                        ),
                      ]),
                      DataRow(cells: [
                        DataCell(
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              'C#',
                              style: TextStyle(
                                fontSize: fonte,
                                color: Colors.white,
                              ),
                              // textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        DataCell(
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              'IMT - Mauá\nInstituto Mauá de Tecnologia\n',
                              style: TextStyle(
                                fontSize: fonte,
                                color: Colors.white,
                              ),
                              // textAlign: TextAlign.center,
                              maxLines: 3,
                            ),
                          ),
                        ),
                      ]),
                      DataRow(cells: [
                        DataCell(
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              'JavaScript',
                              style: TextStyle(
                                fontSize: fonte,
                                color: Colors.white,
                              ),
                              // textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        DataCell(
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              'IMT - Mauá\nInstituto Mauá de Tecnologia\n',
                              style: TextStyle(
                                fontSize: fonte,
                                color: Colors.white,
                              ),
                              // textAlign: TextAlign.center,
                              maxLines: 3,
                            ),
                          ),
                        ),
                      ]),
                      DataRow(cells: [
                        DataCell(
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              'HTML/Css',
                              style: TextStyle(
                                fontSize: fonte,
                                color: Colors.white,
                              ),
                              // textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        DataCell(
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              'IMT - Mauá\nInstituto Mauá de Tecnologia\n',
                              style: TextStyle(
                                fontSize: fonte,
                                color: Colors.white,
                              ),
                              // textAlign: TextAlign.center,
                              maxLines: 3,
                            ),
                          ),
                        ),
                      ]),
                      DataRow(cells: [
                        DataCell(
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              'Automação de processos/Webscrapping (Python)',
                              style: TextStyle(
                                fontSize: fonte,
                                color: Colors.white,
                              ),
                              // textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        DataCell(
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              'IMT - Mauá\nInstituto Mauá de Tecnologia\n',
                              style: TextStyle(
                                fontSize: fonte,
                                color: Colors.white,
                              ),
                              // textAlign: TextAlign.center,
                              maxLines: 3,
                            ),
                          ),
                        ),
                      ]),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
