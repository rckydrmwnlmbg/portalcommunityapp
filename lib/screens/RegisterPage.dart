import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:portalcommunity/network/api.dart';
import 'package:portalcommunity/screens/admin/komunitas.dart';
import 'package:portalcommunity/screens/login.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formkey = GlobalKey<FormState>();

  TextEditingController namaInput = TextEditingController();
  TextEditingController emailInput = TextEditingController();
  TextEditingController komunitasValue = TextEditingController();
  TextEditingController passwordInput = TextEditingController();
  TextEditingController lahirInput = TextEditingController();

  List<dynamic> _dataKomunitas = [];
  String dropdownvalue = 'Jayapura';
  var kabupaten = [
    'Jayapura',
    'Sorong',
    'Manokwari',
    'Merauke',
    'Timika',
    'Nabire',
    'Biak',
    'Wamena',
    'Serui',
    'Arui',
    'Kaimana',
    'Fakfak',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registrasi'),
      ),
      body: ListView(
        children: [
          Form(
              key: _formkey,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Masukan nama";
                          }
                          return null;
                        },
                        controller: namaInput,
                        decoration:
                            const InputDecoration(labelText: "Nama Lengkap"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Masukan Komunitas Motor";
                          }
                          return null;
                        },
                        controller: komunitasValue,
                        decoration: const InputDecoration(
                            labelText: "Komunitas Motor",
                            hintText: "Masukan Nama Komunitas Motor"),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: SizedBox(),
                    ),
                    const Text(
                      'Kabupaten',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    DropdownButton(
                      value: dropdownvalue,
                      elevation: 0,
                      icon: const Icon(Icons.keyboard_arrow_down_rounded),
                      items: kabupaten.map((String kabupaten) {
                        return DropdownMenuItem(
                          value: kabupaten,
                          child: Text(kabupaten),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownvalue = newValue!;
                        });
                      },
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: SizedBox(),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Masukan nama";
                          }
                          return null;
                        },
                        controller: lahirInput,
                        decoration: const InputDecoration(
                            labelText: "Tanggal Lahir", hintText: "YYYY-MM-DD"),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: SizedBox(),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Masukan nama";
                          }
                          return null;
                        },
                        controller: emailInput,
                        decoration: const InputDecoration(labelText: "Email"),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: SizedBox(),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Masukan nama";
                          }
                          return null;
                        },
                        controller: passwordInput,
                        obscureText: true,
                        decoration:
                            const InputDecoration(labelText: "Password"),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: SizedBox(),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          _getRegist().then((value) {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginScreen()));
                          });
                        },
                        child: const Text("Kirim")),
                  ],
                ),
              )),
        ],
      ),
    );
  }

  Future _getRegist() async {
    var data = {
      'nama': namaInput.text,
      'komunitas_motor': komunitasValue,
      'kabupaten': dropdownvalue,
      'tgl_lahir': lahirInput.text,
      'email': emailInput.text,
      'password': passwordInput.text,
      'status': '0',
      'level': 'user',
      'poin': '0'
    };
    var res = await CallApi().postData(data, 'regist');
    var body = json.decode(res.body);

    print(body);
    return body;
  }
}
