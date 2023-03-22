import 'package:flutter/material.dart';
import 'package:todov2/app_ejemplo_1/controller/User.dart';

class DetailCharacter extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DetailCharacter();
  }
}

class _DetailCharacter extends State<DetailCharacter> {
  @override
  Widget build(BuildContext context) {
    User args = ModalRoute.of(context)?.settings.arguments as User;

    String characterName = ModalRoute.of(context)?.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: Text('Detalle del personaje'),
      ),
      body: Container(
        child: Center(
          child: Text(characterName),
        ),
      ),
    );
  }
}
