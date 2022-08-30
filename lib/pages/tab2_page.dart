import 'package:flutter/material.dart';
import 'package:news_app_provider/model/category_model.dart';
import 'package:news_app_provider/services/news_service.dart';
import 'package:news_app_provider/theme/theme.dart';
import 'package:news_app_provider/widgets/lista_noticias.dart';
import 'package:provider/provider.dart';


class Tab2Page extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

  final newsService = Provider.of<NewsService>(context);

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            _ListaCategorias(),


            if(!newsService.isLoading)
            Expanded(
              child: ListaNoticias(noticias: newsService.getArticulosCategoriaSeleccionada! ),
              ),
              

              if(newsService.isLoading)
              const Expanded(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              )
          ],
        )
      ),
    );
  }
}

class _ListaCategorias extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {

     final categories = Provider.of<NewsService>(context).categories;
     final newsService = Provider.of<NewsService>(context);

    return Container(
      width: double.infinity,
      height: 75.0,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index) {

          final categoryName = categories[index].name;

          return Container(
            width: 105,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  _CategoryButton(categories[index]),
                  SizedBox( height: 5.0),
                  Text(categoryName[0].toUpperCase()+categoryName.substring(1),
                  style: TextStyle(color: ( newsService.selectedCategory == categoryName)
                       ? miTema.colorScheme.secondary
                       : Colors.white
                    )
                  )
                 ],
                ),
              ),
          );
          },
        ),
    );
  }
}

class _CategoryButton extends StatelessWidget {
 
  final Category categoria;

  
  const _CategoryButton(this.categoria);

  @override
  Widget build(BuildContext context) {

    final newsService = Provider.of<NewsService>(context);

    return GestureDetector(
      onTap: () {
      final newsService = Provider.of<NewsService>(context, listen: false);
      newsService.selectedCategory = categoria.name;
      },
      child: Container(
        width: 40.0,
        height: 40.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: ( newsService.selectedCategory == categoria.name)
               ? miTema.colorScheme.secondary
               : Colors.white
        ),
        child: Icon(
          categoria.icon,
          color: Colors.black87
          ),
      ),
    );
  }
}