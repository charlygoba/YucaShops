import 'package:flutter/material.dart';

Color primaryColor = Color(0xffd81b60);

List<BoxShadow> shadowList = [
  BoxShadow(color: Colors.grey, blurRadius: 30, offset: Offset(0, 10))
];

String details = 'My job requires moving to another country. '
    'I do not have the opportunity to take the cat with me. '
    'I am looking for good people who will shelter my pet';

List<Map> categories = [
  {"id": '40', "name": 'Restaurantes', "imagePath": 'images/restaurant.png'},
  {"id": '55', "name": 'Tiendas', "imagePath": 'images/retail.png'},
  {"id": '95', "name": 'Profesionales', "imagePath": 'images/professional.png'},
  {"id": '80', "name": 'Limpieza', "imagePath": 'images/cleaning.png'},
  {"id": '104', "name": 'Automotriz', "imagePath": 'images/auto.png'},
];

List<Map> catMapList = [
  {
    "id": 0,
    "name": 'Sola',
    "imagePath": 'images/pet_cat2.png',
    "Species": 'Abyssinion cat',
    "sex": 'Female',
    "year": '2',
    "distance": '3.6 km',
    "location": '5 Bulvorno-Kudriovska Street, Kyiv',
  },
  {
    "id": 1,
    "name": 'Orion',
    "imagePath": 'images/pet_cat1.png',
    "Species": 'Abyssinion cat',
    "sex": 'male',
    "year": '1.5',
    "distance": '7.6 km',
    "location": '5 Bulvorno-Kudriovska Street, Kyiv',
  },
  {
    "id": 2,
    "name": 'Sola',
    "imagePath": 'images/pet_cat2.png',
    "Species": 'Abyssinion cat',
    "sex": 'Female',
    "year": '2',
    "distance": '3.6 km',
    "location": '5 Bulvorno-Kudriovska Street, Kyiv',
  },
  {
    "id": 3,
    "name": 'Orion',
    "imagePath": 'images/pet_cat1.png',
    "Species": 'Abyssinion cat',
    "sex": 'male',
    "year": '1.5',
    "distance": '7.6 km',
    "location": '5 Bulvorno-Kudriovska Street, Kyiv',
  },
  {
    "id": 4,
    "name": 'Sola',
    "imagePath": 'images/pet_cat2.png',
    "Species": 'Abyssinion cat',
    "sex": 'Female',
    "year": '2',
    "distance": '3.6 km',
    "location": '5 Bulvorno-Kudriovska Street, Kyiv',
  },
  {
    "id": 5,
    "name": 'Orion',
    "imagePath": 'images/pet_cat1.png',
    "Species": 'Abyssinion cat',
    "sex": 'male',
    "year": '1.5',
    "distance": '7.6 km',
    "location": '5 Bulvorno-Kudriovska Street, Kyiv',
  },
];

List<Map> navList = [
  {'icon': Icons.pets_rounded, 'title': 'Negocios'},
  {'icon': Icons.markunread_mailbox_rounded, 'title': 'Mis negocios'},
  {'icon': Icons.add_rounded, 'title': 'Agregar negocio'},
  {'icon': Icons.favorite_rounded, 'title': 'Favoritos'},
  {'icon': Icons.mail_rounded, 'title': 'Mensajes'},
  {'icon': Icons.person, 'title': 'Perfil'},
];
