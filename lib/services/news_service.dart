import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:news_app_provider/model/category_model.dart';
import 'package:news_app_provider/model/news_models.dart';
import 'package:http/http.dart' as http;

final _authority       = 'newsapi.org';
final _unencodedPath   = '/v2/top-headlines';
final _queryParameters = { "country" : "co", "apiKey" : "dd55c23ee6b945e1b3923aee224477c6"};

class NewsService with ChangeNotifier{


  List<Article> headlines = [];
  String _selectedCategory = 'general';

  List<Category> categories = [
    Category(FontAwesomeIcons.building, 'business'),
    Category(FontAwesomeIcons.tv, 'entertainment'),
    Category(FontAwesomeIcons.globe, 'general'),
    Category(FontAwesomeIcons.bookMedical, 'health'),
    Category(FontAwesomeIcons.flask, 'science'),
    Category(FontAwesomeIcons.baseball, 'sports'),
    Category(FontAwesomeIcons.microchip, 'technology'),
  ];

  Map<String, List<Article>> categoryArticles = {};


        

  NewsService(){

    this.getHeadLines();

    categories.forEach(( item ) { 

      categoryArticles[item.name] = [];
    });
  
  }


  String get selectedCategory => _selectedCategory;

  set selectedCategory ( String valor){

    _selectedCategory = valor;

    getArticlesByCategory( valor );

    notifyListeners();
  }

  getHeadLines() async {

    final url  = Uri.https(_authority, _unencodedPath, _queryParameters);
    final resp = await http.get(url);
   
    final newsResponse = newsResponseFromJson( resp.body);

    headlines.addAll( newsResponse.articles );
    notifyListeners();
  }
  getArticlesByCategory( String category ) async {

    if ( categoryArticles[category]!.isNotEmpty){
      return categoryArticles[category];
    }

    final _authority       = 'newsapi.org';
    final _unencodedPath   = '/v2/top-headlines';
    final _queryParameters = { "country" : "co",   "category" : category, "apiKey" : "dd55c23ee6b945e1b3923aee224477c6"};

     
    final url  = Uri.https(_authority, _unencodedPath, _queryParameters);
    final resp = await http.get(url);
      print(url);
    final newsResponse = newsResponseFromJson( resp.body);

    categoryArticles[category]?.addAll(newsResponse.articles);

        notifyListeners();
  }

}