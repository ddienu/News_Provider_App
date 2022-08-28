import 'package:flutter/material.dart';
import 'package:news_app_provider/model/category_model.dart';
import 'package:news_app_provider/services/news_service.dart';
import 'package:provider/provider.dart';


class Tab2Page extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(child: _ListaCategorias()),
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

    return ListView.builder(
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
                Text(categoryName[0].toUpperCase()+categoryName.substring(1))
               ],
              ),
            ),
        );
        },
      );
  }
}

class _CategoryButton extends StatelessWidget {
 
  final Category categoria;

  
  const _CategoryButton(this.categoria);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => print(categoria.name),
      child: Container(
        width: 40.0,
        height: 40.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        child: Icon(
          categoria.icon,
          color: Colors.black87,
          ),
      ),
    );
  }
}