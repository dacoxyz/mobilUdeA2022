import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'login_page.dart';
import 'package:turisudea2022/pages/home_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override

  void initState(){
    _closeSplash();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8,vertical: 16),
            child: Center(
              child: Image(
                image: AssetImage('assets/images/viajeyturismo.png'),
                  ),
              ),
            ),
        );
    //return Container();
  }

  Future<void> _closeSplash() async {
    Future.delayed(const Duration(seconds: 2), () async {
      var currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser == null) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const LoginPage()));
      } else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const HomePage()));
      }
   });
  }
}
