import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:portalcommunity/contstant/contstant.dart';
import 'package:portalcommunity/screens/FirstPage.dart';
import 'package:portalcommunity/screens/RegisterPage.dart';
import 'package:http/http.dart' as http;
import 'package:portalcommunity/screens/admin.dart';
import 'package:portalcommunity/screens/home_screen.dart';
import 'package:portalcommunity/network/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final String email, password, level, nama;
  bool _isLoading = false;

  var userData;

  final _formkey = GlobalKey<FormState>();
  TextEditingController emailInput = TextEditingController();
  TextEditingController passwordInput = TextEditingController();
  late ScaffoldState scaffoldState;

  void getLogin() async {
    setState(() {
      _isLoading = true;
    });

    var data = {'email': emailInput.text, 'password': passwordInput.text};

    var res = await CallApi().postData(data, 'login');
    var body = json.decode(res.body);
    print(body['success']);
    if (body['message'] == 'email atau password salah') {
      final snackBar = SnackBar(
        content: const Text('email atau password salah'),
        action: SnackBarAction(
          label: 'Close',
          onPressed: () {
            // Some code to undo the change!
          },
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else if (body['success'] == 'true') {}
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    localStorage.setString('token', body['0']['token']);
    localStorage.setString('user', json.encode(body['0']['user']));

    print(body['0']['user']['level']);
    if (body['0']['user']['level'] == 'admin') {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Admin()));
    } else if (body['0']['user']['level'] == 'user') {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const FirstPage()));
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: mRedColor,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 92,
              ),
              SizedBox(
                child: Image.asset('assets/images/honda_white.png'),
                height: 60,
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Portal Community",
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 28),
                  child: Form(
                    key: _formkey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const SizedBox(
                          height: 47,
                        ),
                        const Text(
                          "Email",
                          style: TextStyle(
                            fontFamily: "Avenir",
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color(0xffA6AEBC),
                          ),
                        ),
                        TextFormField(
                          controller: emailInput,
                          style: const TextStyle(
                            fontFamily: "LucidaGrande",
                            fontSize: 16,
                            color: Color(0xff0A1F44),
                            fontWeight: FontWeight.bold,
                          ),
                          decoration: InputDecoration(
                            fillColor: const Color(0xfff1f2f4),
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: const BorderSide(
                                    color: Colors.transparent)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: const BorderSide(
                                    color: Colors.transparent)),
                            errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: const BorderSide(
                                    color: Colors.transparent)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: const BorderSide(
                                    color: Colors.transparent)),
                            hintText: "Masukan email anda",
                            hintStyle: const TextStyle(
                              fontFamily: "LucidaGrande",
                              fontSize: 16,
                              color: Color(0xff0A1F44),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 19,
                        ),
                        const Text(
                          "Password",
                          style: TextStyle(
                            fontFamily: "Avenir",
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color(0xffA6AEBC),
                          ),
                        ),
                        TextFormField(
                          controller: passwordInput,
                          obscureText: true,
                          style: const TextStyle(
                            fontFamily: "LucidaGrande",
                            fontSize: 16,
                            color: Color(0xff0A1F44),
                            fontWeight: FontWeight.bold,
                          ),
                          decoration: InputDecoration(
                            fillColor: const Color(0xfff1f2f4),
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: const BorderSide(
                                    color: Colors.transparent)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: const BorderSide(
                                    color: Colors.transparent)),
                            errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: const BorderSide(
                                    color: Colors.transparent)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: const BorderSide(
                                    color: Colors.transparent)),
                            hintText: "••••••",
                            hintStyle: const TextStyle(
                              fontFamily: "LucidaGrande",
                              fontSize: 16,
                              color: Color(0xff0A1F44),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        const SizedBox(
                          height: 35,
                        ),
                        SizedBox(
                          height: 50,
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              _isLoading ? null : getLogin();
                            },
                            child: Text(
                              _isLoading ? 'Loading...' : 'Login',
                              style: const TextStyle(
                                  fontFamily: "LucidaGrande",
                                  fontSize: 14,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 48,
              ),
              RichText(
                  text: const TextSpan(
                text: "Belum punya akun? ",
                style: TextStyle(
                    fontFamily: "Avenir",
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.w500),
              )),
              TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RegisterPage()));
                  },
                  child: const Text('Registrasi Sekarang'))
            ],
          ),
        ),
      ),
    );
  }
}
