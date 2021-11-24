class Datos_Negocio {
  late int id;
  late String name;
  late String address;
  late String email;
  late String web;
  late String latitud;
  late String longitud;
  late String city;
  late String phone;
  late String description;
  late String facebook;
  late String image;

  Datos_Negocio(
   int id,
   String name,
   String address,
   String email,
   String web,
   String latitud,
   String longitud,
   String city,
   String phone,
   String description,
   String facebook,
   String image);

  Datos_Negocio.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    address = json['address'];
    email = json['email'];
    web = json['web'];
    latitud = json['latitud'];
    longitud = json['longitud'];
    city = json['city'];
    phone = json['phone'];
    description = json['description'];
    facebook = json['facebook'];
    image = json['image'];
  }
}
