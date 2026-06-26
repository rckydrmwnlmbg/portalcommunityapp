import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:portalcommunity/network/api.dart';
import 'package:portalcommunity/screens/admin/proposal.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Proposaldonedetail extends StatefulWidget {
  final Map proposal;
  const Proposaldonedetail({Key? key, required this.proposal})
      : super(key: key);

  @override
  State<Proposaldonedetail> createState() => _ProposaldonedetailState();
}

class _ProposaldonedetailState extends State<Proposaldonedetail> {
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
      'id': widget.proposal['id']
    };
    final res = await CallApi().putData(
        data, 'admin/proposaldone/' + widget.proposal['id'].toString());
    var body = json.decode(res.body);
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => const ProposalAdmin()));

    print(body);
    return body;
  }

  void _notApprove() async {
    var data = {
      'proses': 'notApprove',
      'id_user': userData,
      'id': widget.proposal['id']
    };
    final res = await CallApi()
        .putData(data, 'admin/proposaldone/${widget.proposal['id']}');
    var body = json.decode(res.body);
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => const ProposalAdmin()));

    print(body);
    return body;
  }

  @override
  Widget build(BuildContext context) {
    String status = "";
    if (widget.proposal['status_done'] == '3') {
      status = "Approve";
    } else if (widget.proposal['status_done'] == '0') {
      status = "menunggu verifikasi";
    } else if (widget.proposal['status_done'] == '1') {
      status = "diverifikasi oleh irfandi ahmad";
    } else if (widget.proposal['status_done'] == '3') {
      status = "diverifikasi oleh Oging Adria Fitra Sakti";
    } else if (widget.proposal['status_done'] == '4') {
      status = "Verifikasi Akun ditolak";
    } else if (widget.proposal['status_done'] == '5') {
      status = "Verifikasi Akun ditolak oleh Irfandi Ahmad";
    } else if (widget.proposal['status_done'] == '6') {
      status = "Verifikasi Akun ditolak oleh Oging Adria Fitra Sakti";
    }
    return Scaffold(
      appBar: AppBar(title: Text('Detail LPJ Proposal')),
      body: ListView(
        children: [
          Padding(
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
                            Text(widget.proposal['kabupaten'],
                                style: TextStyle(fontWeight: FontWeight.w700)),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text('Komunitas Motor :  '),
                            Text(widget.proposal['komunitas_motor'],
                                style: TextStyle(fontWeight: FontWeight.w700)),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text('Kategori Event :  '),
                            Text(widget.proposal['kategori_event'],
                                style: TextStyle(fontWeight: FontWeight.w700)),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text('Nama Event :  '),
                            Text(widget.proposal['nama_event'],
                                style: TextStyle(fontWeight: FontWeight.w700)),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text('Keterangan Event :  '),
                            Text(widget.proposal['ket_event'],
                                style: TextStyle(fontWeight: FontWeight.w700)),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text('Lokasi Event :  '),
                            Text(widget.proposal['lokasi_event'],
                                style: TextStyle(fontWeight: FontWeight.w700)),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text('Rencana Mulai Event :  '),
                            Text(widget.proposal['rencana_mulai'],
                                style: TextStyle(fontWeight: FontWeight.w700)),
                            Text('s/d'),
                            Text(widget.proposal['rencana_akhir'],
                                style: TextStyle(fontWeight: FontWeight.w700)),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text('Target Peserta :  '),
                            Text(widget.proposal['target_peserta'],
                                style: TextStyle(fontWeight: FontWeight.w700)),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text('Peserta yang Sebenarnya:  '),
                            Text(widget.proposal['actual_peserta'],
                                style: TextStyle(fontWeight: FontWeight.w700)),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text('Konten Acara :  '),
                            Text(widget.proposal['konten_acara'],
                                style: TextStyle(fontWeight: FontWeight.w700)),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text('Undangan Peserta :  '),
                            Text(widget.proposal['undangan_peserta'],
                                style: TextStyle(fontWeight: FontWeight.w700)),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text('Undangan Peserta yang Sebenarnya :  '),
                            Text(widget.proposal['undangan_peserta_actual'],
                                style: TextStyle(fontWeight: FontWeight.w700)),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text('Nomor Undangan Peserta :  '),
                            Text(widget.proposal['nomor_undangan_peserta'],
                                style: TextStyle(fontWeight: FontWeight.w700)),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text('Nomor Undangan Peserta yang Sebenarnya :  '),
                            Text(
                                widget
                                    .proposal['nomor_undangan_peserta_actual'],
                                style: TextStyle(fontWeight: FontWeight.w700)),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text('Target Undangan Club Motor Lain :  '),
                            Text(widget.proposal['undang_club_lain_target'],
                                style: TextStyle(fontWeight: FontWeight.w700)),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text(
                                'Undangan Club Motor Lain yang Sebenarnya :  '),
                            Text(widget.proposal['undang_club_lain_actual'],
                                style: TextStyle(fontWeight: FontWeight.w700)),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text('Pengajuan Biaya BTL Sharing :  '),
                            Text(widget.proposal['pengajuan_biaya_btl_sharing'],
                                style: TextStyle(fontWeight: FontWeight.w700)),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text('Pengajuan Biaya BTL Sharing :  '),
                            Text(
                                widget.proposal['pengajuan_biaya_btl_sharingg'],
                                style: TextStyle(fontWeight: FontWeight.w700)),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text('Pengajuan Biaya BTL Sharing Club :  '),
                            Text(
                                widget.proposal[
                                    'pengajuan_biaya_btl_sharing_club'],
                                style: TextStyle(fontWeight: FontWeight.w700)),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text('Total Biaya :  '),
                            Text(widget.proposal['total_biaya'],
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
        ],
      ),
    );
  }
}
