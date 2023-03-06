import 'package:flutter/material.dart';
import 'package:todo/bases/columns.dart';
import 'package:todo/bases/container.dart';
import 'package:todo/bases/rows.dart';
import 'package:todo/ejercicios/BodySection.dart';
import 'package:todo/ejercicios/ImageSection.dart';
import 'package:todo/ejercicios/TitleSection.dart';
import 'package:todo/bases/cards.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          scaffoldBackgroundColor: Color.fromARGB(255, 254, 205, 130),
        ),
        home: Scaffold(
          appBar: AppBar(
            title: const Text("Actividad Buho"),
            titleSpacing: 20,
          ),
          body: SingleChildScrollView(
              child: Container(
                  child: Column(
            children: [
              Container(
                child: TitleSection(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    child: CardsBase(
                      titulo: 'Valeria Mondragon Roldan',
                      description: '21 Años',
                    ),
                  ),
                  Container(
                    child: CardsBase(
                      titulo: 'Marlon Steven Orrego Restrepo',
                      description: '20 Años',
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    child: CardsBase(
                      titulo: 'Simoncito Londoñito',
                      description: '21 Años',
                    ),
                  ),
                  Container(
                    child: CardsBase(
                      titulo: 'El Bandido Osorio',
                      description: '18 Años',
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    child: CardsBase(
                      titulo: 'Imanuel Rico Ruiz',
                      description: '21 Años',
                    ),
                  ),
                  Container(
                    child: CardsBase(
                      titulo: 'Isabel Gallego Gallego',
                      description: '20 Años',
                    ),
                  ),
                ],
              ),
            ],
          ))),
        ));
  }
}
