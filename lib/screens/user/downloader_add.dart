import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:portalcommunity/contstant/contstant.dart';
import 'package:portalcommunity/screens/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../network/api.dart';
import '../FirstPage.dart';

class DownloaderAdd extends StatefulWidget {
  const DownloaderAdd({Key? key}) : super(key: key);

  @override
  _DownloaderAddState createState() => _DownloaderAddState();
}

class _DownloaderAddState extends State<DownloaderAdd> {
  final _formkey = GlobalKey<FormState>();
  var userData;

  TextEditingController namaMember = TextEditingController();
  TextEditingController kodeReferal = TextEditingController();
  TextEditingController namaKonsumen = TextEditingController();
  TextEditingController komunitasValue = TextEditingController();

  String dropdownvalue = 'Jayapura';
  List<dynamic> _dataKomunitas = [];

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
          title: const Text('Tambah data downloader'),
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
                      decoration:
                          const InputDecoration(labelText: "Nama Komunitas"),
                    ),
                    TextFormField(
                      controller: namaMember,
                      decoration:
                          const InputDecoration(labelText: "Nama Member"),
                    ),
                    TextFormField(
                      controller: kodeReferal,
                      decoration:
                          const InputDecoration(labelText: "Kode Referal"),
                    ),
                    TextFormField(
                      controller: namaKonsumen,
                      decoration:
                          const InputDecoration(labelText: "Nama Konsumen"),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Row(
                        children: [
                          const Text(
                            'Dokumentasi Download',
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
      'nama_member': namaMember.text,
      'kode_referal': kodeReferal.text,
      'nama_konsumen': namaKonsumen.text,
      'status': '0',
    };
    var res = await CallApi().postData(data, 'user/downloader');
    var body = json.decode(res.body);

    print(body);
    return body;
  }
}
