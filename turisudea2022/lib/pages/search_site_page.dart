import 'package:flutter/material.dart';
import '../models/result.dart';
//import 'package:mis_libros/pages/detail_search_book_page.dart';
//import 'package:mis_libros/repository/books_api.dart';

class SearchSitePage extends StatefulWidget {
  const SearchSitePage({Key? key}) : super(key: key);

  @override
  State<SearchSitePage> createState() => _SearchSitePageState();
}

class _SearchSitePageState extends State<SearchSitePage> {
  //SitesApi _SitesApi = SitesApi();

  final _parametro = TextEditingController();

  List<Items> listSites = <Items>[];

  Future _searchSite() async {
    //Result resultFuture = await _SitesApi.getSites(_parametro.text);
    //setState(() {
    //  resultFuture.items?.forEach((element) {
    //    listSites.add(element);
    //  });
    //});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: Center(
          child: Column(children: [
            TextFormField(
              controller: _parametro,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Digite sitio o descripción"),
              keyboardType: TextInputType.text,
            ),
            const SizedBox(
              height: 16.0,
            ),
            ElevatedButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () {
                _searchSite();
              },
              child: const Text('Buscar Sitio'),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: listSites.length,
                itemBuilder: (BuildContext context, int index) {
                  Items Site = listSites[index];
                  return Card(
                    child: ListTile(
                      leading: Image.network(
                        Site.volumeInfo?.imageLinks?.smallThumbnail ?? "",
                        errorBuilder: (BuildContext context, Object exception,
                            StackTrace? stackTrace) {
                          return const Image(
                            image: AssetImage('assets/images/viajeyturismo.png'),
                          );
                        },
                      ),
                      title: Text(Site.volumeInfo?.title ?? "No title"),
                      subtitle: Text(
                          Site.volumeInfo?.publishedDate ?? "No publishedDate"),
                      onTap: () {
                        /*Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    DetailSearchSitePage(Site)));*/
                      },
                    ),
                  );
                },
              ),
            ),
          ]),
        ),
      ),
    );
  }
}