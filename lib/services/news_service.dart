import 'package:flutter/material.dart';
import 'package:news_app_provider/model/news_models.dart';

class NewsService with ChangeNotifier{


  List<Article> headlines = [];

  NewsService(){

    this.getHeadLines();

  }

  getHeadLines(){

    print('Cargando HeadLines...');
  }
}