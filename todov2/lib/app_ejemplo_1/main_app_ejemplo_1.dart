import 'package:flutter/material.dart';
import 'package:todov2/app_ejemplo_1/pages/home.dart';
import 'package:todov2/app_ejemplo_1/pages/list_characters.dart';
import 'package:flutter/services.dart';

Future<void> loadFont() async {
  await rootBundle.load("assets/fonts/MarvelRegular-Dj83.ttf");
}

class MainAppEjemplo1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainAppEjemplo1();
  }
}

class _MainAppEjemplo1 extends State<MainAppEjemplo1> {
  final List<Widget> pages = [Home(), ListCharacters()];
  int currentlyIndex = 0;

  void changePage(int index) {
    setState(() {
      currentlyIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentlyIndex],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          // Cambia el color del texto del BottomNavigationBar a blanco
          textTheme: Theme.of(context).textTheme.copyWith(
                caption: TextStyle(color: Colors.white),
              ),
        ),
        child: BottomNavigationBar(
          onTap: changePage,
          backgroundColor: Colors.black,
          currentIndex: currentlyIndex,
          selectedItemColor: Color.fromARGB(255, 255, 0, 0),
          selectedLabelStyle:
              TextStyle(fontFamily: 'MarvelRegular', fontSize: 20.0),
          unselectedLabelStyle:
              TextStyle(fontFamily: 'MarvelRegular', fontSize: 20.0),
          unselectedItemColor: Color.fromARGB(255, 255, 255, 255),
          items: const [
            BottomNavigationBarItem(
              label: "INICIO",
              icon: Icon(
                Icons.home,
                color: Colors.white,
              ),
            ),
            BottomNavigationBarItem(
              label: "PERSONAJES",
              icon: Icon(
                Icons.people,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
