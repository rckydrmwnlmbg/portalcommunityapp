import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:portalcommunity/network/api.dart';
import 'package:portalcommunity/screens/admin/downloader.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Downloaderdetail extends StatefulWidget {
  final Map downloader;
  const Downloaderdetail({Key? key, required this.downloader})
      : super(key: key);

  @override
  State<Downloaderdetail> createState() => _DownloaderdetailState();
}

class _DownloaderdetailState extends State<Downloaderdetail> {
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
      'id': widget.downloader['id']
    };
    final res = await CallApi().putData(
        data, 'admin/downloader/' + widget.downloader['id'].toString());
    var body = json.decode(res.body);
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => const DownloaderAdmin()));

    print(body);
    return body;
  }

  void _notApprove() async {
    var data = {
      'proses': 'notApprove',
      'id_user': userData,
      'id': widget.downloader['id']
    };
    final res = await CallApi()
        .putData(data, 'admin/downloader/${widget.downloader['id']}');
    var body = json.decode(res.body);
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => const DownloaderAdmin()));

    print(body);
    return body;
  }

  @override
  Widget build(BuildContext context) {
    String status = "";
    if (widget.downloader['status'] == '3') {
      status = "Approve";
    } else if (widget.downloader['status'] == '0') {
      status = "menunggu verifikasi";
    } else if (widget.downloader['status'] == '1') {
      status = "diverifikasi oleh irfandi ahmad";
    } else if (widget.downloader['status'] == '3') {
      status = "diverifikasi oleh Oging Adria Fitra Sakti";
    } else if (widget.downloader['status'] == '4') {
      status = "Verifikasi Akun ditolak";
    } else if (widget.downloader['status'] == '5') {
      status = "Verifikasi Akun ditolak oleh Irfandi Ahmad";
    } else if (widget.downloader['status'] == '6') {
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
                            'Kabupaten :  ',
                          ),
                          Text(widget.downloader['kabupaten'],
                              style: TextStyle(fontWeight: FontWeight.w700)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text('Komunitas Motor :  '),
                          Text(widget.downloader['komunitas_motor'],
                              style: TextStyle(fontWeight: FontWeight.w700)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text('Nama Member :  '),
                          Text(widget.downloader['nama_member'],
                              style: TextStyle(fontWeight: FontWeight.w700)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text('Kode Referal :  '),
                          Text(widget.downloader['kode_referal'],
                              style: TextStyle(fontWeight: FontWeight.w700)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text('Nama Konsumen :  '),
                          Text(widget.downloader['nama_konsumen'],
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
