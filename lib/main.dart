import 'package:agenda_dmi/pages/googleMaps.dart';
import 'package:agenda_dmi/drawer/drawer_screen.dart';
import 'package:flutter/material.dart';
//import 'package:agenda_dmi/pages/home.dart';
import 'package:agenda_dmi/pages/home_screen.dart';

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
