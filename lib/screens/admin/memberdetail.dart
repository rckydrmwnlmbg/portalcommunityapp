import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:portalcommunity/screens/admin/member.dart';
import '../../network/api.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Memberdetail extends StatefulWidget {
  final Map member;
  const Memberdetail({Key? key, required this.member}) : super(key: key);

  @override
  State<Memberdetail> createState() => _MemberdetailState();
}

class _MemberdetailState extends State<Memberdetail> {
  var userData;
  String status = "";

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
      'id': widget.member['id']
    };
    final res = await CallApi()
        .putData(data, 'admin/member/' + widget.member['id'].toString());
    var body = json.decode(res.body);
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const MemberPage()));

    print(res.body);
    return body;
  }

  void _notApprove() async {
    var data = {
      'proses': 'notApprove',
      'id_user': userData,
      'id': widget.member['id']
    };
    final res =
        await CallApi().putData(data, 'admin/member/${widget.member['id']}');
    var body = json.decode(res.body);
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const MemberPage()));

    print(body);
    return body;
  }

  @override
  Widget build(BuildContext context) {
    if (widget.member['status'] == '3') {
      status = "Approve";
    } else if (widget.member['status'] == '0') {
      status = "menunggu verifikasi";
    } else if (widget.member['status'] == '1') {
      status = "diverifikasi oleh irfandi ahmad";
    } else if (widget.member['status'] == '2') {
      status = "diverifikasi oleh Oging Adria Fitra Sakti";
    } else if (widget.member['status'] == '4') {
      status = "Verifikasi Akun ditolak";
    } else if (widget.member['status'] == '5') {
      status = "Verifikasi Akun ditolak oleh Irfandi Ahmad";
    } else if (widget.member['status'] == '6') {
      status = "Verifikasi Akun ditolak oleh Oging Adria Fitra Sakti";
    }
    _getUserInfo();

    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Member'),
        backgroundColor: Colors.blueGrey,
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
                          const Text(
                            'Nama Lengkap :  ',
                          ),
                          Text(widget.member['nama'],
                              style: TextStyle(fontWeight: FontWeight.w700)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text('Email :  '),
                          Text(widget.member['email'],
                              style: TextStyle(fontWeight: FontWeight.w700)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text('Komunitas Motor :  '),
                          Text(widget.member['komunitas_motor'],
                              style: TextStyle(fontWeight: FontWeight.w700)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text('Kabupaten :  '),
                          Text(widget.member['kabupaten'],
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
