import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:portalcommunity/contstant/contstant.dart';
import 'package:portalcommunity/network/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class JualanDetailUser extends StatefulWidget {
  final Map jualan;

  const JualanDetailUser({Key? key, required this.jualan}) : super(key: key);

  @override
  State<JualanDetailUser> createState() => _JualanDetailUserState();
}

class _JualanDetailUserState extends State<JualanDetailUser> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detail Penjualan',
          style: TextStyle(color: mRedColor, fontWeight: FontWeight.w600),
        ),
        backgroundColor: mBackgroundColor,
        elevation: 0,
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
                          if (widget.jualan['status'] == '0' ||
                              widget.jualan['status'] == '1' ||
                              widget.jualan['status'] == '2') ...[
                            const Text('Menunggu Verifikasi',
                                style: TextStyle(fontWeight: FontWeight.w700)),
                          ],
                          if (widget.jualan['status'] == '5' ||
                              widget.jualan['status'] == '6') ...[
                            const Text('Menunggu Verifikasi',
                                style: TextStyle(fontWeight: FontWeight.w700)),
                          ],
                          if (widget.jualan['status'] == '4') ...[
                            const Text('Pengajuan di tolak',
                                style: TextStyle(fontWeight: FontWeight.w700)),
                          ],
                          if (widget.jualan['status'] == '3') ...[
                            const Text('Approve',
                                style: TextStyle(fontWeight: FontWeight.w700)),
                          ],
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
