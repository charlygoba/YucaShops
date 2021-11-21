import 'package:yucashops/pages/googleMaps.dart';
import 'package:yucashops/drawer/drawer_screen.dart';
import 'package:flutter/material.dart';
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
    home: Home(),
    debugShowCheckedModeBanner: false,
  ));
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
