import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:portalcommunity/contstant/contstant.dart';
import 'package:portalcommunity/network/api.dart';
import 'package:portalcommunity/screens/user/konten_detail.dart';
import 'package:shared_preferences/shared_preferences.dart';

class KontenUser extends StatefulWidget {
  final String user;
  const KontenUser({Key? key, required this.user}) : super(key: key);

  @override
  State<KontenUser> createState() => _KontenUserState();
}

class _KontenUserState extends State<KontenUser> {
  var userData;
  Future getKonten() async {
    var res = await CallApi().getData('user/konten/${widget.user}');
    Map<String, dynamic> member = json.decode(res.body);
    List<dynamic> data = member["data"];

    print(widget.user);
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Data Konten Kreatif',
          style: TextStyle(color: mRedColor, fontWeight: FontWeight.w600),
        ),
        backgroundColor: mBackgroundColor,
        elevation: 0,
      ),
      body: FutureBuilder(
          future: getKonten(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var myData = snapshot.data as List;
              String status;
              return ListView.builder(
                  itemCount: myData.length,
                  itemBuilder: (context, index) {
                    if (myData[index]['status'] == '3') {
                      status = "Approve";
                    } else if (myData[index]['status'] == '0') {
                      status = "menunggu verifikasi";
                    } else if (myData[index]['status'] == '1') {
                      status = "menunggu verifikasi";
                    } else if (myData[index]['status'] == '2') {
                      status = "menunggu verifikasi";
                    } else if (myData[index]['status'] == '4') {
                      status = "pengajuan ditolak";
                    } else if (myData[index]['status'] == '5') {
                      status = "menunggu verifikasi";
                    } else if (myData[index]['status'] == '6') {
                      status = "menunggu verifikasi";
                    } else {
                      status = "";
                    }
                    return Container(
                      height: 210,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => KontenDetailUser(
                                        konten: myData[index],
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
                                    Text('Judul Konten '),
                                    Text(': ${myData[index]['judul_konten']}',
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
                                    Text('Isi Konten '),
                                    Text(': ${myData[index]['isi_konten']}',
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
                                    Text('Penulis '),
                                    Text(
                                      ': ${myData[index]['penulis']}',
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
                                    Text('Kabupten '),
                                    Text(
                                      ': ${myData[index]['kabupaten']}',
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
                                    Text('Komunitas Motor '),
                                    Text(
                                      ': ${myData[index]['komunitas_motor']}',
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
                                    Text('Media '),
                                    Text(
                                      ': ${myData[index]['media']}',
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
                                    Text('Kategori Konten '),
                                    Text(
                                      ': ${myData[index]['kategori_konten']}',
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
                                    Text('Link Konten '),
                                    Text(
                                      ': ${myData[index]['link_konten']}',
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
                                    Text('Periode mulai '),
                                    Text(
                                      ': ${myData[index]['mulai_periode']}',
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
                                    Text('Periode akhir '),
                                    Text(
                                      ': ${myData[index]['akhir_periode']}',
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
                                    Text('Target Like '),
                                    Text(
                                      ': ${myData[index]['like_target']}',
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
                                    Text('Like yang didapatkan '),
                                    Text(
                                      ': ${myData[index]['like_actual']}',
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
                                    Text('Share Target '),
                                    Text(
                                      ': ${myData[index]['share_target']}',
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
                                    Text('Share yang didapatkan '),
                                    Text(
                                      ': ${myData[index]['share_actual']}',
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
                                    Text('Komen Target '),
                                    Text(
                                      ': ${myData[index]['comment_target']}',
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
                                    Text('Komen yang didapatkan '),
                                    Text(
                                      ': ${myData[index]['comment_actual']}',
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
