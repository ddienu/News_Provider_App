import 'dart:io';

import 'package:flutter/material.dart';
import 'package:news_app_provider/pages/tabs_page.dart';
import 'package:news_app_provider/services/news_service.dart';
import 'package:news_app_provider/theme/theme.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    HttpOverrides.global = MyHttpOverrides();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NewsService() ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: miTema,
        title: 'News App',
        home: TabsPage()
      ),
    );
  }
}
 class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}