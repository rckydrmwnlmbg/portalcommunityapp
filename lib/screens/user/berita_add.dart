import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:portalcommunity/contstant/contstant.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:portalcommunity/network/api.dart';
import 'package:portalcommunity/screens/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart';

import '../FirstPage.dart';

class BeritaAdd extends StatefulWidget {
  const BeritaAdd({Key? key}) : super(key: key);

  @override
  _BeritaAddState createState() => _BeritaAddState();
}

class _BeritaAddState extends State<BeritaAdd> {
  final _formkey = GlobalKey<FormState>();
  var userData;
  String dropdownvalue = 'Jayapura';

  TextEditingController by = TextEditingController();
  TextEditingController media = TextEditingController();
  TextEditingController namaberita = TextEditingController();
  TextEditingController ketberita = TextEditingController();
  TextEditingController linkberita = TextEditingController();
  TextEditingController komunitasValue = TextEditingController();

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

  File? image;
  final picker = ImagePicker();
  late String base64Image;

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        image = File(pickedFile.path);
      } else {
        print('Tidak ada gambar');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Tambah data Berita'),
          backgroundColor: mRedColor,
          elevation: 0,
        ),
        body: ListView(
          children: [
            Form(
                key: _formkey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Row(
                        children: [
                          const Text(
                            'Kabupaten',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: SizedBox(),
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
                        ],
                      ),
                    ),
                    TextFormField(
                      controller: komunitasValue,
                      decoration: const InputDecoration(
                          labelText: "Nama Komunitas",
                          hintText: "Nama Komunitas"),
                    ),
                    TextFormField(
                      controller: by,
                      decoration: const InputDecoration(
                          labelText: "By", hintText: "Online/Offline"),
                    ),
                    TextFormField(
                      controller: media,
                      decoration: const InputDecoration(labelText: "Media"),
                    ),
                    TextFormField(
                      controller: namaberita,
                      decoration:
                          const InputDecoration(labelText: "Nama Berita"),
                    ),
                    TextFormField(
                      controller: ketberita,
                      decoration:
                          const InputDecoration(labelText: "Keterangan Berita"),
                    ),
                    TextFormField(
                      controller: linkberita,
                      decoration:
                          const InputDecoration(labelText: "Link Berita"),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Row(
                        children: [
                          const Text(
                            'Dokumentasi',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: SizedBox(),
                          ),
                          TextButton.icon(
                              onPressed: () => getImage(),
                              icon: const Icon(Icons.add),
                              label: const Text('Tambah gambar'))
                        ],
                      ),
                    ),
                    image != null ? Image.file(image!) : Container(),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: SizedBox(),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          kirimBerita().then((value) {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const FirstPage()));
                          });
                        },
                        child: const Text('Kirim'))
                  ],
                )),
          ],
        ));
  }

  Future kirimBerita() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var userJson = localStorage.getString('user');
    var user = json.decode(userJson!);

    var data = {
      'user_id': user['id'].toString(),
      'komunitas_motor': komunitasValue,
      'kabupaten': dropdownvalue,
      'by': by.text,
      'media': media.text,
      'nama_berita': namaberita.text,
      'ket_berita': ketberita.text,
      'link_berita': linkberita.text,
      'status': '0',
    };
    var res = await CallApi().postData(data, 'user/berita');
    var body = json.decode(res.body);

    print(body);
    return body;
  }
}
