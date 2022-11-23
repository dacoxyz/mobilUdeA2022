import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../boxes.dart';
import '../models/local_site.dart';
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
    final box = Boxes.getFavoritesBox();
    box.values.forEach((element) {
      if (element.id == widget.site.id) {
        isFavorite = true;
      }
    });


  }

  void _onFavoritesButtonClicked() async {
    var localSite = LocalSite()
      ..id = widget.site.id
      ..name = widget.site['name']
      ..description= widget.site['description']
      ..otrainfo = widget.site['otrainfo']
      ..ciudad= widget.site['ciudad']
      ..rating = widget.site['rating'].toString()
      ..latitud=widget.site['latitud'].toString()
      ..longitud=widget.site['longitud'].toString()
      ..urlPicture = widget.site['urlPicture'];


  /*
    ..name = widget.site.volumeInfo?.title
    ..description = widget.site.volumeInfo?.description
      ..author = widget.site.volumeInfo?.authors?[0]
      ..publishedDate = widget.site.volumeInfo?.publishedDate
      ..imageLink = widget.site.?.imageLinks?.smallThumbnail;
 */
    final box = Boxes.getFavoritesBox();
    box.add(localSite);

    if (isFavorite) {
      box.delete(localSite.id);
    } else {
      box.put(localSite.id, localSite);
    }

    setState(() {
      isFavorite = !isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.site['name']),
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
                          _onFavoritesButtonClicked();
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
                RatingBar.builder(
                  initialRating: widget.site['rating'],
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {

                  },
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
