import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:portalcommunity/contstant/contstant.dart';
import 'package:portalcommunity/screens/admin/komunitas.dart';
import 'package:portalcommunity/screens/admin/member.dart';
import 'package:portalcommunity/screens/admin/proposal.dart';
import 'package:portalcommunity/screens/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../network/api.dart';
import 'admin/berita.dart';
import 'admin/downloader.dart';
import 'admin/konten_kreatif.dart';
import 'admin/penjualan.dart';
import 'admin/proposal_done.dart';

class Admin extends StatefulWidget {
  const Admin({Key? key}) : super(key: key);

  @override
  State<Admin> createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  var userData;
  void initState() {
    _getUserInfo();
    super.initState();
  }

  void _getUserInfo() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var userJson = localStorage.getString('user');
    var user = json.decode(userJson!);
    setState(() {
      userData = user;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                child: Text(""),
                decoration: BoxDecoration(color: Colors.blueGrey),
              ),
              ListTile(
                title: const Text('Home'),
                onTap: () {},
              ),
              ListTile(
                title: const Text('Member'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MemberPage()));
                },
              ),
              ListTile(
                title: const Text('Proposal'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ProposalAdmin()));
                },
              ),
              ListTile(
                title: const Text('LPJ Proposal'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ProposalDoneAdmin()));
                },
              ),
              ListTile(
                title: const Text('Downloader'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DownloaderAdmin()));
                },
              ),
              ListTile(
                title: const Text('Konten Kreatif Digital'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const KontenAdmin()));
                },
              ),
              ListTile(
                title: const Text('Data jualan'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SalesAdmin()));
                },
              ),
              ListTile(
                title: const Text('Berita'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const BeritaAdmin()));
                },
              ),
              ListTile(
                  title: const Text('Komunitas Motor'),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const KomunitasList()));
                  }),
            ],
          ),
        ),
        appBar: AppBar(
          title: const Text('Admin Panel'),
          backgroundColor: Colors.blueGrey,
          actions: [
            IconButton(onPressed: logout, icon: const Icon(Icons.logout))
          ],
        ),
        body: Center(
          child: Text(
              userData != null ? 'Selamat Datang ${userData['nama']}' : ''),
        ));
  }

  void logout() async {
    // logout from the server ...

    SharedPreferences localStorage = await SharedPreferences.getInstance();
    localStorage.remove('user');
    localStorage.remove('token');
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const LoginScreen()));
  }
}
