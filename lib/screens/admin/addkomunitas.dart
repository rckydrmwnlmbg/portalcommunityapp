import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:portalcommunity/network/api.dart';
import 'package:portalcommunity/screens/admin/komunitas.dart';

class AddKomunitas extends StatefulWidget {
  const AddKomunitas({Key? key}) : super(key: key);

  @override
  State<AddKomunitas> createState() => _AddKomunitasState();
}

class _AddKomunitasState extends State<AddKomunitas> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController namakomunitas = TextEditingController();

  Future saveData() async {
    var data = {'nama_komunitas': namakomunitas.text};

    var res = await CallApi().postData(data, 'admin/komunitas');
    var body = json.decode(res.body);

    print(body);
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => const KomunitasList()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah data komunitas'),
      ),
      body: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: namakomunitas,
                decoration: const InputDecoration(
                    labelText: "Nama Komunitas",
                    hintText: "Masukan Nama Komunitas disini"),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: saveData, child: const Text('Tambah Data'))
            ],
          )),
    );
  }
}
