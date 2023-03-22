import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Character extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CharacterState();
  }
}

class _CharacterState extends State<Character> {
  dynamic _characterData;

  @override
  void initState() {
    super.initState();
    _getCharacterData();
  }

  Future<void> _getCharacterData() async {
    final ts = '2307';
    final apiKey = 'fcc3ce0a8959e456db26914a930a2f83';
    final hash = 'bd51ac2c9dc95a9dbc5412b908776598';

    final characterId = '1009262';
    final url =
        'https://gateway.marvel.com:443/v1/public/characters/$characterId?ts=$ts&apikey=$apiKey&hash=$hash';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      setState(() {
        _characterData = json.decode(response.body)['data']['results'][0];
      });
    } else {
      throw Exception('Failed to load character data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: _characterData == null
          ? CircularProgressIndicator()
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _characterData['name'],
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Image.network(
                  '${_characterData['thumbnail']['path']}.${_characterData['thumbnail']['extension']}',
                  height: 200,
                  width: 200,
                ),
                SizedBox(height: 10),
                Text(
                  _characterData['description'],
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 10),
                Text(
                  'Cantidad de comics: ${_characterData['comics']['available']}',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  'Cantidad de series: ${_characterData['series']['available']}',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  'Cantidad de stories: ${_characterData['stories']['available']}',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  'Cantidad de eventos: ${_characterData['events']['available']}',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 10),
                Text(
                  'Primeras tres series:',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 5),
                ..._characterData['series']['items']
                    .take(3)
                    .map((e) => Text(e['name'], style: TextStyle(fontSize: 16)))
                    .toList(),
              ],
            ),
    );
  }
}
