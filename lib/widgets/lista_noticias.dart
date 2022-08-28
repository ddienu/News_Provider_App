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
          Text('${index + 1}', style: TextStyle(color: miTema.colorScheme.secondary)),
          Text(noticia.source.name),
        ],
      )
    );
  }
}

class _TarjetaTitulo extends StatelessWidget {
  
  final Article noticias;

  const _TarjetaTitulo( this.noticias); 

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric( horizontal: 15.0),
      child: Text(noticias.title, style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w400)),
    );
  }
}

class _TarjetaImagen extends StatelessWidget {

  final Article noticias;

  const _TarjetaImagen( this.noticias);


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Hola Mundo'),
    );
  }
}
