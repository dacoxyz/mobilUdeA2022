import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../models/result.dart';

class DetailSearchSitePage extends StatefulWidget {
  //final Items site;
  final QueryDocumentSnapshot site;
  const DetailSearchSitePage(this.site);

  @override
  State<DetailSearchSitePage> createState() => _DetailSearchSitePageState();
}

class _DetailSearchSitePageState extends State<DetailSearchSitePage> {
  var isFavorite = false;

  @override
  void initState() {
    _getLocalSite();
    super.initState();
  }

  void _getLocalSite() {
  /*  final box = Boxes.getFavoritesBox();
    box.values.forEach((element) {
      if (element.id == widget.book.id) {
        isFavorite = true;
      }
    });

   */
  }
/*
  void _onFavoritesButtonClicked() async {
    var localBook = LocalBook()
      ..id = widget.book.id
      ..name = widget.book.volumeInfo?.title
      ..author = widget.book.volumeInfo?.authors?[0]
      ..publishedDate = widget.book.volumeInfo?.publishedDate
      ..description = widget.book.volumeInfo?.description
      ..imageLink = widget.book.volumeInfo?.imageLinks?.smallThumbnail;

    final box = Boxes.getFavoritesBox();
    //box.add(localBook);

    if (isFavorite) {
      box.delete(localBook.id);
    } else {
      box.put(localBook.id, localBook);
    }

    setState(() {
      isFavorite = !isFavorite;
    });
  }
*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text( widget.site['name']),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                  widget.site['urlPicture'],
                  errorBuilder: (BuildContext context, Object exception,
                      StackTrace? stackTrace) {
                    return const Image(
                      image: AssetImage('assets/images/viajeyturismo.png'),
                    );
                  },
                ),
                Row(
                  children: [
                    Expanded(
                      child: IconButton(
                        alignment: Alignment.topLeft,
                        icon: Icon(
                            isFavorite ? Icons.favorite : Icons.favorite_border),
                        color: Colors.red,
                        onPressed: (() {
                          //_onFavoritesButtonClicked();
                        }),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Ciudad: ${widget.site['ciudad']}",
                    textAlign: TextAlign.justify,
                    style: const TextStyle(
                        fontSize: 17.0, fontStyle: FontStyle.italic),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Departamento: ${widget.site['departamento']}",
                    textAlign: TextAlign.justify,
                    style: const TextStyle(
                        fontSize: 17.0, fontStyle: FontStyle.italic),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Temperatura: ${widget.site['temperature'].toString()}",
                    textAlign: TextAlign.justify,
                    style: const TextStyle(
                        fontSize: 17.0, fontStyle: FontStyle.italic),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Nombre del Lugar: ${widget.site['name']}",
                    textAlign: TextAlign.justify,
                    style: const TextStyle(
                        fontSize: 17.0, fontStyle: FontStyle.italic),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Descripción : ${widget.site['description']}",
                    textAlign: TextAlign.justify,
                    style: const TextStyle(
                        fontSize: 17.0, fontStyle: FontStyle.italic),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Otra Información de Interes : ${widget.site['otrainfo']}",
                    textAlign: TextAlign.justify,
                    style: const TextStyle(
                        fontSize: 17.0, fontStyle: FontStyle.italic),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.site['rating'].toString(),
                    textAlign: TextAlign.justify,
                    style: const TextStyle(
                        fontSize: 17.0, fontStyle: FontStyle.italic),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
