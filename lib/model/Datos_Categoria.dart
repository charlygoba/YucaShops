class Datos_Categoria {
  late int id;
  late String name;
  late String phone;
  late String description;
  late String email;
  late String address;
  late String latitud;
  late String longitud;
  late String image;
  late int activityid;

  Datos_Categoria(
      int id,
      String name,
      String phone,
      String description,
      String email,
      String address,
      String latitud,
      String longitud,
      String image,
      int activityid);

  Datos_Categoria.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    description = json['description'];
    email = json['email'];
    address = json['address'];
    latitud = json['latitud'];
    longitud = json['longitud'];
    image = json['image'];
    activityid = json['activity_id'];
  }
}