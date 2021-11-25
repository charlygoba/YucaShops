import 'package:yucashops/pages/googleMaps.dart';
import 'package:yucashops/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:yucashops/configuration/configuration.dart';
import 'controllers.dart';
//import 'package:flutter_open_whatsapp/flutter_open_whatsapp.dart';
//import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_launch/flutter_launch.dart';

class Students extends StatefulWidget {
  String id;
  String name;
  String phone;
  String description;
  String email;
  String address;
  String latitud;
  String longitud;
  String image;
  String activity_id;
  Students(this.id, this.name, this.phone, this.description, this.email,
      this.address, this.latitud, this.longitud, this.image, this.activity_id);

  @override
  _BienvenidaState createState() => _BienvenidaState();
}

class _BienvenidaState extends State<Students> {
  bool err = false;
  String msgErr = '';
  late String id;
  late String name;
  late String phone;
  late String description;
  late String email;
  late String address;
  late String latitud;
  late String longitud;
  late String image;
  late String activity_id;
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.orangeAccent[200],
                    child: Align(
                      alignment: Alignment.center,
                      child: Hero(
                        tag: 'Tienda',
                        child: Image(
                          image: NetworkImage(
                              'http://192.168.1.72/yucashops/admin/public/storage/generic/logo_business.png'),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.white,
                    child: Container(
                      margin: EdgeInsets.fromLTRB(10, 80, 10, 120),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /*Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: ListTile(
                                  leading: CircleAvatar(
                                    backgroundImage:
                                        AssetImage('images/pet_cat1.png'),
                                  ),
                                  title: Text(
                                    'Maya Berkovskaya',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey[700]),
                                  ),
                                  subtitle: Text(
                                    'Owner',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey[400]),
                                  ),
                                ),
                              ),
                              Text(
                                'May 25, 2019',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey[400]),
                              ),
                            ],
                          ),*/
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: ListTile(
                                  title: Text(
                                    'Acerca del Negocio',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey[700]),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              widget.description,
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[500],
                                letterSpacing: 0.7,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 30),
            padding: EdgeInsets.only(top: 30),
            child: Align(
              alignment: Alignment.topCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back_ios_rounded,
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("Compartiendo Enlace"),
                      ));
                    },
                    icon: Icon(
                      Icons.share,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              height: 140,
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                boxShadow: shadowList,
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Flexible(
                      child: new Container(
                        padding: new EdgeInsets.only(right: 13.0),
                        child: new Text(
                          widget.name,
                          overflow: TextOverflow.clip,
                          softWrap: false,
                          style: new TextStyle(
                            fontSize: 21.0,
                            fontFamily: 'Roboto',
                            color: Colors.cyan[800],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.phone,
                          color: primaryColor,
                          size: 18,
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Text(
                          widget.phone,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[500],
                            letterSpacing: 0.7,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.email,
                          color: primaryColor,
                          size: 18,
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Text(
                          widget.email,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[500],
                            letterSpacing: 0.7,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 2),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.location_on,
                          color: primaryColor,
                          size: 18,
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Text(
                          widget.address,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[400],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 120,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  children: [
                    RaisedButton.icon(
                      onPressed: () {
                        _seeMaps(context);
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                      label: Text(
                        "ver Ubicación",
                        style: TextStyle(color: Colors.white),
                      ),
                      icon: Icon(
                        Icons.pin_drop,
                        color: Colors.white,
                      ),
                      textColor: Colors.white,
                      splashColor: Colors.red,
                      color: Colors.red[300],
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    RaisedButton.icon(
                      onPressed: () {
                        whatsAppOpen();
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                      label: Text(
                        "Enviar WhatsApp",
                        style: TextStyle(color: Colors.white),
                      ),
                      icon: Icon(
                        Icons.message,
                        color: Colors.white,
                      ),
                      textColor: Colors.white,
                      splashColor: Colors.red,
                      color: Colors.green[500],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _seeMaps(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
      return GoogleMaps(widget.latitud, widget.longitud, widget.name);
    }));
  }

  void whatsAppOpen() async {
    bool whatsapp = await FlutterLaunch.hasApp(name: "whatsapp");

    if (whatsapp) {
      await FlutterLaunch.launchWhatsapp(
          phone: "5534992016100", message: "Hello, flutter_launch");
    } else {
      setState(() {
        err = false;
        msgErr = 'No hay whatsapp';
      });
    }
  }
}
