import 'package:flutter/material.dart';
import 'package:portalcommunity/contstant/contstant.dart';

class BeritadetailUser extends StatefulWidget {
  final Map berita;
  const BeritadetailUser({Key? key, required this.berita}) : super(key: key);

  @override
  State<BeritadetailUser> createState() => _BeritadetailUserState();
}

class _BeritadetailUserState extends State<BeritadetailUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detail Berita',
          style: TextStyle(color: mRedColor, fontWeight: FontWeight.w600),
        ),
        backgroundColor: mBackgroundColor,
        elevation: 0,
      ),
      backgroundColor: mBackgroundColor,
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
                          Text(
                            'Kabupaten :  ',
                          ),
                          Text(widget.berita['kabupaten'],
                              style: TextStyle(fontWeight: FontWeight.w700)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text('Komunitas Motor :  '),
                          Text(widget.berita['komunitas_motor'],
                              style: TextStyle(fontWeight: FontWeight.w700)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text('by :  '),
                          Text(widget.berita['by'],
                              style: TextStyle(fontWeight: FontWeight.w700)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text('Media :  '),
                          Text(widget.berita['media'],
                              style: TextStyle(fontWeight: FontWeight.w700)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text('Nama Berita :  '),
                          Text(widget.berita['nama_berita'],
                              style: TextStyle(fontWeight: FontWeight.w700)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text('Keterangan Berita :  '),
                          Text(widget.berita['keterangan_berita'],
                              style: TextStyle(fontWeight: FontWeight.w700)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text('Link Berita :  '),
                          Text(widget.berita['link_berita'],
                              style: TextStyle(fontWeight: FontWeight.w700)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text('Status :  '),
                          if (widget.berita['status'] == '0' ||
                              widget.berita['status'] == '1' ||
                              widget.berita['status'] == '2') ...[
                            const Text('Menunggu Verifikasi',
                                style: TextStyle(fontWeight: FontWeight.w700)),
                          ],
                          if (widget.berita['status'] == '5' ||
                              widget.berita['status'] == '6') ...[
                            const Text('Menunggu Verifikasi',
                                style: TextStyle(fontWeight: FontWeight.w700)),
                          ],
                          if (widget.berita['status'] == '4') ...[
                            const Text('Pengajuan di tolak',
                                style: TextStyle(fontWeight: FontWeight.w700)),
                          ],
                          if (widget.berita['status'] == '3') ...[
                            const Text('Approve',
                                style: TextStyle(fontWeight: FontWeight.w700)),
                          ],
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
