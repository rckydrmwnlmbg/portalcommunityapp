import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:portalcommunity/contstant/contstant.dart';
import 'package:portalcommunity/network/api.dart';
import 'package:portalcommunity/screens/FirstPage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:file_picker/file_picker.dart';

class ProposalAdd extends StatefulWidget {
  const ProposalAdd({Key? key}) : super(key: key);

  @override
  _ProposalAddState createState() => _ProposalAddState();
}

class _ProposalAddState extends State<ProposalAdd> {
  final _formkey = GlobalKey<FormState>();
  var userData;
  String dropdownvalue = 'Jayapura';

  String kategorieventvalue = 'Touring';

  TextEditingController namaEvent = TextEditingController();
  TextEditingController komunitasValue = TextEditingController();
  TextEditingController lokasiEvent = TextEditingController();
  TextEditingController ketEvent = TextEditingController();
  TextEditingController rencanaMulai = TextEditingController();
  TextEditingController rencanaAkhir = TextEditingController();
  TextEditingController targetPeserta = TextEditingController();
  TextEditingController kontenAcara = TextEditingController();
  TextEditingController undanganPeserta = TextEditingController();
  TextEditingController nomorundanganPeserta = TextEditingController();
  TextEditingController undanganClubLain = TextEditingController();
  TextEditingController biayaBTLSharing = TextEditingController();
  TextEditingController biayaBTLSharingg = TextEditingController();
  TextEditingController biayaBTLSharingclub = TextEditingController();
  TextEditingController totalBiaya = TextEditingController();

  Widget buildFilePicker() {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
                readOnly: true,
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'File harus diupload';
                  } else {
                    return null;
                  }
                },
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(5.0),
                      ),
                      borderSide: BorderSide(color: Colors.white, width: 2)),
                  hintText: 'Upload File',
                  contentPadding: EdgeInsets.all(10.0),
                ),
                style: const TextStyle(fontSize: 16.0)),
          ),
          const SizedBox(width: 5),
          ElevatedButton.icon(
            icon: const Icon(
              Icons.upload_file,
              color: Colors.white,
              size: 24.0,
            ),
            label: const Text('Pilih File', style: TextStyle(fontSize: 16.0)),
            onPressed: () {
              getFiles();
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.lightBlue,
              minimumSize: const Size(122, 48),
              maximumSize: const Size(122, 48),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future getFiles() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(allowedExtensions: ['pdf', 'docx']);
  }

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

  var kategorievent = [
    'Touring',
    'Kopdar',
    'Anniversary',
    'Dekade',
    'Gathering',
    'Camping',
    'Lain-lain',
  ];

  get nama => null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Pengajuan Proposal'),
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
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Row(
                        children: [
                          const Text(
                            'Kategori Event',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: SizedBox(),
                          ),
                          DropdownButton(
                            value: kategorieventvalue,
                            elevation: 0,
                            icon: const Icon(Icons.keyboard_arrow_down_rounded),
                            items: kategorievent.map((String kategorievent) {
                              return DropdownMenuItem(
                                value: kategorievent,
                                child: Text(kategorievent),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                kategorievent = newValue! as List<String>;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    TextFormField(
                      controller: namaEvent,
                      decoration:
                          const InputDecoration(labelText: "Nama Event"),
                    ),
                    TextFormField(
                      controller: lokasiEvent,
                      decoration:
                          const InputDecoration(labelText: "Lokasi Event"),
                    ),
                    TextFormField(
                      controller: ketEvent,
                      decoration:
                          const InputDecoration(labelText: "Keterangan Event"),
                    ),
                    TextFormField(
                      controller: rencanaMulai,
                      decoration:
                          const InputDecoration(labelText: "Rencana Mulai"),
                    ),
                    TextFormField(
                      controller: rencanaAkhir,
                      decoration:
                          const InputDecoration(labelText: "Rencana Berakhir"),
                    ),
                    TextFormField(
                      controller: targetPeserta,
                      decoration:
                          const InputDecoration(labelText: "Target Peserta"),
                    ),
                    TextFormField(
                      controller: kontenAcara,
                      decoration:
                          const InputDecoration(labelText: "Konten Acara"),
                    ),
                    TextFormField(
                      controller: undanganPeserta,
                      decoration:
                          const InputDecoration(labelText: "Undangan Peserta"),
                    ),
                    TextFormField(
                      controller: nomorundanganPeserta,
                      decoration: const InputDecoration(
                          labelText: "No. Undangan Peserta"),
                    ),
                    TextFormField(
                      controller: undanganClubLain,
                      decoration: const InputDecoration(
                          labelText: "Undangan Club Lain"),
                    ),
                    TextFormField(
                      controller: totalBiaya,
                      decoration:
                          const InputDecoration(labelText: "Total Biaya"),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Row(
                        children: [
                          const Text(
                            'upload file Proposal',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: SizedBox(),
                          ),
                          TextButton.icon(
                              onPressed: () => getFiles(),
                              icon: const Icon(Icons.add),
                              label: const Text('Tambah file'))
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: SizedBox(),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: ElevatedButton(
                          onPressed: () {
                            kirimProposal().then((value) {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const FirstPage()));
                            });
                          },
                          child: const Text('Kirim')),
                    )
                  ],
                )),
          ],
        ));
  }

  Future kirimProposal() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var userJson = localStorage.getString('user');
    var user = json.decode(userJson!);

    var uri = Uri.parse("http://pub.dartlang.org/packages/create");
    var request = http.MultipartRequest('POST', uri);
    request.fields['user'] = 'nweiz@google.com';

    // var data = {
    //   'user_id': user['id'].toString(),
    //   'komunitas_motor': komunitasValue,
    //   'kabupaten': dropdownvalue,
    //   'kategori_event': kategorieventvalue,
    //   'nama_event': namaEvent.text,
    //   'lokasi_event': lokasiEvent.text,
    //   'ket_event': ketEvent.text,
    //   'rencana_mulai': rencanaMulai.text,
    //   'rencana_akhir': rencanaAkhir.text,
    //   'target_peserta': targetPeserta.text,
    //   'konten_acara': kontenAcara.text,
    //   'undangan_peserta': undanganPeserta.text,
    //   'no_undangan_peserta': nomorundanganPeserta.text,
    //   'undang_club_lain_target': undanganClubLain.text,
    //   'total_biaya': totalBiaya.text,
    //   'status': '0',
    // };
    // var res = await CallApi().postData(data, 'user/proposal');
    // var body = json.decode(res.body);

    // print(body);
    // return body;
  }
}
