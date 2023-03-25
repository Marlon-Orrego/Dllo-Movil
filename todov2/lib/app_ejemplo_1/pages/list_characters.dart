import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:todov2/app_ejemplo_1/pages/character_detail.dart';
import 'package:todov2/app_ejemplo_1/widgets/character_tile.dart';

import '../controller/Character.dart';

class ListCharacters extends StatefulWidget {
  @override
  _ListCharactersState createState() => _ListCharactersState();
}

class _ListCharactersState extends State<ListCharacters> {
  List<dynamic> characters = [];

  Future<void> getCharacters() async {
    final ts = '2307';
    final apiKey = 'fcc3ce0a8959e456db26914a930a2f83';
    final hash = 'bd51ac2c9dc95a9dbc5412b908776598';

    final url =
        'https://gateway.marvel.com:443/v1/public/characters?ts=$ts&apikey=$apiKey&hash=$hash&limit=20';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      setState(() {
        characters = jsonData['data']['results'];
      });
    } else {
      throw Exception('Failed to load characters');
    }
  }

  @override
  void initState() {
    super.initState();
    getCharacters();
  }

  void _showCharacterDetail(int index) {
    final character = characters[index];
    final name = character['name'];
    final thumbnail = character['thumbnail']['path'] +
        '.' +
        character['thumbnail']['extension'];
    final description = character['description'];
    final comics = character['comics']['available'];
    final series = character['series']['available'];
    final stories = character['stories']['available'];
    final events = character['events']['available'];
    final List<dynamic> seriesList = character['series']['items'];
    final List<String> seriesNames = seriesList
        .sublist(0, 3)
        .map((item) => item['name'].toString())
        .toList();
    final Character selectedCharacter = Character(
        name: name,
        image: thumbnail,
        thumbnail: thumbnail,
        description: description,
        comicsCount: comics,
        seriesCount: series,
        storiesCount: stories,
        eventsCount: events,
        firstThreeSeriesNames: seriesNames);
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => CharacterDetails(
                character: selectedCharacter,
              )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Container(
          padding: const EdgeInsets.symmetric(horizontal: 150),
          child: SizedBox(
            height: 50,
            child: Image.asset(
              'assets/images/marvel_logo.png',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      body: Center(
        child: characters.isEmpty
            ? CircularProgressIndicator()
            : GridView.builder(
                padding: EdgeInsets.all(10),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemCount: characters.length,
                itemBuilder: (context, index) {
                  final character = characters[index];
                  final thumbnail = character['thumbnail']['path'] +
                      '.' +
                      character['thumbnail']['extension'];
                  final name = character['name'];
                  return GestureDetector(
                      onTap: () {
                        _showCharacterDetail(index);
                      },
                      child: CharacterTile(
                        character: characters[index],
                        onTap: () {
                          _showCharacterDetail(index);
                        },
                      ));
                },
              ),
      ),
    );
  }
}
