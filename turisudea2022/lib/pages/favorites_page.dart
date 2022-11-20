import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:turisudea2022/models/local_site.dart';

import '../boxes.dart';

class FavoritesPage  extends StatefulWidget {
  const FavoritesPage ({Key? key}) : super(key: key);

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: Center(
          child: _buildListView(),
        ),
      ),
    );
  }

  Widget _buildListView() {
    return ValueListenableBuilder<Box<LocalSite>>(
        valueListenable: Boxes.getFavoritesBox().listenable(),
        builder: (context, box, _) {
          final bookBox = box.values.toList().cast<LocalSite>();
          return ListView.builder(
            itemCount: bookBox.length,
            itemBuilder: (BuildContext context, int index) {
              final book = bookBox[index];
              return Card(
                child: ListTile(
                  leading: Image.network(
                    book.urlPicture ?? "",
                    errorBuilder: (BuildContext context, Object exception,
                        StackTrace? stackTrace) {
                      return const Image(
                        image: AssetImage('assets/images/viajeyturismo.png'),
                      );
                    },
                  ),
                  title: Text(book.name ?? "No Nombre"),
                  subtitle: Text(book.description ?? "No Descripcion"),
                  onLongPress: () {
                    setState(() {
                      book.delete();
                    });
                  },
                ),
              );
            },
          );
        });
  }
}