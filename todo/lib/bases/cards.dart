import 'package:flutter/material.dart';

class CardsBase extends StatelessWidget {
  final String titulo;
  final String description;

  CardsBase({required this.titulo, required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 190,
      height: 190,
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: EdgeInsets.all(16),
                child: Center(
                  child: Text(
                    titulo,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                )),
            Padding(
                padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
                child: Center(
                  child: Text(
                    description,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
