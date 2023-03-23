import 'package:flutter/material.dart';
import 'package:todov2/app_ejemplo_1/main_app_ejemplo_1.dart';
import 'package:todov2/app_ejemplo_1/pages/detail_character.dart';

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
        primarySwatch: Colors.blue,
      ),
      home: MainAppEjemplo1(),
      routes: {'detail_character': (context) => DetailCharacter()},
      //  Scaffold(
      //     appBar: AppBar(
      //       title: const Text("To Do"),
      //       titleSpacing: 100,
      //     ),
      //     body:ButtonBase(),

      //  )
    );
  }
}
