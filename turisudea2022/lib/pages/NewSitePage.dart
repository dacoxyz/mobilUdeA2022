import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../models/site.dart' as Appsite;

import '../repository/firebase_api.dart';


class NewSitePage extends StatefulWidget {
  const NewSitePage({Key? key}) : super(key: key);

  @override
  State<NewSitePage> createState() => _NewSitePageState();
}

class _NewSitePageState extends State<NewSitePage> {
  final FirebaseApi _firebaseApi = FirebaseApi();

  final _id= TextEditingController();
  final _name = TextEditingController();
  final _description= TextEditingController();
  final _otrainfo= TextEditingController();
  final _ciudad= TextEditingController();
  final _departamento= TextEditingController();
  final _temperature= TextEditingController();
  final _phone= TextEditingController();
  final _urlPicture = TextEditingController();
  final _latitud= TextEditingController();
  final _longitude= TextEditingController();
  final _address = TextEditingController();

  double _rating = 3.0;



  void _showMsg(String msg){
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(content: Text(msg),
        action: SnackBarAction(
            label: 'Aceptar', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }

  void _createsite(Appsite.site site) async{
    var result = await _firebaseApi.createsite(site);
    _showMsg(result);
    Navigator.pop(context);
  }

  void _savesite() {
    var site = Appsite.site("", _name.text, _description.text, _otrainfo.text,_ciudad.text,
      _departamento.text,_temperature.text,_phone.text,_urlPicture.text,
        _latitud.text,_longitude.text,_address.text,_rating );
    _createsite(site);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Nuevo Sitio"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _name,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Nombre:'),
                keyboardType: TextInputType.text,
              ),
              const SizedBox(
                height: 16.0,
              ),
              TextFormField(
                controller: _description,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Descripción:'),
                keyboardType: TextInputType.text,
              ),
              const SizedBox(
                height: 16.0,
              ),
              TextFormField(
                controller: _otrainfo,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Otra Información'),
                keyboardType: TextInputType.text,
              ),
              const SizedBox(
                height: 16.0,
              ),
              TextFormField(
                controller: _ciudad,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Ciudad:'),
                keyboardType: TextInputType.text,
              ),
              const SizedBox(
                height: 16.0,
              ),
              TextFormField(
                controller: _departamento,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Departamento:'),
                keyboardType: TextInputType.text,
              ),
              const SizedBox(
                height: 16.0,
              ),
              TextFormField(
                controller: _temperature,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Temperatura:'),
                keyboardType: TextInputType.text,
              ),
              const SizedBox(
                height: 16.0,
              ),
              TextFormField(
                controller: _urlPicture,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Fotografia:'),
                keyboardType: TextInputType.text,
              ),
              const SizedBox(
                height: 16.0,
              ),
              TextFormField(
                controller: _latitud,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Latitud:'),
                keyboardType: TextInputType.text,
              ),
              const SizedBox(
                height: 16.0,
              ),
              TextFormField(
                controller: _longitude,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Longitud:'),
                keyboardType: TextInputType.text,
              ),
              const SizedBox(
                height: 16.0,
              ),
              TextFormField(
                controller: _address,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Dirección:'),
                keyboardType: TextInputType.text,
              ),
              const SizedBox(
                height: 16.0,
              ),
              RatingBar.builder(
                initialRating: 3,
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
                  _rating = rating;
                },
              ),
              const SizedBox(
                height: 16.0,
              ),
              const Text(
                "Genero(s) del libro",
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 16.0,
              ),

              ElevatedButton(
                onPressed: () {
                  _savesite();
                },
                child: const Text("Guardar Sitio"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}