import 'package:flutter/material.dart';
import 'package:news_app_provider/model/news_models.dart';


class ListaNoticias extends StatelessWidget {
  

  final List<Article> noticias;

  const ListaNoticias({required this.noticias});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.noticias.length,
      itemBuilder: (BuildContext context, int index ){
        return Text(this.noticias[index].title);
      },
      );
  }
}