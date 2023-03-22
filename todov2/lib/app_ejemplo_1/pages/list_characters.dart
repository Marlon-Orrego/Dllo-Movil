import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:todov2/app_ejemplo_1/controller/User.dart';

class ListCharacters extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ListCharacters();
  }
}

class _ListCharacters extends State<ListCharacters> {
  List<dynamic> characters = [];

  Future<void> getCharacters() async {
    final ts = '2307';
    final apiKey = 'fcc3ce0a8959e456db26914a930a2f83';
    final hash = 'bd51ac2c9dc95a9dbc5412b908776598';

    final url =
        'https://gateway.marvel.com:443/v1/public/characters?ts=$ts&apikey=$apiKey&hash=$hash&limit=50';

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

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: characters.isEmpty
            ? CircularProgressIndicator()
            : ListView.separated(
                itemCount: characters.length,
                separatorBuilder: (context, index) => Divider(),
                itemBuilder: (context, index) {
                  final character = characters[index];
                  final name = character['name'];
                  final thumbnail = character['thumbnail']['path'] +
                      '.' +
                      character['thumbnail']['extension'];
                  return ListTile(
                    leading: Image.network(thumbnail),
                    trailing: Icon(Icons.arrow_right),
                    title: Text(name),
                  );
                },
              ),
      ),
    );
  }
}
