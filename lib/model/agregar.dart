import 'package:yucashops/pages/home.dart';
import 'package:flutter/material.dart';
import 'controllers.dart';
import 'package:flutter/services.Dart';

class Agregar extends StatefulWidget {
  @override
  _CreateStudents createState() => _CreateStudents();
}

class _CreateStudents extends State<Agregar> {
  late TextEditingController nameTextController;
  late TextEditingController phoneTextController;
  late TextEditingController descriptionTextController;
  late TextEditingController emailTextController;
  late TextEditingController addressTextController;
  late TextEditingController latitudTextController;
  late TextEditingController longitudTextController;
  late String name;
  late String phone;
  late String description;
  late String email;
  late String address;
  late String latitud;
  late String longitud;
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Agregar estudiante'),
        ),
        body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
                key: formkey,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 50),
                    TextFormField(
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(255),
                      ],
                      decoration: InputDecoration(labelText: "Nombre:"),
                      initialValue: '',
                      onSaved: (value) {
                        name = value!;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return '¡Campo Vacio!';
                        }
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: "Correo:"),
                      initialValue: '',
                      onSaved: (value) {
                        email = value!;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Campo Vacio';
                        }
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: "Telefono:"),
                      keyboardType: TextInputType.number,
                      initialValue: '',
                      onSaved: (value) {
                        phone = value!;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Campo Vacio';
                        }
                      },
                    ),
                    TextFormField(
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                      ],
                      decoration: InputDecoration(labelText: "Descripcion:"),
                      initialValue: '',
                      onSaved: (value) {
                        description = value!;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Campo Vacio';
                        }
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: "Direccion:"),
                      initialValue: '',
                      onSaved: (value) {
                        address = value!;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Campo Vacio';
                        }
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: "Latitud:"),
                      initialValue: '',
                      onSaved: (value) {
                        latitud = value!;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Campo Vacio';
                        }
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: "Longitud:"),
                      initialValue: '',
                      onSaved: (value) {
                        longitud = value!;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Campo Vacio';
                        }
                      },
                    ),
                    const SizedBox(height: 30),
                    RaisedButton(
                      child: Text('Agregar'),
                      onPressed: () {
                        setState(() {
                          _addStudents(context);
                        });
                      },
                    ),
                  ],
                ))));
  }

  void _addStudents(BuildContext context) {
    if (formkey.currentState!.validate()) {
      formkey.currentState!.save();
      createStudents(this.name, this.phone, this.description, this.email,
          this.address, this.latitud, this.longitud);
      // Navigator.of(context).Push(new MaterialPageRoute(builder: (context) => HomePage())).whenComplete(retrieveData);
      Navigator.of(context)
          .push(new MaterialPageRoute(builder: (context) => HomePage()));
      // Navigator.of(context)
      //     .push(new MaterialPageRoute<String>(builder: (BuildContext context) {
      //   return new HomePage();
      // }));
    }
  }
}
