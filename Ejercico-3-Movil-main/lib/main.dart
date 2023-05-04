import 'package:ejercicio_grid/homescreen/homeScreen.dart';
import 'package:ejercicio_grid/services/firebase_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    title: 'Navigation Basics',
    home: FirstRoute(),
  ));
}

class FirstRoute extends StatelessWidget {
  const FirstRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
            child: FutureBuilder(
          future: FirebaseService.firebaseIni(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () async {
                        await FirebaseService.signInWithGoogle();
                      },
                      child: Text("Iniciar con Google"))
                ],
              );
            } else {
              return const CircularProgressIndicator();
            }
          },
        )),
        Center(
          child: ElevatedButton(
            child: const Text('Abrir Ruta'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomeScreen()),
              );
            },
          ),
        ),
        Center(
          child: ElevatedButton(
            child: const Text('Abrir Ruta'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomeScreen()),
              );
            },
          ),
        ),
      ],
    ));
  }
}
