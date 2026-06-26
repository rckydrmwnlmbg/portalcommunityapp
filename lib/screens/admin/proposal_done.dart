import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:portalcommunity/contstant/contstant.dart';
import 'package:portalcommunity/screens/admin/proposaldonedetail.dart';

import '../../network/api.dart';

class ProposalDoneAdmin extends StatefulWidget {
  const ProposalDoneAdmin({Key? key}) : super(key: key);

  @override
  State<ProposalDoneAdmin> createState() => _ProposalDoneAdminState();
}

class _ProposalDoneAdminState extends State<ProposalDoneAdmin> {
  Future getProposal() async {
    var res = await CallApi().getData('admin/proposaldone');
    Map<String, dynamic> member = json.decode(res.body);
    List<dynamic> data = member["data"];

    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data LPJ Proposal'),
        backgroundColor: Colors.blueGrey,
      ),
      body: FutureBuilder(
          future: getProposal(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var myData = snapshot.data as List;
              String status;
              var approval;
              return ListView.builder(
                  itemCount: myData.length,
                  itemBuilder: (context, index) {
                    if (myData[index]['status_done'] == '3') {
                      status = "Approve";
                    } else if (myData[index]['status_done'] == '0') {
                      status = "menunggu verifikasi";
                    } else if (myData[index]['status_done'] == '1') {
                      status = "diverifikasi oleh irfandi ahmad";
                    } else if (myData[index]['status_done'] == '2') {
                      status = "diverifikasi oleh Oging Adria Fitra Sakti";
                    } else if (myData[index]['status_done'] == '4') {
                      status = "Verifikasi Akun ditolak";
                    } else if (myData[index]['status_done'] == '5') {
                      status = "Verifikasi Akun ditolak oleh Irfandi Ahmad";
                    } else if (myData[index]['status_done'] == '6') {
                      status =
                          "Verifikasi Akun ditolak oleh Oging Adria Fitra Sakti";
                    } else {
                      status = "";
                    }

                    return Container(
                      height: 250,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Proposaldonedetail(
                                        proposal: myData[index],
                                      )));
                        },
                        child: Card(
                          elevation: 5,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Text('Kabupaten '),
                                    Text(': ${myData[index]['kabupaten']}',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w700,
                                        )),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Text('Komunitas Motor '),
                                    Text(
                                        ': ${myData[index]['komunitas_motor']}',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w700,
                                        )),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Text('Kategori event '),
                                    Text(
                                      ': ${myData[index]['kategori_event']}',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Text('Nama event '),
                                    Text(
                                      ': ${myData[index]['nama_event']}',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Text('Ket event '),
                                    Text(
                                      ': ${myData[index]['ket_event']}',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Text('Lokasi event '),
                                    Text(
                                      ': ${myData[index]['lokasi_event']}',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      status,
                                      style: const TextStyle(color: mRedColor),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  });
            } else if (snapshot.hasError) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    SizedBox(
                      child: CircularProgressIndicator(),
                      width: 60,
                      height: 60,
                    )
                  ],
                ),
              );
            } else {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    SizedBox(
                      child: CircularProgressIndicator(),
                      width: 60,
                      height: 60,
                    )
                  ],
                ),
              );
            }
          }),
    );
  }
}
