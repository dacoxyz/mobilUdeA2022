import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

enum Genre{masculino, femenino}

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _name=TextEditingController();
  final _email=TextEditingController();
  final _password=TextEditingController();
  final _repPassword=TextEditingController();

  String data="Información";
  Genre? _genre= Genre.masculino;

  void _onRegisterButtonClicked(){
    setState(() {
      String genre ="Masculino";
      if(_genre==Genre.femenino){
        genre="Femenino";
      }

      data="Nombre: ${_name.text} \nEmail:${_email.text} \nGenero:$genre";
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 16),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Image(
                    image: AssetImage('assets/images/viajeyturismo.png'),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                TextFormField(
                  controller: _name,
                  decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Nombre'),
                  keyboardType: TextInputType.name,
                ),
                const SizedBox(
                  height: 16.0,
                ),
                TextFormField(
                  controller: _email,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Correo Electronico'),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 16.0,
                ),
                TextFormField(
                  controller: _password,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Contraseña'),
                  keyboardType: TextInputType.visiblePassword,
                ),
                const SizedBox(
                  height: 16.0,
                ),
                TextFormField(
                  controller: _repPassword,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Repita la Contraseña'),
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(
                  height: 16.0,
                ),
                Row(
                  children:[
                   Expanded(
                     child: ListTile(
                       title:  const Text('Masculino'),
                       leading: Radio<Genre>(
                         value: Genre.masculino,
                         groupValue: _genre,
                         onChanged: (Genre? value){
                           setState(() {
                             _genre=value;
                           });
                         },
                       ),
                     ),
                   ),
                    Expanded(
                        child:ListTile(
                          title:  const Text('Femenino'),
                          leading: Radio<Genre>(
                            value: Genre.femenino,
                            groupValue: _genre,
                            onChanged: (Genre? value){
                              setState(() {
                                _genre=value;
                              });
                            },
                          ),
                        ),
                    ),
                  ],
                ),
                ElevatedButton(
                    style: TextButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 16),
                          ),
                    onPressed: (){
                      _onRegisterButtonClicked();
                    },
                    child: const Text("Registrar") ),
                Text(
                    data,
                    style: const TextStyle(
                      fontSize: 12, fontStyle: FontStyle.italic),
                    ),
              ],
            ),
          ),
        ),
      ),
    );

    //return Container();
  }
}
