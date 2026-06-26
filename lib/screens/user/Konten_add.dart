import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:portalcommunity/contstant/contstant.dart';

import '../FirstPage.dart';
import '../home_screen.dart';

class KontenAdd extends StatefulWidget {
  const KontenAdd({Key? key}) : super(key: key);

  @override
  _KontenAddState createState() => _KontenAddState();
}

class _KontenAddState extends State<KontenAdd> {
  get nama => null;

  @override
  Widget build(BuildContext context) {
    String dropdownvalue = 'Jayapura';
    String komunitasmotorvalue = 'Komunitas Motor Papua';
    DateTime _awal;
    DateTime _akhir;

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
    var komunitasmotor = [
      'Komunitas Motor Papua',
      'Komunitas Motor Fakfak',
    ];

    File? image;
    Future getImage() async {
      final ImagePicker _picker = ImagePicker();
      final XFile? imagePicked =
          await _picker.pickImage(source: ImageSource.gallery);
      image = File(imagePicked!.path);
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text('Tambah data Konten Kreatif Digital'),
          backgroundColor: mRedColor,
          elevation: 0,
        ),
        body: ListView(
          children: [
            Form(
                child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(labelText: "Judul Konten"),
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: "Isi Konten"),
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: "Penulis"),
                ),
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
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Row(
                    children: [
                      const Text(
                        'Komunitas Motor',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: SizedBox(),
                      ),
                      DropdownButton(
                        value: komunitasmotorvalue,
                        elevation: 0,
                        icon: const Icon(Icons.keyboard_arrow_down_rounded),
                        items: komunitasmotor.map((String komunitasmotor) {
                          return DropdownMenuItem(
                            value: komunitasmotor,
                            child: Text(komunitasmotor),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            komunitasmotor = newValue! as List<String>;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: "Media"),
                ),
                TextFormField(
                  decoration:
                      const InputDecoration(labelText: "Kategori Konten"),
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: "Link Konten"),
                ),
                Row(
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                      child: Text('Periode Mulai'),
                    ),
                  ],
                ),
                Row(
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                      child: Text('Periode Berakhir'),
                    ),
                  ],
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: "Target Like"),
                ),
                TextFormField(
                  decoration:
                      const InputDecoration(labelText: "Like yang didapatkan"),
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: "Target Share"),
                ),
                TextFormField(
                  decoration:
                      const InputDecoration(labelText: "Share yang didapatkan"),
                ),
                TextFormField(
                  decoration:
                      const InputDecoration(labelText: "Target Komentar"),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      labelText: "Komentar yang didapatkan"),
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
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const FirstPage()));
                      },
                      child: const Text('Kirim')),
                )
              ],
            )),
          ],
        ));
  }
}
