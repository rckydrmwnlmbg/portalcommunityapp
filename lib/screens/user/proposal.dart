import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:portalcommunity/contstant/contstant.dart';
import 'package:portalcommunity/screens/user/proposal_add.dart';
import 'package:portalcommunity/screens/user/proposal_detail.dart';

import '../../network/api.dart';

class ProposalUser extends StatefulWidget {
  final String user;
  const ProposalUser({Key? key, required this.user}) : super(key: key);

  @override
  State<ProposalUser> createState() => _ProposalUserState();
}

class _ProposalUserState extends State<ProposalUser> {
  var userData;
  Future getProposal() async {
    var res = await CallApi().getData('user/proposal/${widget.user}');
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
              MaterialPageRoute(builder: (context) => const ProposalAdd()));
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text(
          'Data Proposal',
          style: TextStyle(color: mRedColor, fontWeight: FontWeight.w600),
        ),
        backgroundColor: mBackgroundColor,
        elevation: 0,
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
                      height: 250,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProposalDetailUser(
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
