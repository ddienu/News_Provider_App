import 'package:flutter/material.dart';
import 'package:news_app_provider/pages/tabs_page.dart';
import 'package:news_app_provider/theme/theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: miTema,
      title: 'Material App',
      home: TabsPage()
    );
  }
}