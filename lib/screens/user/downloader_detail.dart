import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:portalcommunity/contstant/contstant.dart';
import 'package:portalcommunity/network/api.dart';
import 'package:portalcommunity/screens/admin/downloader.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DownloaderDetailUser extends StatefulWidget {
  final Map downloader;
  const DownloaderDetailUser({Key? key, required this.downloader})
      : super(key: key);

  @override
  State<DownloaderDetailUser> createState() => _DownloaderDetailUserState();
}

class _DownloaderDetailUserState extends State<DownloaderDetailUser> {
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
        title: const Text(
          'Data Downloader',
          style: TextStyle(color: mRedColor, fontWeight: FontWeight.w600),
        ),
        backgroundColor: mBackgroundColor,
        elevation: 0,
      ),
      backgroundColor: mBackgroundColor,
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
                          if (widget.downloader['status'] == '0' ||
                              widget.downloader['status'] == '1' ||
                              widget.downloader['status'] == '2') ...[
                            const Text('Menunggu Verifikasi',
                                style: TextStyle(fontWeight: FontWeight.w700)),
                          ],
                          if (widget.downloader['status'] == '5' ||
                              widget.downloader['status'] == '6') ...[
                            const Text('Menunggu Verifikasi',
                                style: TextStyle(fontWeight: FontWeight.w700)),
                          ],
                          if (widget.downloader['status'] == '4') ...[
                            const Text('Pengajuan di tolak',
                                style: TextStyle(fontWeight: FontWeight.w700)),
                          ],
                          if (widget.downloader['status'] == '3') ...[
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
