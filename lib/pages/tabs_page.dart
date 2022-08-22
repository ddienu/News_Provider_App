import 'package:flutter/material.dart';


class TabsPage extends StatelessWidget {
  const TabsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
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
      ),
    );
  }
}