import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:portalcommunity/contstant/contstant.dart';
import 'package:portalcommunity/network/api.dart';
import 'package:portalcommunity/screens/admin/jualandetail.dart';

class SalesAdmin extends StatefulWidget {
  const SalesAdmin({Key? key}) : super(key: key);

  @override
  State<SalesAdmin> createState() => _SalesAdminState();
}

class _SalesAdminState extends State<SalesAdmin> {
  Future getMember() async {
    var res = await CallApi().getData('admin/jualan');
    Map<String, dynamic> member = json.decode(res.body);
    List<dynamic> data = member["data"];

    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Penjualan'),
        backgroundColor: Colors.blueGrey,
      ),
      body: FutureBuilder(
          future: getMember(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var myData = snapshot.data as List;
              String status;
              var approval;
              return ListView.builder(
                  itemCount: myData.length,
                  itemBuilder: (context, index) {
                    if (myData[index]['status'] == '3') {
                      status = "Approve";
                    } else if (myData[index]['status'] == '0') {
                      status = "menunggu verifikasi";
                    } else if (myData[index]['status'] == '1') {
                      status = "diverifikasi oleh irfandi ahmad";
                    } else if (myData[index]['status'] == '2') {
                      status = "diverifikasi oleh Oging Adria Fitra Sakti";
                    } else if (myData[index]['status'] == '4') {
                      status = "Verifikasi Akun ditolak";
                    } else if (myData[index]['status'] == '5') {
                      status = "Verifikasi Akun ditolak oleh Irfandi Ahmad";
                    } else if (myData[index]['status'] == '6') {
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
                                  builder: (context) => Jualandetail(
                                        jualan: myData[index],
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
                                    Text('Nama Member '),
                                    Text(
                                      ': ${myData[index]['nama_member']}',
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
                                    Text('Kategori Motor '),
                                    Text(
                                      ': ${myData[index]['kategori_motor']}',
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
                                    Text('Tipe Motor '),
                                    Text(
                                      ': ${myData[index]['type_motor']}',
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
                                    Text('Nama Konsumen '),
                                    Text(
                                      ': ${myData[index]['type_motor']}',
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
