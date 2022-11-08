import 'package:flutter/material.dart';

import '../repository/firebase_api.dart';
import 'login_page.dart';
//import 'package:shared_preferences/shared_preferences.dart';
import '../models/User.dart' as UserApp;

enum Genre{masculino, femenino}

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final FirebaseApi _firebaseApi = FirebaseApi();

  final _name=TextEditingController();
  final _email=TextEditingController();
  final _password=TextEditingController();
  final _repPassword=TextEditingController();
  final _bornDate=TextEditingController();

  String data="Información";
  Genre? _genre= Genre.masculino;

  void _saveUser2(UserApp.User user) async {
    var result = await _firebaseApi.createUser(user);
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const LoginPage()));
  }

  void _registerUser (UserApp.User user) async{
    //SharedPreferences prefs= await SharedPreferences.getInstance();
    //prefs.setString("user", jsonEncode(user));
    var result = await _firebaseApi.registerUser(user.email, user.password);
    String msg = "";
    if (result == "invalid-email") {
      msg = "El correo electónico está mal escrito";
    } else if (result == "weak-password") {
      msg = "La contrasena debe tener minimo 6 digitos";
    } else if (result == "email-already-in-use") {
      msg = "Ya existe una cuenta con ese correo electronico";
    } else if (result == "network-request-failed") {
      msg = "Revise su conexion a internet";
    } else {
      msg = "Usuario registrado con exito";

      _showMsg(context,msg);
      user.uid=result;
      //user. = result;
      _saveUser2(user);
    }

    //Navigator.pushReplacement(
    //    context, MaterialPageRoute(builder: (context) => const LoginPage()));
  }


  void _saveUser (UserApp.User user) async{
    //SharedPreferences prefs= await SharedPreferences.getInstance();
    //prefs.setString("user", jsonEncode(user));
    var result = await _firebaseApi.registerUser(user.email, user.password);
    String msg = "";
    if (result == "invalid-email") {
      msg = "El correo electónico está mal escrito";
    } else if (result == "weak-password") {
      msg = "La contrasena debe tener minimo 6 digitos";
    } else if (result == "email-already-in-use") {
      msg = "Ya existe una cuenta con ese correo electronico";
    } else if (result == "network-request-failed") {
      msg = "Revise su conexion a internet";
    } else {
      msg = "Usuario registrado con exito";

      //user. = result;
      _saveUser(user);
    }
    _showMsg(context,msg);
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const LoginPage()));
  }



  void _showMsg(BuildContext context,String msg){
    final scaffold =ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content:Text(msg),
        action: SnackBarAction(
          label: 'Aceptar', onPressed: scaffold.hideCurrentSnackBar),
        ),
      );
  }
DateTime _date= DateTime(2022,1,1);
String buttonMsg="Fecha de Nacimiento";

  void _showSelectedDate() async {
  final DateTime? newDate = await showDatePicker(
      context: context,
      initialDate: DateTime(2022,4),
      firstDate: DateTime(1940,1),
      lastDate: DateTime(2022,12),
    helpText: "Fecha de nacimiento",
    );
    if (newDate !=null){
      setState((){
        _date=newDate;
        buttonMsg = "Fecha de Nacimiento:${_date.toString()}";
        _bornDate.text=_date.toString();
      }
      );
    }
  }

  Future<void> _closeSplash() async {
    Future.delayed(const Duration(seconds: 10), () async {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => const LoginPage()));
    });
  }

  void _onRegisterButtonClicked(){
    setState(() {
      String genre ="Masculino";

      if(_password.text==_repPassword.text){

        if(_genre==Genre.femenino){
          genre="Femenino";
        }
        var user = UserApp.User("",_name.text,_email.text, _password.text, genre,_bornDate.text);
        data="Nombre: ${_name.text} \nEmail:${_email.text} \nGenero:$genre \nFecha:$_date";
        //_saveUser(user);
        _registerUser(user);
        //_closeSplash();
      }
      else
        {
          _showMsg(context, "Las contraseñas deben ser iguales");
        }
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
                      _showSelectedDate();
                    },
                    child:  Text(buttonMsg) ),
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
