import 'package:yucashops/pages/googleMaps.dart';
import 'package:yucashops/drawer/drawer_screen.dart';
import 'package:flutter/material.dart';

//import 'package:agenda_dmi/pages/home.dart';
//import 'package:agenda_dmi/pages/home_screen.dart';
import 'dart:async';
import 'package:splashscreen/splashscreen.dart';

//import 'package:yucashops/pages/home.dart';
import 'package:yucashops/pages/home_screen.dart';

// void main(List<String> args) async {
//   runApp(MyApp());
//   final prefs = PreferenciasUsuario.instance;

//   await Firebase.initializeApp();
//   await prefs.initPrefs();
// }

void main() {
  runApp(MaterialApp(
    home: Splash2(),
    debugShowCheckedModeBanner: false,
  ));
}

class Splash2 extends StatelessWidget {
  // Method 2

  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 4,
      navigateAfterSeconds: new Home(),
      image: new Image.asset('images/logoy.png'),
      loadingText: Text("Loading"),
      photoSize: 100.0,
      loaderColor: Colors.blue,
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          DrawerScreen(),
          HomeScreen(),
        ],
      ),
    );
  }
}
