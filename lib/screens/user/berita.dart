import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:portalcommunity/contstant/contstant.dart';
import 'package:portalcommunity/screens/user/berita_add.dart';
import 'package:portalcommunity/screens/user/berita_detail.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../network/api.dart';

class BeritaUser extends StatefulWidget {
  final String user;
  const BeritaUser({Key? key, required this.user}) : super(key: key);

  @override
  State<BeritaUser> createState() => _BeritaUserState();
}

class _BeritaUserState extends State<BeritaUser> {
  var userData;
  Future getBerita() async {
    var res = await CallApi().getData('user/berita/${widget.user}');
    Map<String, dynamic> member = json.decode(res.body);
    List<dynamic> data = member["data"];

    print(widget.user);
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: mRedColor,
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const BeritaAdd()));
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text(
          'Data Berita',
          style: TextStyle(color: mRedColor, fontWeight: FontWeight.w600),
        ),
        backgroundColor: mBackgroundColor,
        elevation: 0,
      ),
      body: FutureBuilder(
          future: getBerita(),
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
                                  builder: (context) => BeritadetailUser(
                                        berita: myData[index],
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
                                    Text('by '),
                                    Text(
                                      ': ${myData[index]['by']}',
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
                                    Text('Nama Berita '),
                                    Text(
                                      ': ${myData[index]['nama_berita']}',
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
                      child: CircularProgressIndicator(
                        color: mRedColor,
                      ),
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
