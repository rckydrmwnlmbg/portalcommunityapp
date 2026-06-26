import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:portalcommunity/screens/admin/addkomunitas.dart';

import '../../network/api.dart';

class KomunitasList extends StatefulWidget {
  const KomunitasList({Key? key}) : super(key: key);

  @override
  State<KomunitasList> createState() => _KomunitasListState();
}

class _KomunitasListState extends State<KomunitasList> {
  Future getBerita() async {
    var res = await CallApi().getData('admin/komunitas');
    Map<String, dynamic> member = json.decode(res.body);
    List<dynamic> data = member["data"];

    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddKomunitas()));
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text('Data Komunitas'),
        backgroundColor: Colors.blueGrey,
      ),
      body: FutureBuilder(
          future: getBerita(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var myData = snapshot.data as List;

              return ListView.builder(
                  itemCount: myData.length,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 60,
                      child: Card(
                        elevation: 5,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Row(
                                children: [
                                  Text('Nama Komunitas '),
                                  Text(': ${myData[index]['komunitas_motor']}',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w700,
                                      )),
                                ],
                              ),
                            ),
                          ],
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
