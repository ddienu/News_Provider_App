import 'package:flutter/material.dart';
import 'package:news_app_provider/pages/tab1_page.dart';
import 'package:news_app_provider/pages/tab2_page.dart';
import 'package:provider/provider.dart';


class TabsPage extends StatelessWidget {
  const TabsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _NavegacionModel(),
      child: Scaffold(
        body: _Paginas(),
        bottomNavigationBar: _Navegacion(),
        
      ),
    );
  }
}

class _Navegacion extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final navegacionModel = Provider.of<_NavegacionModel>(context);

    return BottomNavigationBar(
      currentIndex: navegacionModel.paginaActual,
      onTap: (i) => navegacionModel.paginaActual = i,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline_outlined),
          label: "Para ti",
          ),
        BottomNavigationBarItem(
          icon: Icon(Icons.public),
          label: "Encabezados",
          ),          
      ]
      );
  }
}

class _Paginas extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final navegacionModel = Provider.of<_NavegacionModel>(context);

    return PageView(
      controller: navegacionModel.pageControler,
      physics: NeverScrollableScrollPhysics(),
      children: [
        
        Tab1Page(),

        Tab2Page(),
      ],
    );
  }
}


  class _NavegacionModel with ChangeNotifier {

    int _paginaActual = 0;

    PageController _pageController = PageController();

    int get paginaActual => this._paginaActual;

    set paginaActual(int valor){
      this._paginaActual = valor;
      
      _pageController.animateToPage(curve: Curves.easeIn, duration: Duration(milliseconds: 250), valor);
      notifyListeners();
    }

    PageController get pageControler => this._pageController;
  }