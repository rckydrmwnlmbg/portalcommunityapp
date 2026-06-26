import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:portalcommunity/network/api.dart';
import 'package:portalcommunity/screens/admin/konten_kreatif.dart';
import 'package:shared_preferences/shared_preferences.dart';

class KontenDetail extends StatefulWidget {
  final Map konten;
  const KontenDetail({Key? key, required this.konten}) : super(key: key);

  @override
  State<KontenDetail> createState() => _KontenDetailState();
}

class _KontenDetailState extends State<KontenDetail> {
  var userData;
  void _getUserInfo() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var userJson = localStorage.getString('user');
    Map<String, dynamic> user =
        Map<String, dynamic>.from(json.decode(userJson!));

    setState(() {
      userData = user["id"];
    });
  }

  void _approve() async {
    var data = {
      'proses': 'approve',
      'id_user': userData,
      'id': widget.konten['id']
    };
    final res = await CallApi()
        .putData(data, 'admin/kontenkreatif/' + widget.konten['id'].toString());
    var body = json.decode(res.body);
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const KontenAdmin()));

    print(body);
    return body;
  }

  void _notApprove() async {
    var data = {
      'proses': 'notApprove',
      'id_user': userData,
      'id': widget.konten['id']
    };
    final res = await CallApi()
        .putData(data, 'admin/kontenkreatif/${widget.konten['id']}');
    var body = json.decode(res.body);
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const KontenAdmin()));

    print(body);
    return body;
  }

  @override
  Widget build(BuildContext context) {
    String status = "";
    if (widget.konten['status'] == '3') {
      status = "Approve";
    } else if (widget.konten['status'] == '0') {
      status = "menunggu verifikasi";
    } else if (widget.konten['status'] == '1') {
      status = "diverifikasi oleh irfandi ahmad";
    } else if (widget.konten['status'] == '3') {
      status = "diverifikasi oleh Oging Adria Fitra Sakti";
    } else if (widget.konten['status'] == '4') {
      status = "Verifikasi Akun ditolak";
    } else if (widget.konten['status'] == '5') {
      status = "Verifikasi Akun ditolak oleh Irfandi Ahmad";
    } else if (widget.konten['status'] == '6') {
      status = "Verifikasi Akun ditolak oleh Oging Adria Fitra Sakti";
    }
    _getUserInfo();
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Berita'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Container(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(
                            'Judul Konten :  ',
                          ),
                          Text(widget.konten['judul_konten'],
                              style: TextStyle(fontWeight: FontWeight.w700)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text('Isi Konten :  '),
                          Text(widget.konten['isi_konten'],
                              style: TextStyle(fontWeight: FontWeight.w700)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text('Penulis :  '),
                          Text(widget.konten['penulis'],
                              style: TextStyle(fontWeight: FontWeight.w700)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text('Kabupaten :  '),
                          Text(widget.konten['kabupaten'],
                              style: TextStyle(fontWeight: FontWeight.w700)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text('Komunitas Motor :  '),
                          Text(widget.konten['komunitas_motor'],
                              style: TextStyle(fontWeight: FontWeight.w700)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text('Media :  '),
                          Text(widget.konten['media'],
                              style: TextStyle(fontWeight: FontWeight.w700)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text('Kategori Konten :  '),
                          Text(widget.konten['kategori_konten'],
                              style: TextStyle(fontWeight: FontWeight.w700)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text('Link Konten :  '),
                          Text(widget.konten['link_konten'],
                              style: TextStyle(fontWeight: FontWeight.w700)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text('Periode Mulai :  '),
                          Text(widget.konten['mulai_periode'],
                              style: TextStyle(fontWeight: FontWeight.w700)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text('Periode Akhir :  '),
                          Text(widget.konten['akhir_periode'],
                              style: TextStyle(fontWeight: FontWeight.w700)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text('Target Like :  '),
                          Text(widget.konten['like_target'],
                              style: TextStyle(fontWeight: FontWeight.w700)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text('Like yang didapatkan :  '),
                          Text(widget.konten['like_actual'],
                              style: TextStyle(fontWeight: FontWeight.w700)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text('Target share :  '),
                          Text(widget.konten['share_target'],
                              style: TextStyle(fontWeight: FontWeight.w700)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text('Share yang didapatkan :  '),
                          Text(widget.konten['share_actual'],
                              style: TextStyle(fontWeight: FontWeight.w700)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text('Target Komen :  '),
                          Text(widget.konten['comment_target'],
                              style: TextStyle(fontWeight: FontWeight.w700)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text('Komen yang didapatkan :  '),
                          Text(widget.konten['comment_actual'],
                              style: TextStyle(fontWeight: FontWeight.w700)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text('Status :  '),
                          Text(status,
                              style: TextStyle(fontWeight: FontWeight.w700)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Row(children: [
                            if (userData == 15) ...[
                              if (status == 'menunggu verifikasi') ...[
                                ElevatedButton(
                                    onPressed: _approve,
                                    child: const Text('Approve')),
                                const Padding(padding: EdgeInsets.all(10.0)),
                                ElevatedButton(
                                    onPressed: _notApprove,
                                    child: const Text('Jangan Approve')),
                              ],
                              if (status ==
                                  'diverifikasi oleh Oging Adria Fitra Sakti') ...[
                                ElevatedButton(
                                    onPressed: _approve,
                                    child: const Text('Approve')),
                                const Padding(padding: EdgeInsets.all(10.0)),
                                ElevatedButton(
                                    onPressed: _notApprove,
                                    child: const Text('Jangan Approve')),
                              ],
                              if (status ==
                                  'Verifikasi Akun ditolak oleh Oging Adria Fitra Sakti') ...[
                                ElevatedButton(
                                    onPressed: _approve,
                                    child: const Text('Approve')),
                                const Padding(padding: EdgeInsets.all(10.0)),
                                ElevatedButton(
                                    onPressed: _notApprove,
                                    child: const Text('Jangan Approve')),
                              ],
                            ],
                            if (userData == 16) ...[
                              if (status == 'menunggu verifikasi') ...[
                                ElevatedButton(
                                    onPressed: _approve,
                                    child: const Text('Approve')),
                                const Padding(padding: EdgeInsets.all(10.0)),
                                ElevatedButton(
                                    onPressed: _notApprove,
                                    child: const Text('Jangan Approve')),
                              ],
                              if (status ==
                                  'diverifikasi oleh Irfandi Ahmad') ...[
                                ElevatedButton(
                                    onPressed: _approve,
                                    child: const Text('Approve')),
                                const Padding(padding: EdgeInsets.all(10.0)),
                                ElevatedButton(
                                    onPressed: _notApprove,
                                    child: const Text('Jangan Approve')),
                              ],
                              if (status ==
                                  'Verifikasi Akun ditolak oleh Irfandi Ahmad') ...[
                                ElevatedButton(
                                    onPressed: _approve,
                                    child: const Text('Approve')),
                                const Padding(padding: EdgeInsets.all(10.0)),
                                ElevatedButton(
                                    onPressed: _notApprove,
                                    child: const Text('Jangan Approve')),
                              ],
                            ],
                            if (userData == 17) ...[
                              if (status == 'menunggu verifikasi') ...[
                                ElevatedButton(
                                    onPressed: _approve,
                                    child: const Text('Approve')),
                                const Padding(padding: EdgeInsets.all(10.0)),
                                ElevatedButton(
                                    onPressed: _notApprove,
                                    child: const Text('Jangan Approve')),
                              ],
                              if (status ==
                                  'diverifikasi oleh Irfandi Ahmad') ...[
                                ElevatedButton(
                                    onPressed: _approve,
                                    child: const Text('Approve')),
                                const Padding(padding: EdgeInsets.all(10.0)),
                                ElevatedButton(
                                    onPressed: _notApprove,
                                    child: const Text('Jangan Approve')),
                              ],
                              if (status ==
                                  'diverifikasi oleh Oging Adria Fitra Sakti') ...[
                                ElevatedButton(
                                    onPressed: _approve,
                                    child: const Text('Approve')),
                                const Padding(padding: EdgeInsets.all(10.0)),
                                ElevatedButton(
                                    onPressed: _notApprove,
                                    child: const Text('Jangan Approve')),
                              ],
                              if (status ==
                                  'Verifikasi Akun ditolak oleh Irfandi Ahmad') ...[
                                ElevatedButton(
                                    onPressed: _approve,
                                    child: const Text('Approve')),
                                const Padding(padding: EdgeInsets.all(10.0)),
                                ElevatedButton(
                                    onPressed: _notApprove,
                                    child: const Text('Jangan Approve')),
                              ],
                              if (status ==
                                  'Verifikasi Akun ditolak oleh Oging Adria Fitra Sakti') ...[
                                ElevatedButton(
                                    onPressed: _approve,
                                    child: const Text('Approve')),
                                const Padding(padding: EdgeInsets.all(10.0)),
                                ElevatedButton(
                                    onPressed: _notApprove,
                                    child: const Text('Jangan Approve')),
                              ],
                            ],
                          ])
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
