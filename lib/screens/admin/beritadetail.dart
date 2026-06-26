import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:portalcommunity/network/api.dart';
import 'package:portalcommunity/screens/admin/berita.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Beritadetail extends StatefulWidget {
  final Map berita;
  const Beritadetail({Key? key, required this.berita}) : super(key: key);

  @override
  State<Beritadetail> createState() => _BeritadetailState();
}

class _BeritadetailState extends State<Beritadetail> {
  var userData;

  void _approve() async {
    var data = {
      'proses': 'approve',
      'id_user': userData,
      'id': widget.berita['id']
    };
    final res = await CallApi()
        .putData(data, 'admin/berita/' + widget.berita['id'].toString());
    var body = json.decode(res.body);
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const BeritaAdmin()));

    print(body);
    return body;
  }

  void _notApprove() async {
    var data = {
      'proses': 'notApprove',
      'id_user': userData,
      'id': widget.berita['id']
    };
    final res =
        await CallApi().putData(data, 'admin/berita/${widget.berita['id']}');
    var body = json.decode(res.body);
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const BeritaAdmin()));

    print(body);
    return body;
  }

  void _getUserInfo() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var userJson = localStorage.getString('user');
    Map<String, dynamic> user =
        Map<String, dynamic>.from(json.decode(userJson!));

    setState(() {
      userData = user["id"];
    });
  }

  @override
  Widget build(BuildContext context) {
    String status = "";

    if (widget.berita['status'] == '3') {
      status = "Approve";
    } else if (widget.berita['status'] == '0') {
      status = "menunggu verifikasi";
    } else if (widget.berita['status'] == '1') {
      status = "diverifikasi oleh irfandi ahmad";
    } else if (widget.berita['status'] == '3') {
      status = "diverifikasi oleh Oging Adria Fitra Sakti";
    } else if (widget.berita['status'] == '4') {
      status = "Verifikasi ditolak";
    } else if (widget.berita['status'] == '5') {
      status = "Verifikasi ditolak oleh Irfandi Ahmad";
    } else if (widget.berita['status'] == '6') {
      status = "Verifikasi ditolak oleh Oging Adria Fitra Sakti";
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
                            'Kabupaten :  ',
                          ),
                          Text(widget.berita['kabupaten'],
                              style: TextStyle(fontWeight: FontWeight.w700)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text('Komunitas Motor :  '),
                          Text(widget.berita['komunitas_motor'],
                              style: TextStyle(fontWeight: FontWeight.w700)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text('by :  '),
                          Text(widget.berita['by'],
                              style: TextStyle(fontWeight: FontWeight.w700)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text('Media :  '),
                          Text(widget.berita['media'],
                              style: TextStyle(fontWeight: FontWeight.w700)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text('Nama Berita :  '),
                          Text(widget.berita['nama_berita'],
                              style: TextStyle(fontWeight: FontWeight.w700)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text('Keterangan Berita :  '),
                          Text(widget.berita['keterangan_berita'],
                              style: TextStyle(fontWeight: FontWeight.w700)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text('Link Berita :  '),
                          Text(widget.berita['link_berita'],
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
