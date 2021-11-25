class Book {
  final int id;
  final String name;
  final String city;
  final String image;
  final String description;

  const Book({
    required this.id,
    required this.name,
    required this.city,
    required this.image,
    required this.description,
  });

  factory Book.fromJson(Map<String, dynamic> json) => Book(
        id: json['id'],
        name: json['name'],
        city: json['city'],
        image: json['logo'],
        description: json['description'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'city': city,
        'logo': image,
        'description': description,
      };
}
