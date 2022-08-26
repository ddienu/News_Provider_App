import 'package:flutter/material.dart';
import 'package:news_app_provider/model/news_models.dart';
import 'package:http/http.dart' as http;

final _authority       = 'newsapi.org';
final _unencodedPath   = '/v2/top-headlines';
final _queryParameters = { "country" : "co", "category" : "general", "apiKey" : "dd55c23ee6b945e1b3923aee224477c6"};

class NewsService with ChangeNotifier{


  List<Article> headlines = [];

  NewsService(){

    this.getHeadLines();

  }

  getHeadLines() async {

    final url  = Uri.https(_authority, _unencodedPath, _queryParameters);
    final resp = await http.get(url);

    final newsResponse = newsResponseFromJson( resp.body);

    this.headlines.addAll( newsResponse.articles );
    notifyListeners();
  }

}