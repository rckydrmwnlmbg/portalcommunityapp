import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:portalcommunity/contstant/contstant.dart';
import 'package:portalcommunity/contstant/style_constant.dart';
import 'package:portalcommunity/models/carousel_model.dart';
import 'package:portalcommunity/screens/user/Konten_add.dart';
import 'package:portalcommunity/screens/user/berita.dart';
import 'package:portalcommunity/screens/user/berita_add.dart';
import 'package:portalcommunity/screens/user/downloader.dart';
import 'package:portalcommunity/screens/user/downloader_add.dart';
import 'package:portalcommunity/screens/user/konten.dart';
import 'package:portalcommunity/screens/user/penjualan.dart';
import 'package:portalcommunity/screens/user/penjualan_add.dart';
import 'package:portalcommunity/screens/user/proposal.dart';
import 'package:portalcommunity/screens/user/proposal_add.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'admin.dart';
import 'login.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var userData;

  void logout() async {
    // logout from the server ...

    SharedPreferences localStorage = await SharedPreferences.getInstance();
    localStorage.remove('user');
    localStorage.remove('token');
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const LoginScreen()));
  }

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
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: mBackgroundColor,
        title: SvgPicture.asset('assets/svg/portalcommunity.svg'),
        elevation: 0,
        actions: [
          IconButton(
              onPressed: logout,
              icon: const Icon(
                Icons.logout,
                color: mRedColor,
                size: 20,
              ))
        ],
      ),
      backgroundColor: mBackgroundColor,
      body: ListView(
        physics: const ClampingScrollPhysics(),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Text(
              userData != null ? 'Selamat Datang ${userData['nama']}' : '',
              style: mTitleStyle,
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.only(left: 16, right: 16, top: 16),
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 195,
                    child: Swiper(
                      autoplay: true,
                      itemCount: image.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image(
                            image: AssetImage(image[index]),
                            fit: BoxFit.cover,
                          ),
                        );
                      },
                      viewportFraction: 0.8,
                      scale: 0.9,
                    )),
                const SizedBox(
                  child: Padding(padding: EdgeInsets.all(12)),
                ),
                const Text(
                  'Pengajuan',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                ),
                const SizedBox(
                  child: Padding(
                    padding: EdgeInsets.all(8),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 5),
            child: Padding(
              padding: const EdgeInsets.only(left: 1),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProposalUser(
                                  user: userData['id'].toString())));
                    },
                    child: Column(
                      children: [
                        Icon(
                          Icons.file_present,
                          color: Colors.pinkAccent[400],
                          size: 35,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Proposal',
                          style: TextStyle(color: Colors.black45),
                        )
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DownloaderUser(
                                    user: userData['id'].toString(),
                                  )));
                    },
                    child: Column(
                      children: [
                        Icon(
                          Icons.download_for_offline,
                          color: Colors.pinkAccent[400],
                          size: 35,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Downloader',
                          style: TextStyle(color: Colors.black45),
                        )
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => KontenUser(
                                    user: userData['id'].toString(),
                                  )));
                    },
                    child: Column(
                      children: [
                        Icon(
                          Icons.filter_center_focus,
                          color: Colors.pinkAccent[400],
                          size: 35,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Konten Kreatif',
                          style: TextStyle(color: Colors.black45),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 5, top: 25),
            child: Padding(
              padding: const EdgeInsets.only(left: 1),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PenjualanUser(
                                    user: userData['id'].toString(),
                                  )));
                    },
                    child: Column(
                      children: [
                        Icon(
                          Icons.shopping_basket,
                          color: Colors.pinkAccent[400],
                          size: 35,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Penjualan',
                          style: TextStyle(color: Colors.black45),
                        )
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BeritaUser(
                                    user: userData['id'].toString(),
                                  )));
                    },
                    child: Column(
                      children: [
                        Icon(
                          Icons.add,
                          color: Colors.pinkAccent[400],
                          size: 35,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Berita',
                          style: TextStyle(color: Colors.black45),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 16, right: 16, top: 40, bottom: 10),
            child: Text(
              'Artikel Terkini',
              style: mTitleStyle,
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.only(left: 16, right: 16, top: 16),
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 195,
                    child: Swiper(
                      autoplay: true,
                      itemCount: image.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image(
                            image: AssetImage(image[index]),
                            fit: BoxFit.cover,
                          ),
                        );
                      },
                      viewportFraction: 0.8,
                      scale: 0.9,
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
