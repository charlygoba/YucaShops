import 'dart:convert';

import 'package:yucashops/model/book.dart';
import 'package:http/http.dart' as http;

class BooksApi {
  static Future<List<Book>> getBooks(String query) async {
    final url = Uri.parse('http://192.168.1.72/crudapi/public/negocios');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List books = json.decode(response.body);

      return books.map((json) => Book.fromJson(json)).where((book) {
        final titleLower = book.name.toLowerCase();
        final authorLower = book.city.toLowerCase();
        final descriptionLower = book.description.toLowerCase();
        final searchLower = query.toLowerCase();

        return titleLower.contains(searchLower) ||
            authorLower.contains(searchLower) ||
            descriptionLower.contains(searchLower);
      }).toList();
    } else {
      throw Exception();
    }
  }
}
