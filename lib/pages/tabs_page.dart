import 'package:flutter/material.dart';
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
    return PageView(
      physics: NeverScrollableScrollPhysics(),
      children: [
        Container(
          child: Center(
            child: Text('Tab 1'),
          ),
          color: Colors.red,
        ),

        Container(
          child: Center(
            child: Text('Tab 2'),
          ),
          color: Colors.green,
        ),
      ],
    );
  }
}


  class _NavegacionModel with ChangeNotifier {

    int _paginaActual = 0;

    int get paginaActual => this._paginaActual;

    set paginaActual(int valor){
      this._paginaActual = valor;
      notifyListeners();
    }
  }