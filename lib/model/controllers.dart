import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

// delete
Future<http.Response?> deleteStudents(String id) async {
  final http.Response response;
  response = await http.delete(
    Uri.parse('http://192.168.1.72/crudapi/public/students/delete/$id'), //http://yucashops.ga/api/public/negocios
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
}

Future<http.Response> updateStudents(String id, String name, String grade,
    String group_, String email, String direccion, String lat, String long_) {
  return http.post(
    Uri.parse('http://192.168.1.72/crudapi/public/students/update/$id'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'name': name,
      'grade': grade,
      'group_': group_,
      'email': email,
      'direccion': direccion,
      'lat': lat,
      'long_': long_
    }),
  );
}

Future<http.Response> createStudents(String name, String grade, String group_,
    String email, String direccion, String lat, String long_) {
  return http.post(
    Uri.parse('http://192.168.1.72/crudapi/public/students/add'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'name': name,
      'grade': grade,
      'group_': group_,
      'email': email,
      'direccion': direccion,
      'lat': lat,
      'long_': long_
    }),
  );
}
