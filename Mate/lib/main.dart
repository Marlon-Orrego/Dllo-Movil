import 'package:bankingapp/screens/login/HomeScreen.dart';
<<<<<<< HEAD
import 'package:bankingapp/screens/login/login.dart';
import 'package:firebase_core/firebase_core.dart';
=======
import 'package:bankingapp/screens/movimientos/home_screen.dart';
>>>>>>> cc34b65a3334f5e62cc3c31d1bddc3959650cd49
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:bankingapp/screens/pages.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'firebase_options.dart';

bool? seenOnboard;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  ;

  // show status bar
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [
    SystemUiOverlay.bottom,
    SystemUiOverlay.top,
  ]);

  // to load onboard shared preferences for the first time
  SharedPreferences prefs = await SharedPreferences.getInstance();
  seenOnboard = prefs.getBool('seenOnboard') ?? false;

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      debugShowCheckedModeBanner: false,
      title: 'Mate',
<<<<<<< HEAD
      home: seenOnboard == true ? HomeScreen() : const OnboardingPage(),
=======
      home: seenOnboard == true ? HomeScreenMovimientos() : const OnboardingPage(),
>>>>>>> cc34b65a3334f5e62cc3c31d1bddc3959650cd49
    );
  }
}
