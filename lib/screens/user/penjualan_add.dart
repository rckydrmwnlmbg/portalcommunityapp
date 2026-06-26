import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:portalcommunity/contstant/contstant.dart';

import '../FirstPage.dart';
import '../home_screen.dart';

class PenjualanAdd extends StatefulWidget {
  const PenjualanAdd({Key? key}) : super(key: key);

  @override
  _PenjualanAddState createState() => _PenjualanAddState();
}

class _PenjualanAddState extends State<PenjualanAdd> {
  String dropdownvalue = 'Jayapura';
  String komunitasmotorvalue = 'Komunitas Motor Papua';
  String kategorimotorvalue = 'AT HIGH';
  String tempatvalue = 'Astra Motor Entrop';
  String pekerjaanvalue = 'Guru/Pendidikan';
  String fincoyvalue = 'FIF';

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
  var fincoy = [
    'FIF',
    'ADIRA',
    'IMFI',
    'MMF',
    'Lain-Lain',
  ];
  var kategorimotor = [
    'AT HIGH',
    'AT MID',
    'AT LOW',
    'SPORT MID',
    'SPORT HIGH',
    'SPORT LOW',
    'CUB HIGH',
    'CUB MID',
    'CUB LOW',
  ];
  var tempatpengajuan = [
    'Astra Motor Entrop',
    'Astra Motor Tanah Hitam',
    'Astra Motor Sentani',
    'Fajar Baru Jayapura',
    'Astra Motor Sorong 1',
    'Astra Motor Sorong 2',
    'Astra Motor Manokwari',
    'Sulawesi Manokwari',
    'Astra Motor Merauke',
    'Astra Motor Timika',
    'Fajar Baru Timika',
    'Astra Motor Nabire',
    'Sinar Pagi Nabire',
    'Sinar Pagi Biak',
    'Budijaya Wamena',
    'SWI Fak Fak',
    'Senja Indah Kaimana',
    'Arui Makmur',
  ];
  var pekerjaan = [
    'Buruh/Pembantu/Buruh Bangunan/Pelayan Rumah Makan',
    'Guru/Pendidikan',
    'Hiburan',
    'Honorer',
    'Jasa',
    'Ojek Motor',
    'Pedagang(Kios/OnlineShop/Pinang/Dll)',
    'Pegawai Bank BUMN (Mandiri/BRI/BNI/BTN/Bank Papua/Bank Daerah)',
    'Pegawai Bank Swasta (BCA/DANAMON/CIMB)',
    'Pegawai Hotel',
    'Pegawai Kesehatan (Dokter/Bidan/Perawat/Mantri/Apoteker)',
    'Pegawai Swasta',
    'Pelajar/Mahasiswa',
    'Pengjarin Tangan',
    'Pensiunan/Purnawirawan',
    'Perangkat Desa (RT/RW/Lurah/Camat/Pendamping Desa)',
    'Petani',
    'Peternak/Usaha Ternak',
    'PNS/BUMN/BUMD',
    'Polisi/POT PP/TNI/ABRI/HANSIP/TENAGA KEAMANAN',
    'Sewa/Rent',
    'Sopir Angkutan Umum/Sopir Pengantaran',
    'Wiraswasta/Pemilik Usaha',
    'lain-lain',
  ];

  File? image;

  get nama => null;
  Future getImageKTP() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? imagePicked =
        await _picker.pickImage(source: ImageSource.gallery);
    image = File(imagePicked!.path);
  }

  File? imageSPK;
  Future getImageSPK() async {
    final ImagePicker _pickerSPK = ImagePicker();
    final XFile? imagePicked =
        await _pickerSPK.pickImage(source: ImageSource.gallery);
    imageSPK = File(imagePicked!.path);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Tambah data Penjualan'),
          backgroundColor: mRedColor,
          elevation: 0,
        ),
        body: ListView(
          physics: const ClampingScrollPhysics(),
          padding: const EdgeInsets.only(left: 5),
          children: [
            Form(
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
                  decoration: const InputDecoration(labelText: "Nama Member"),
                ),
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Row(
                    children: [
                      const Text(
                        'Kategori Motor',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: SizedBox(),
                      ),
                      DropdownButton(
                        value: kategorimotorvalue,
                        elevation: 0,
                        icon: const Icon(Icons.keyboard_arrow_down_rounded),
                        items: kategorimotor.map((String kategorimotor) {
                          return DropdownMenuItem(
                            value: kategorimotor,
                            child: Text(kategorimotor),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            kategorimotor = newValue! as List<String>;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: "Type Motor"),
                ),
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Row(
                    children: [
                      const Text(
                        'Tempat Pengajuan',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: SizedBox(),
                      ),
                      DropdownButton(
                        value: tempatvalue,
                        elevation: 0,
                        icon: const Icon(Icons.keyboard_arrow_down_rounded),
                        items: tempatpengajuan.map((String tempatpengajuan) {
                          return DropdownMenuItem(
                            value: tempatpengajuan,
                            child: Text(tempatpengajuan),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            tempatpengajuan = newValue! as List<String>;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: "Nama Sales"),
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: "Nama Konsumen"),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 3),
                  child: Row(
                    children: const [
                      Text(
                        'Pekerjaan Konsumen',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: SizedBox(),
                      ),
                    ],
                  ),
                ),
                DropdownButton(
                  value: pekerjaanvalue,
                  elevation: 0,
                  icon: const Icon(Icons.keyboard_arrow_down_rounded),
                  items: pekerjaan.map((String pekerjaan) {
                    return DropdownMenuItem(
                      value: pekerjaan,
                      child: Text(pekerjaan),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      pekerjaan = newValue! as List<String>;
                    });
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Row(
                    children: [
                      const Text(
                        'FINCOY',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: SizedBox(),
                      ),
                      DropdownButton(
                        value: fincoyvalue,
                        elevation: 0,
                        icon: const Icon(Icons.keyboard_arrow_down_rounded),
                        items: fincoy.map((String fincoy) {
                          return DropdownMenuItem(
                            value: fincoy,
                            child: Text(fincoy),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            fincoy = newValue! as List<String>;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                TextFormField(
                  decoration:
                      const InputDecoration(labelText: "DP (Down Payment)"),
                ),
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Row(
                    children: [
                      const Text(
                        'Foto KTP',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: SizedBox(),
                      ),
                      TextButton.icon(
                          onPressed: () => getImageKTP(),
                          icon: const Icon(Icons.add),
                          label: const Text('Tambah gambar'))
                    ],
                  ),
                ),
                image != null ? Image.file(image!) : Container(),
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Row(
                    children: [
                      const Text(
                        'Foto SPK',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: SizedBox(),
                      ),
                      TextButton.icon(
                          onPressed: () => getImageSPK(),
                          icon: const Icon(Icons.add),
                          label: const Text('Tambah gambar'))
                    ],
                  ),
                ),
                imageSPK != null ? Image.file(imageSPK!) : Container(),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const FirstPage()));
                    },
                    child: const Text('Kirim'))
              ],
            ))
          ],
        ));
  }
}
