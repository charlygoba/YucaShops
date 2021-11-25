import 'dart:async';
import 'dart:convert';
import 'package:yucashops/model/Datos_Contactos.dart';
import 'package:yucashops/pages/googleMaps.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
//import 'package:yucashops/model/editar.dart';
import 'package:yucashops/model/ver.dart';
import 'package:yucashops/model/agregar.dart';

// void main() {
//   runApp(new MaterialApp(
//     home: new HomePage(),
//   ));
// }

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {
  final refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();
  bool loading = true;
  List<Datos_Students> data = <Datos_Students>[];
  Future<List<Datos_Students>> getData() async {
    var url = Uri.parse('http://192.168.1.72/crudapi/public/negocios');
    var response = await http.get(url, headers: {
      "Accept": "application/json",
    });

    var datos = jsonDecode(response.body);
    late var registros = <Datos_Students>[];
    for (datos in datos) {
      registros.add(Datos_Students.fromJson(datos));
    }
    return registros;
  }

  @override
  void initState() {
    super.initState();
    getData().then((value) {
      setState(() {
        data.addAll(value);
        loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text("Lista De Negocios"),
          backgroundColor: Colors.cyan[800],
        ),
        drawer: MenuLateral(),
        body: Column(
          children: [
            Expanded(
                child: loading == true
                    ? Center(
                        child: Container(
                          width: 30,
                          height: 30,
                          child: CircularProgressIndicator(),
                        ),
                      )
                    : ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            onTap: () {
                              var name = data[index].name;
                              var phone = data[index].phone;
                              var description = data[index].description;
                              var email = data[index].email;
                              String id = data[index].id.toString();
                              var address = data[index].address;
                              var latitud = data[index].latitud;
                              var longitud = data[index].longitud;
                              var image = data[index].image;
                              String activityid =
                                  data[index].activityid.toString();
                              Navigator.of(context).push(
                                  MaterialPageRoute<Null>(
                                      builder: (BuildContext context) {
                                return new Students(
                                    id,
                                    name,
                                    phone,
                                    description,
                                    email,
                                    address,
                                    latitud,
                                    longitud,
                                    image,
                                    activityid);
                              }));
                              // .then((value) => setState(() {
                              //       getData().then((value) {
                              //         setState(() {
                              //           data.addAll(value);
                              //           loading = false;
                              //         });
                              //       });
                              //     }));
                            },
                            child: Container(
                              padding: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: Colors.purple, width: 1))),
                              child: Row(
                                children: [
                                  Image(
                                    image: NetworkImage(
                                        'http://192.168.1.72/yucashops/admin/public/storage/generic/logo_business.png'),
                                    height: 100,
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(left: 16.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            data[index].name,
                                            style: TextStyle(fontSize: 20),
                                          ),
                                          Text(
                                            "Email: " + data[index].email,
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.pink),
                                          ),
                                          Text(
                                            "Grado: " +
                                                data[index].phone +
                                                "º" +
                                                data[index].description,
                                            style: TextStyle(fontSize: 16),
                                          ),
                                          Text(
                                            data[index].address,
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.teal[400]),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ))
          ],
        ));
  }
}

class MenuLateral extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Drawer(
      backgroundColor: Colors.purple,
      child: ListView(
        children: <Widget>[
          new UserAccountsDrawerHeader(
            accountName: Text("CRUD Alumnos API",
                style: TextStyle(color: Colors.white, fontSize: 20)),
            accountEmail:
                Text("Estdiante", style: TextStyle(color: Colors.white)),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        "https://static.wixstatic.com/media/127857_7603355bfa964d8e91aec26548598d9f~mv2.png/v1/fill/w_163,h_40,al_c,q_85,usm_0.66_1.00_0.01/REDES-UTM_edited.webp"),
                    fit: BoxFit.scaleDown)),
          ),
          Ink(
            color: Colors.deepPurple,
            child: new ListTile(
              trailing: Icon(Icons.people),
              title: Text(
                "Agregar Alumno",
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute<Null>(builder: (BuildContext context) {
                  return new Agregar();
                }));
              },
            ),
          ),
          new ListTile(
            trailing: Icon(Icons.exit_to_app),
            title: Text("Salir"),
            onTap: () {
              SystemNavigator.pop();
            },
          ),
          new ListTile(
            trailing: Icon(Icons.update),
            title: Text("Actualizar"),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute<Null>(builder: (BuildContext context) {
                return new HomePage();
              }));
            },
          ),
          // new ListTile(
          //   title: Text("Ver Mapa We"),
          //   onTap: () {
          //     Navigator.of(context).push(
          //         MaterialPageRoute<Null>(builder: (BuildContext context) {
          //       return new GoogleMaps();
          //     }));
          //   },
          // ),
        ],
      ),
    );
  }
}
