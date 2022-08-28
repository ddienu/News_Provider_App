import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:news_app_provider/model/news_models.dart';
import 'package:news_app_provider/theme/theme.dart';


class ListaNoticias extends StatelessWidget {
  

  final List<Article> noticias;

  const ListaNoticias({required this.noticias});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.noticias.length,
      itemBuilder: (BuildContext context, int index ){
        return _Noticia(noticia: this.noticias[index], index: index);

        
      },
      );
  }
}

class _Noticia extends StatelessWidget {
 
  final Article noticia;
  final int index;

  const _Noticia({required this.noticia, required this.index}); 

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
      Divider(),
      _TarjetaTopBar( noticia, index ),

      _TarjetaTitulo( noticia ),

      _TarjetaImagen( noticia ),

      _TarjetaBody ( noticia ),

      ],
    );
    
  }
}

class _TarjetaTopBar extends StatelessWidget {
 
  final Article noticia;
  final int index;

  const _TarjetaTopBar(this.noticia, this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric( horizontal: 10.0),
      margin: EdgeInsets.only( bottom: 10.0),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.symmetric( horizontal: 5.0),
            child: Text('${index + 1}', style: TextStyle(color: miTema.colorScheme.secondary))),
          Text(noticia.source.name, style: TextStyle( color: Colors.grey),),
        ],
      )
    );
  }
}

class _TarjetaTitulo extends StatelessWidget {
  
  final Article noticia;

  const _TarjetaTitulo( this.noticia); 

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric( horizontal: 15.0),
      child: Text(noticia.title, style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w400), textAlign: TextAlign.justify),
    );
  }
}

class _TarjetaImagen extends StatelessWidget {

  final Article noticia;

  const _TarjetaImagen( this.noticia);


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric( vertical: 10.0),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(50.0)),
        child: Container(
          margin: EdgeInsets.all(10.0),
          child: ( noticia.urlToImage != null)
          ? FadeInImage(
            placeholder: AssetImage('assets/img/giphy.gif'), 
            image: NetworkImage( noticia.urlToImage ),
            )
          : Image( image: AssetImage('Assets/img/no-image.png'),
          )  
        ),
      ),
    );
  }
}


class _TarjetaBody extends StatelessWidget {
  
  final Article noticia;

  const _TarjetaBody(this.noticia);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric( horizontal: 5.0 ),
      child: Text( (noticia.description != null) ? noticia.description : '', textAlign: TextAlign.justify),
    );
  }
}