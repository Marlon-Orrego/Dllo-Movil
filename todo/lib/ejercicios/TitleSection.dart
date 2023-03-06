import 'package:flutter/material.dart';
import 'package:todo/ejercicios/ImageSection.dart';

class TitleSection extends StatelessWidget {
  // TitleSection(String titulo, String subtitulo, int estrellas) {
  //   _titulo=titulo;
  //   _subtitulo=subtitulo;
  //   _estrellas=estrellas;
  // }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImageSection(
                "https://img.freepik.com/vector-gratis/lindo-buho-sosteniendo-cafe-icono-dibujos-animados-ilustracion_138676-2263.jpg?w=826&t=st=1678061628~exp=1678062228~hmac=ecb6696a5c56dee2e5e2f6badb6510d41800f2be75723b6eea48626cf5e11713"),
          ],
        ),
        Spacer(),
        Row(
          children: [
            Container(
                height: 190,
                width: 50,
                alignment: Alignment.bottomCenter,
                child: const Icon(
                  Icons.search,
                  color: Colors.redAccent,
                )),
            Container(
                height: 190,
                width: 50,
                alignment: Alignment.bottomCenter,
                child: const Icon(
                  Icons.more_vert,
                  color: Colors.redAccent,
                ))
          ],
        )
      ],
    );
  }
}
