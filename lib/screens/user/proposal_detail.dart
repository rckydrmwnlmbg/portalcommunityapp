import 'package:flutter/material.dart';
import 'package:portalcommunity/contstant/contstant.dart';

class ProposalDetailUser extends StatefulWidget {
  final Map proposal;
  const ProposalDetailUser({Key? key, required this.proposal})
      : super(key: key);

  @override
  State<ProposalDetailUser> createState() => _ProposalDetailUserState();
}

class _ProposalDetailUserState extends State<ProposalDetailUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detail Proposal',
          style: TextStyle(color: mRedColor, fontWeight: FontWeight.w600),
        ),
        backgroundColor: mBackgroundColor,
        elevation: 0,
      ),
      body: ListView(
        children: [
          Center(
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
                              Text(widget.proposal['kabupaten'],
                                  style:
                                      TextStyle(fontWeight: FontWeight.w700)),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text('Komunitas Motor :  '),
                              Text(widget.proposal['komunitas_motor'],
                                  style:
                                      TextStyle(fontWeight: FontWeight.w700)),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text('Kategori Event :  '),
                              Text(widget.proposal['kategori_event'],
                                  style:
                                      TextStyle(fontWeight: FontWeight.w700)),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text('Nama Event :  '),
                              Text(widget.proposal['nama_event'],
                                  style:
                                      TextStyle(fontWeight: FontWeight.w700)),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text('Keterangan Event :  '),
                              Text(widget.proposal['ket_event'],
                                  style:
                                      TextStyle(fontWeight: FontWeight.w700)),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text('Lokasi Event :  '),
                              Text(widget.proposal['lokasi_event'],
                                  style:
                                      TextStyle(fontWeight: FontWeight.w700)),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text('Rencana Mulai Event :  '),
                              Text(widget.proposal['rencana_mulai'],
                                  style:
                                      TextStyle(fontWeight: FontWeight.w700)),
                              Text('s/d'),
                              Text(widget.proposal['rencana_akhir'],
                                  style:
                                      TextStyle(fontWeight: FontWeight.w700)),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text('Target Peserta :  '),
                              Text(widget.proposal['target_peserta'],
                                  style:
                                      TextStyle(fontWeight: FontWeight.w700)),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text('Konten Acara :  '),
                              Text(widget.proposal['konten_acara'],
                                  style:
                                      TextStyle(fontWeight: FontWeight.w700)),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text('Undangan Peserta :  '),
                              Text(widget.proposal['undangan_peserta'],
                                  style:
                                      TextStyle(fontWeight: FontWeight.w700)),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text('Nomor Undangan Peserta :  '),
                              Text(widget.proposal['nomor_undangan_peserta'],
                                  style:
                                      TextStyle(fontWeight: FontWeight.w700)),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text('Target Undangan Club Motor Lain :  '),
                              Text(widget.proposal['undang_club_lain_target'],
                                  style:
                                      TextStyle(fontWeight: FontWeight.w700)),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text('Pengajuan Biaya BTL Sharing :  '),
                              Text(
                                  widget
                                      .proposal['pengajuan_biaya_btl_sharing'],
                                  style:
                                      TextStyle(fontWeight: FontWeight.w700)),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text('Pengajuan Biaya BTL Sharing :  '),
                              Text(
                                  widget
                                      .proposal['pengajuan_biaya_btl_sharingg'],
                                  style:
                                      TextStyle(fontWeight: FontWeight.w700)),
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
                                  style:
                                      TextStyle(fontWeight: FontWeight.w700)),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text('Total Biaya :  '),
                              Text(widget.proposal['total_biaya'],
                                  style:
                                      TextStyle(fontWeight: FontWeight.w700)),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text('Status :  '),
                              if (widget.proposal['status'] == '0' ||
                                  widget.proposal['status'] == '1' ||
                                  widget.proposal['status'] == '2') ...[
                                const Text('Menunggu Verifikasi',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w700)),
                              ],
                              if (widget.proposal['status'] == '5' ||
                                  widget.proposal['status'] == '6') ...[
                                const Text('Menunggu Verifikasi',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w700)),
                              ],
                              if (widget.proposal['status'] == '4') ...[
                                const Text('Pengajuan di tolak',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w700)),
                              ],
                              if (widget.proposal['status'] == '3') ...[
                                const Text('Approve',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w700)),
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
        ],
      ),
      backgroundColor: mBackgroundColor,
    );
  }
}
