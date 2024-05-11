// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:absensi_mahardika/app/modules/detail_pertemuan/views/detail_pertemuan_view.dart';
import 'package:absensi_mahardika/app/modules/pertemuan/controllers/pertemuan_controller.dart';

class CardPertemuan extends StatefulWidget {
  final Color color;
  final int meet;
  final DateTime tanggal;
  final String jam_mulai;
  final String jam_selesai;
  final String jadwal_id;
  final String presensi_id;
  final String nama_mk;
  final Function onTap;
  const CardPertemuan({
    Key? key,
    required this.color,
    required this.meet,
    required this.tanggal,
    required this.jam_mulai,
    required this.jam_selesai,
    required this.jadwal_id,
    required this.presensi_id,
    required this.nama_mk,
    required this.onTap,
  }) : super(key: key);

  @override
  State<CardPertemuan> createState() => _CardPertemuanState();
}

class _CardPertemuanState extends State<CardPertemuan> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PertemuanController());

    String img = "";

    switch (widget.meet) {
      case 1:
        img = "assets/icons/Calendar01.png";
        break;
      case 2:
        img = "assets/icons/Calendar02.png";
        break;
      case 3:
        img = "assets/icons/Calendar03.png";
        break;
      case 4:
        img = "assets/icons/Calendar04.png";
        break;
      case 5:
        img = "assets/icons/Calendar05.png";
        break;
      case 6:
        img = "assets/icons/Calendar06.png";
        break;
      case 7:
        img = "assets/icons/Calendar07.png";
        break;
      case 8:
        img = "assets/icons/Calendar08.png";
        break;
      case 9:
        img = "assets/icons/Calendar09.png";
        break;
      case 10:
        img = "assets/icons/Calendar10.png";
        break;
      case 11:
        img = "assets/icons/Calendar11.png";
        break;
      case 12:
        img = "assets/icons/Calendar12.png";
        break;
    }

    return Card(
      elevation: 0.5,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(10),
        leading: Image.asset(
          img,
          width: 40,
          height: 40,
        ),
        title: Text(
          DateFormat('EEEE, d MMM, yyyy', 'id').format(widget.tanggal),
          style: const TextStyle(
            fontSize: 17.0,
            fontFamily: 'SignikaSemi',
          ),
        ),
        subtitle: Text(
          "${widget.jam_mulai} - ${widget.jam_selesai}",
          style: const TextStyle(
            fontSize: 14.0,
            fontFamily: 'SignikaRegular',
          ),
        ),
        trailing: Container(
          width: Get.width / 3.7,
          decoration: const BoxDecoration(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  Get.to(() => const DetailPertemuanView(),
                      transition: Transition.rightToLeft,
                      arguments: [
                        widget.meet,
                        widget.jadwal_id,
                        widget.nama_mk,
                        widget.presensi_id
                      ]);
                },
                splashRadius: 20,
                icon: const Icon(
                  CupertinoIcons.pencil_ellipsis_rectangle,
                ),
              ),
              IconButton(
                onPressed: () => widget.onTap(),
                splashRadius: 20,
                padding: EdgeInsets.zero,
                icon: const Icon(
                  CupertinoIcons.trash,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
