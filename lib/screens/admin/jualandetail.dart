import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:portalcommunity/network/api.dart';
import 'package:portalcommunity/screens/admin/penjualan.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Jualandetail extends StatefulWidget {
  final Map jualan;
  const Jualandetail({Key? key, required this.jualan}) : super(key: key);

  @override
  State<Jualandetail> createState() => _JualandetailState();
}

class _JualandetailState extends State<Jualandetail> {
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
      'id': widget.jualan['id']
    };
    final res = await CallApi()
        .putData(data, 'admin/jualan/' + widget.jualan['id'].toString());
    var body = json.decode(res.body);
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const SalesAdmin()));

    print(body);
    return body;
  }

  void _notApprove() async {
    var data = {
      'proses': 'notApprove',
      'id_user': userData,
      'id': widget.jualan['id']
    };
    final res =
        await CallApi().putData(data, 'admin/jualan/${widget.jualan['id']}');
    var body = json.decode(res.body);
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const SalesAdmin()));

    print(body);
    return body;
  }

  @override
  Widget build(BuildContext context) {
    String status = "";
    if (widget.jualan['status'] == '3') {
      status = "Approve";
    } else if (widget.jualan['status'] == '0') {
      status = "menunggu verifikasi";
    } else if (widget.jualan['status'] == '1') {
      status = "diverifikasi oleh irfandi ahmad";
    } else if (widget.jualan['status'] == '3') {
      status = "diverifikasi oleh Oging Adria Fitra Sakti";
    } else if (widget.jualan['status'] == '4') {
      status = "Verifikasi ditolak";
    } else if (widget.jualan['status'] == '5') {
      status = "Verifikasi ditolak oleh Irfandi Ahmad";
    } else if (widget.jualan['status'] == '6') {
      status = "Verifikasi ditolak oleh Oging Adria Fitra Sakti";
    }
    _getUserInfo();
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Penjualan'),
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
                          Text(widget.jualan['kabupaten'],
                              style: TextStyle(fontWeight: FontWeight.w700)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text('Komunitas Motor :  '),
                          Text(widget.jualan['komunitas_motor'],
                              style: TextStyle(fontWeight: FontWeight.w700)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text('Nama Member :  '),
                          Text(widget.jualan['nama_member'],
                              style: TextStyle(fontWeight: FontWeight.w700)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text('Kategori Motor :  '),
                          Text(widget.jualan['kategori_motor'],
                              style: TextStyle(fontWeight: FontWeight.w700)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text('Tipe Motor :  '),
                          Text(widget.jualan['type_motor'],
                              style: TextStyle(fontWeight: FontWeight.w700)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text('Tempat Pengajuan :  '),
                          Text(widget.jualan['tmp_pengajuan'],
                              style: TextStyle(fontWeight: FontWeight.w700)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text('Nama Sales :  '),
                          Text(widget.jualan['nama_sales'],
                              style: TextStyle(fontWeight: FontWeight.w700)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text('Nama Konsumen :  '),
                          Text(widget.jualan['nama_konsumen'],
                              style: TextStyle(fontWeight: FontWeight.w700)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text('Pekerjaan Konsumen :  '),
                          Text(widget.jualan['pekerjaan'],
                              style: TextStyle(fontWeight: FontWeight.w700)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text('Fincoy :  '),
                          Text(widget.jualan['fincoy'],
                              style: TextStyle(fontWeight: FontWeight.w700)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text('DP :  '),
                          Text(widget.jualan['dp'],
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
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Row(children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          Row(children: [
                                            if (userData == 15) ...[
                                              if (status ==
                                                  'menunggu verifikasi') ...[
                                                ElevatedButton(
                                                    onPressed: _approve,
                                                    child:
                                                        const Text('Approve')),
                                                const Padding(
                                                    padding:
                                                        EdgeInsets.all(10.0)),
                                                ElevatedButton(
                                                    onPressed: _notApprove,
                                                    child: const Text(
                                                        'Jangan Approve')),
                                              ],
                                              if (status ==
                                                  'diverifikasi oleh Oging Adria Fitra Sakti') ...[
                                                ElevatedButton(
                                                    onPressed: _approve,
                                                    child:
                                                        const Text('Approve')),
                                                const Padding(
                                                    padding:
                                                        EdgeInsets.all(10.0)),
                                                ElevatedButton(
                                                    onPressed: _notApprove,
                                                    child: const Text(
                                                        'Jangan Approve')),
                                              ],
                                              if (status ==
                                                  'Verifikasi Akun ditolak oleh Oging Adria Fitra Sakti') ...[
                                                ElevatedButton(
                                                    onPressed: _approve,
                                                    child:
                                                        const Text('Approve')),
                                                const Padding(
                                                    padding:
                                                        EdgeInsets.all(10.0)),
                                                ElevatedButton(
                                                    onPressed: _notApprove,
                                                    child: const Text(
                                                        'Jangan Approve')),
                                              ],
                                            ],
                                            if (userData == 16) ...[
                                              if (status ==
                                                  'menunggu verifikasi') ...[
                                                ElevatedButton(
                                                    onPressed: _approve,
                                                    child:
                                                        const Text('Approve')),
                                                const Padding(
                                                    padding:
                                                        EdgeInsets.all(10.0)),
                                                ElevatedButton(
                                                    onPressed: _notApprove,
                                                    child: const Text(
                                                        'Jangan Approve')),
                                              ],
                                              if (status ==
                                                  'diverifikasi oleh Irfandi Ahmad') ...[
                                                ElevatedButton(
                                                    onPressed: _approve,
                                                    child:
                                                        const Text('Approve')),
                                                const Padding(
                                                    padding:
                                                        EdgeInsets.all(10.0)),
                                                ElevatedButton(
                                                    onPressed: _notApprove,
                                                    child: const Text(
                                                        'Jangan Approve')),
                                              ],
                                              if (status ==
                                                  'Verifikasi Akun ditolak oleh Irfandi Ahmad') ...[
                                                ElevatedButton(
                                                    onPressed: _approve,
                                                    child:
                                                        const Text('Approve')),
                                                const Padding(
                                                    padding:
                                                        EdgeInsets.all(10.0)),
                                                ElevatedButton(
                                                    onPressed: _notApprove,
                                                    child: const Text(
                                                        'Jangan Approve')),
                                              ],
                                            ],
                                            if (userData == 17) ...[
                                              if (status ==
                                                  'menunggu verifikasi') ...[
                                                ElevatedButton(
                                                    onPressed: _approve,
                                                    child:
                                                        const Text('Approve')),
                                                const Padding(
                                                    padding:
                                                        EdgeInsets.all(10.0)),
                                                ElevatedButton(
                                                    onPressed: _notApprove,
                                                    child: const Text(
                                                        'Jangan Approve')),
                                              ],
                                              if (status ==
                                                  'diverifikasi oleh Irfandi Ahmad') ...[
                                                ElevatedButton(
                                                    onPressed: _approve,
                                                    child:
                                                        const Text('Approve')),
                                                const Padding(
                                                    padding:
                                                        EdgeInsets.all(10.0)),
                                                ElevatedButton(
                                                    onPressed: _notApprove,
                                                    child: const Text(
                                                        'Jangan Approve')),
                                              ],
                                              if (status ==
                                                  'diverifikasi oleh Oging Adria Fitra Sakti') ...[
                                                ElevatedButton(
                                                    onPressed: _approve,
                                                    child:
                                                        const Text('Approve')),
                                                const Padding(
                                                    padding:
                                                        EdgeInsets.all(10.0)),
                                                ElevatedButton(
                                                    onPressed: _notApprove,
                                                    child: const Text(
                                                        'Jangan Approve')),
                                              ],
                                              if (status ==
                                                  'Verifikasi Akun ditolak oleh Irfandi Ahmad') ...[
                                                ElevatedButton(
                                                    onPressed: _approve,
                                                    child:
                                                        const Text('Approve')),
                                                const Padding(
                                                    padding:
                                                        EdgeInsets.all(10.0)),
                                                ElevatedButton(
                                                    onPressed: _notApprove,
                                                    child: const Text(
                                                        'Jangan Approve')),
                                              ],
                                              if (status ==
                                                  'Verifikasi Akun ditolak oleh Oging Adria Fitra Sakti') ...[
                                                ElevatedButton(
                                                    onPressed: _approve,
                                                    child:
                                                        const Text('Approve')),
                                                const Padding(
                                                    padding:
                                                        EdgeInsets.all(10.0)),
                                                ElevatedButton(
                                                    onPressed: _notApprove,
                                                    child: const Text(
                                                        'Jangan Approve')),
                                              ],
                                            ],
                                          ])
                                        ],
                                      ),
                                    ),
                                  ])
                                ],
                              ),
                            ),
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
