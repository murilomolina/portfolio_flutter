// ignore_for_file: deprecated_member_use, use_build_context_synchronously
import 'package:download/download.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portfolio_flutter/pages/pagina_certificados.dart';
import 'package:portfolio_flutter/pages/pagina_curriculo.dart';
import 'package:portfolio_flutter/pages/pagina_inicial.dart';
import 'package:portfolio_flutter/pages/pagina_projetos.dart';
import 'package:portfolio_flutter/utils/breakpoints.dart';
import 'package:portfolio_flutter/widgets/links_widget.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:widget_zoom/widget_zoom.dart';

bool isMobile(BuildContext context) {
  return MediaQuery.of(context).size.width < mobileBreakpoint;
}

bool isTablet(BuildContext context) {
  return MediaQuery.of(context).size.width < tabletBreakpoint;
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      final int newPage = _pageController.page!.round();
      if (newPage != _currentPage) {
        setState(() {
          _currentPage = newPage;
        });
      }
    });
  }

  Future<void> _launchEmail(String email) async {
    final Uri params = Uri(
      scheme: 'mailto',
      path: email,
      query: 'subject', // add subject and body here
    );
    var url = params.toString();
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('Could not launch $url');
    }
  }

  Future<void> _launchWhatsApp(String phoneNumber) async {
    final Uri params = Uri(
      scheme: 'https',
      host: 'wa.me',
      path: phoneNumber,
    );
    var url = params.toString();
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('Could not launch $url');
    }
  }

  void _showOptionsDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Escolha uma opção'),
          content: const Text(
              'Deseja mandar uma mensagem via WhatsApp ou copiar número para área de transferência?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _launchWhatsApp('+5511943503192');
              },
              child: const Text('WhatsApp'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Clipboard.setData(const ClipboardData(text: "+5511943503192"));
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Número copiado para área de transferência!',
                      style: TextStyle(color: Colors.white),
                    ),
                    duration: Duration(seconds: 5),
                    backgroundColor: Colors.green,
                  ),
                );
              },
              child: const Text('Copiar número para área de transferência'),
            ),
          ],
        );
      },
    );
  }

  void _scrollToPage(int page) {
    _pageController.animateToPage(
      page,
      duration: const Duration(milliseconds: 800), 
      curve: Curves.easeInOut, 
    );
  }

  void _scrollToTop() {
    _pageController.animateToPage(
      0,
      duration: const Duration(milliseconds: 1500),
      curve: Curves.easeInOut,
    );
  }

  Future<void> _download() async {
    try {
      final ByteData data =
          await rootBundle.load('lib/assets/curriculo/curriculo.pdf');
      final Uint8List bytes = data.buffer.asUint8List();
      final Stream<int> stream = Stream.fromIterable(bytes);
      download(stream, 'Curriculo - Murilo Molina Barone.pdf');
    } catch (e) {
      // ignore: avoid_print
      print('Erro ao baixar o arquivo: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 2, 36, 63),
      appBar: AppBar(
        title: Row(
          children: [
            const WidgetZoom(
              heroAnimationTag: 'tag',
              zoomWidget: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://avatars.githubusercontent.com/u/122751852?v=4'),
              ),
            ),
            const SizedBox(width: 8), // Espaçamento entre a imagem e o texto
            Text(
              'MURILO MOLINA BARONE',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: isTablet(context) ? 14 : 24),
            ),
          ],
        ),
        backgroundColor: const Color.fromARGB(199, 255, 255, 255),
        actions: isTablet(context)
            ? [
                PopupMenuButton<int>(
                  onSelected: (int index) => _scrollToPage(index),
                  itemBuilder: (BuildContext context) {
                    return [
                      const PopupMenuItem<int>(
                        value: 0,
                        child: Text('SOBRE MIM'),
                      ),
                      const PopupMenuItem<int>(
                        value: 1,
                        child: Text('PROJETOS'),
                      ),
                      const PopupMenuItem<int>(
                        value: 2,
                        child: Text('CERTIFICADOS'),
                      ),
                      const PopupMenuItem<int>(
                        value: 3,
                        child: Text('CURRÍCULO'),
                      ),
                    ];
                  },
                ),
              ]
            : [
                TextButton(
                  onPressed: () => _scrollToPage(0),
                  child: const Text(
                    'SOBRE MIM',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
                TextButton(
                  onPressed: () => _scrollToPage(1),
                  child: const Text(
                    'PROJETOS',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
                TextButton(
                  onPressed: () => _scrollToPage(2),
                  child: const Text(
                    'CERTIFICADOS',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
                TextButton(
                  onPressed: () => _scrollToPage(3),
                  child: const Text(
                    'CURRÍCULO',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: [
              CupertinoScrollbar(
                thumbVisibility: true,
                thickness: 5,
                child: PageView(
                  controller: _pageController,
                  physics: const AlwaysScrollableScrollPhysics(), // Física para sempre permitir rolagem
                  scrollDirection: Axis.vertical,
                  scrollBehavior: const ScrollBehavior(),
                  children: const [
                    PaginaInicial(),
                    PaginaProjetos(),
                    PaginaCertificados(),
                    PaginaCurriculo(),
                  ], 
                ),
              ),
              (_currentPage == 3)
                  ? Align(
                      alignment: Alignment.centerLeft,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Container(
                          width: isTablet(context)
                              ? constraints.maxWidth * 0.08
                              : constraints.maxWidth * 0.05,
                          color: const Color.fromARGB(199, 255, 255, 255)
                              .withOpacity(0.4),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                icon:
                                    Image.asset('lib/assets/icons/github.png'),
                                tooltip: "Github",
                                iconSize: 24,
                                onPressed: () => linkWidget(
                                    'https://github.com/murilomolina'),
                              ),
                              IconButton(
                                icon: Image.asset(
                                    'lib/assets/icons/linkedin.png'),
                                tooltip: "Linkedin",
                                iconSize: 24,
                                onPressed: () => linkWidget(
                                    'https://www.linkedin.com/in/murilo-molina-barone-8a144ba1/'),
                              ),
                              IconButton(
                                icon: Image.asset(
                                    'lib/assets/icons/instagram.png'),
                                tooltip: "Instagram",
                                iconSize: 24,
                                onPressed: () => linkWidget(
                                    'https://www.instagram.com/murilomolina_'),
                              ),
                              IconButton(
                                icon: Image.asset(
                                    'lib/assets/icons/facebook.png'),
                                tooltip: "Facebook",
                                iconSize: 24,
                                onPressed: () => linkWidget(
                                    'https://www.facebook.com/murilo.molina.1023/?locale=pt_BR'),
                              ),
                              IconButton(
                                icon: Image.asset('lib/assets/icons/email.png'),
                                tooltip: "E-mail",
                                iconSize: 24,
                                onPressed: () =>
                                    _launchEmail("murilo.m.barone@gmail.com"),
                              ),
                              IconButton(
                                icon: Image.asset(
                                    'lib/assets/icons/whatsapp.png'),
                                tooltip: "Telefone/Whatsapp",
                                iconSize: 24,
                                onPressed: () => _showOptionsDialog(),
                              ),
                              IconButton(
                                icon: Image.asset(
                                    'lib/assets/icons/baixarCurriculo.png'),
                                tooltip: "Baixar Currículo",
                                iconSize: 24,
                                onPressed: () => _download,
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  : Align(
                      alignment: Alignment.centerLeft,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Container(
                          width: isTablet(context)
                              ? constraints.maxWidth * 0.08
                              : constraints.maxWidth * 0.05,
                          color: const Color.fromARGB(199, 255, 255, 255)
                              .withOpacity(0.4),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                icon:
                                    Image.asset('lib/assets/icons/github.png'),
                                tooltip: "Github",
                                iconSize: 24,
                                onPressed: () => linkWidget(
                                    'https://github.com/murilomolina'),
                              ),
                              IconButton(
                                icon: Image.asset(
                                    'lib/assets/icons/linkedin.png'),
                                tooltip: "Linkedin",
                                iconSize: 24,
                                onPressed: () => linkWidget(
                                    'https://www.linkedin.com/in/murilo-molina-barone-8a144ba1/'),
                              ),
                              IconButton(
                                icon: Image.asset(
                                    'lib/assets/icons/instagram.png'),
                                tooltip: "Instagram",
                                iconSize: 24,
                                onPressed: () => linkWidget(
                                    'https://www.instagram.com/murilomolina_'),
                              ),
                              IconButton(
                                icon: Image.asset(
                                    'lib/assets/icons/facebook.png'),
                                tooltip: "Facebook",
                                iconSize: 24,
                                onPressed: () => linkWidget(
                                    'https://www.facebook.com/murilo.molina.1023/?locale=pt_BR'),
                              ),
                              IconButton(
                                icon: Image.asset('lib/assets/icons/email.png'),
                                tooltip: "E-mail",
                                iconSize: 24,
                                onPressed: () =>
                                    _launchEmail("murilo.m.barone@gmail.com"),
                              ),
                              IconButton(
                                icon: Image.asset(
                                    'lib/assets/icons/whatsapp.png'),
                                tooltip: "Telefone/Whatsapp",
                                iconSize: 24,
                                onPressed: () => _showOptionsDialog(),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
              Positioned(
                bottom: 16,
                right: 16,
                child: FloatingActionButton(
                  onPressed: _scrollToTop,
                  child: const Icon(Icons.arrow_upward),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
