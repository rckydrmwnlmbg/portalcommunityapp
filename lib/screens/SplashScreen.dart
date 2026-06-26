import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:portalcommunity/contstant/contstant.dart';
import 'package:portalcommunity/screens/FirstPage.dart';
import 'package:portalcommunity/screens/admin.dart';
import 'package:portalcommunity/screens/home_screen.dart';
import 'package:portalcommunity/screens/login.dart';
import 'package:shared_preferences/shared_preferences.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:splashscreen/splashscreen.dart';

class SplashScreenPortal extends StatefulWidget {
  const SplashScreenPortal({Key? key}) : super(key: key);

  @override
  _SplashScreenPortalState createState() => _SplashScreenPortalState();
}

class _SplashScreenPortalState extends State<SplashScreenPortal> {
  bool _isLoggedIn = false;

  @override
  void initState() {
    _checkIfLoggedIn();
    super.initState();
  }

  void _checkIfLoggedIn() async {
    // check if token is there
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('token');
    var user = localStorage.getString('user');
    if (user != null) {
      var dataUser = json.decode(user);
      if (token != null) {
        setState(() {
          _isLoggedIn = true;
        });
        if (dataUser['level'] == 'admin') {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => const Admin()));
        } else if (dataUser['level'] == 'user') {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const FirstPage()));
        }
      }
    } else {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const LoginScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 5,
      navigateAfterSeconds:
          _isLoggedIn ? _checkIfLoggedIn : const LoginScreen(),
      backgroundColor: mRedColor,
      image: Image.asset('assets/images/honda_white.png'),
      useLoader: true,
      photoSize: 90,
      loaderColor: Colors.white,
    );
  }
}
