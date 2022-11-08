import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:turisudea2022/pages/home_page.dart';
import 'package:turisudea2022/pages/register_page.dart';
import '../models/User.dart';
import '../repository/firebase_api.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _email=TextEditingController();
  final _password=TextEditingController();

  User userLoad=User.Empty();
  final FirebaseApi _firebaseApi = FirebaseApi();

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

  void _onLoginButtonClicked(){
    setState(() {
      String log ="Entrando";
    });
    _validateUser();
  }
  @override
  void initState(){
    getUser();
    super.initState();
  }

  getUser() async {
    SharedPreferences prefs= await SharedPreferences.getInstance();
    Map<String, dynamic> userMap=jsonDecode(prefs.getString("user")!);
    userLoad = User.fromJson(userMap);
  }

  void _validateUser() async{
    /*if(_password.text==userLoad.password && _email.text==userLoad.email) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomePage()));
    }
    else{
      _showMsg (context, "Correo o Contraseña incorrecta");
    }*/

    if (_email.text.isEmpty || _password.text.isEmpty) {
      _showMsg(context, "Debe digitar el correo y la contrasena");
    } else {
      var result = await _firebaseApi.logInUser(_email.text, _password.text);
      String msg = "";
      if (result == "invalid-email") {
        msg = "El correo electónico está mal escrito";
      } else if (result == "wrong-password") {
        msg = "Correo o contrasena incorrecta";
      } else if (result == "network-request-failed") {
        msg = "Revise su conexion a internet";
      } else {
        msg = "Usuario registrado con exito";
        _showMsg(context,msg);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const HomePage()));
      }
    }

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
              children:  <Widget>[
                  const Image(
                  image: AssetImage('assets/images/viajeyturismo.png'),
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
                ElevatedButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 16),
                    ),
                    onPressed: (){
                      _onLoginButtonClicked();
                    },
                    child: const Text("Iniciar Sesión") ),
                TextButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(
                          fontSize: 16,
                          fontStyle: FontStyle.italic,
                          color: Colors.lightBlue),
                    ),
                    onPressed: (){
                        Navigator.push(context,
                          MaterialPageRoute(builder: (context)=>RegisterPage()));
                    },
                    child: const Text("Registrese") ),

              ],
            ),
          ),
        ),
        ),
    );
    //return Container();
  }
}
