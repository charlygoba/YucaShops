import 'dart:async';

import 'package:yucashops/api/books_api.dart';
import 'package:yucashops/main.dart';
import 'package:yucashops/model/book.dart';
import 'package:yucashops/widget/search_widget.dart';
import 'package:flutter/material.dart';

class FilterNetworkListPage extends StatefulWidget {
  @override
  FilterNetworkListPageState createState() => FilterNetworkListPageState();
}

class FilterNetworkListPageState extends State<FilterNetworkListPage> {
  List<Book> books = [];
  String query = '';
  Timer? debouncer;

  @override
  void initState() {
    super.initState();

    init();
  }

  @override
  void dispose() {
    debouncer?.cancel();
    super.dispose();
  }

  void debounce(
    VoidCallback callback, {
    Duration duration = const Duration(milliseconds: 1000),
  }) {
    if (debouncer != null) {
      debouncer!.cancel();
    }

    debouncer = Timer(duration, callback);
  }

  Future init() async {
    final books = await BooksApi.getBooks(query);

    setState(() => this.books = books);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink[600],
          title: Text('Apoya al Comercio Local'),
          centerTitle: true,
        ),
        body: Column(
          children: <Widget>[
            buildSearch(),
            Expanded(
              child: ListView.builder(
                itemCount: books.length,
                itemBuilder: (context, index) {
                  final book = books[index];

                  return buildBook(book);
                },
              ),
            ),
          ],
        ),
      );

  Widget buildSearch() => SearchWidget(
        text: query,
        hintText:
            'Escribe el Nombre, Producto, Servicio o ciudad que deseas encontrar',
        onChanged: searchBook,
      );

  Future searchBook(String query) async => debounce(() async {
        final books = await BooksApi.getBooks(query);

        if (!mounted) return;

        setState(() {
          this.query = query;
          this.books = books;
        });
      });

  Widget buildBook(Book book) => ListTile(
        leading: Image.network(
          'http://192.168.1.72/yucashops/admin/public/storage/' + book.image,
          fit: BoxFit.cover,
          width: 50,
          height: 50,
        ),
        title: Text(book.name),
        subtitle: Text(book.city),
      );
}
