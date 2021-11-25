import 'package:flutter/material.dart';
import 'package:yucashops/configuration/configuration.dart';
import 'dart:async';
import 'dart:convert';
import 'package:yucashops/model/Datos_Contactos.dart';
import 'package:yucashops/pages/googleMaps.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:yucashops/model/ver.dart';

class CategoriaScreen extends StatefulWidget {
  @override
  _CategoriaScreenState createState() => _CategoriaScreenState();
}

class _CategoriaScreenState extends State<CategoriaScreen> {
  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;

  bool isDrawerOpen = false;
  final refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();
  bool loading = true;
  List<Datos_Students> data = <Datos_Students>[];
  Future<List<Datos_Students>> getData() async {
    var url =
        Uri.parse('http://192.168.1.72/crudapi/public/categoria/data?data=10');
    var response = await http.get(
      url,
      headers: {
        "Accept": "application/json",
      },
    );

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
    return AnimatedContainer(
      decoration: isDrawerOpen
          ? BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
            )
          : BoxDecoration(color: Colors.white),
      transform: Matrix4.translationValues(xOffset, yOffset, 0)
        ..scale(scaleFactor),
      duration: Duration(milliseconds: 250),
      child: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 5.0,
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(25),
                      topLeft: Radius.circular(25)),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 30.0,
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Container(
                      height: 120,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: categories.length,
                          itemBuilder: (context, index) {
                            return Container(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(5),
                                      boxShadow: shadowList,
                                    ),
                                    child: Image(
                                      image: AssetImage(
                                          categories[index]['imagePath']),
                                      height: 50,
                                      width: 50,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Text(
                                    categories[index]['name'],
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.grey[700],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    ListView.builder(
                      physics: ScrollPhysics(),
                      itemCount: data.length,
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return GestureDetector(
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
                            Navigator.of(context).push(MaterialPageRoute<Null>(
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
                          },
                          child: Container(
                            height: 180,
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Stack(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Colors.pink[600],
                                          /*color: (index % 2 == 0)
                                              ? Colors.blueGrey[200]
                                              : Colors.orangeAccent[200],*/
                                          borderRadius:
                                              BorderRadius.circular(0),
                                          boxShadow: shadowList,
                                        ),
                                        margin: EdgeInsets.all(10),
                                      ),
                                      /*ClipOval(
                                        child: Image.network(
                                          "http://192.168.1.72/yucashops/admin/public/storage/generic/logo_business.png",
                                          height: 200,
                                          width: 200,
                                          fit: BoxFit.cover,
                                        ),
                                      ),*/
                                      Align(
                                        child: Padding(
                                          padding: const EdgeInsets.all(15),
                                          child: Hero(
                                            tag: 'Tienda',
                                            child: Image(
                                              image: NetworkImage(
                                                  'http://192.168.1.72/yucashops/admin/public/storage/generic/logo_business.png'),
                                            ),
                                          ),
                                          /*child: Hero(
                                              tag:
                                                  'pet${catMapList[index]['id']}',
                                              child: Image.asset(
                                                  catMapList[index]
                                                      ['imagePath'])),*/
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    margin:
                                        EdgeInsets.only(top: 15, bottom: 15),
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(20),
                                          bottomRight: Radius.circular(20)),
                                      boxShadow: shadowList,
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          data[index].name,
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.cyan[800],
                                          ),
                                        ),
                                        Text(
                                          data[index].phone,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey[500],
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.email,
                                              color: Colors.pink[600],
                                              size: 18,
                                            ),
                                            SizedBox(
                                              width: 3,
                                            ),
                                            Flexible(
                                              child: new Container(
                                                padding: new EdgeInsets.only(
                                                    right: 13.0),
                                                child: new Text(
                                                  data[index].email,
                                                  overflow: TextOverflow.clip,
                                                  softWrap: false,
                                                  style: new TextStyle(
                                                    fontSize: 12.0,
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.location_on,
                                              color: Colors.cyan[800],
                                              size: 18,
                                            ),
                                            SizedBox(
                                              width: 3,
                                            ),
                                            Flexible(
                                              child: new Container(
                                                padding: new EdgeInsets.only(
                                                    right: 13.0),
                                                child: new Text(
                                                  data[index].address,
                                                  overflow: TextOverflow.clip,
                                                  softWrap: false,
                                                  style: new TextStyle(
                                                    fontSize: 12.0,
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
