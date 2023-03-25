import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<void> loadFont() async {
  await rootBundle.load("assets/fonts/MarvelRegular-Dj83.ttf");
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await loadFont();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Marvel Api by Marlon Orrego',
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/marvel_logo.png',
              width: 200.0,
              height: 200.0,
            ),
            SizedBox(height: 16.0),
            Text(
              'MARVEL API',
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'MarvelRegular',
                  fontSize: 30.0),
            ),
            SizedBox(height: 5.0),
            Text(
              'BY MARLON ORREGO',
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'MarvelRegular',
                  fontSize: 15.0),
            ),
          ],
        ),
      ),
    );
  }
}
