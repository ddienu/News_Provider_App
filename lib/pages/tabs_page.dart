import 'package:flutter/material.dart';


class TabsPage extends StatelessWidget {
  const TabsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _Paginas(),
      bottomNavigationBar: _Navegacion(),
      
    );
  }
}

class _Navegacion extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 0,
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