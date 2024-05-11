import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:absensi_mahardika/app/data/mk_perizinan_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import "package:http/http.dart" as http;

import '../../../utils/bottomsheet.dart';
import '../../../utils/color.dart';
import '../../../utils/network.dart';

class PerizinanController extends GetxController {
  Map<String, dynamic> mkList = {};

  Future<MkPerizinanModel?> getMk(String npm) async {
    try {
      var url =
          Uri.https('api-mobile.lkp-ppik.id', '/api/perizinan/showmk/$npm');
      print(url);

      http.Response response = await http.get(url, headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      }).timeout(const Duration(minutes: 2));

      // print(response.body);
      print(response.statusCode);

      if (response.statusCode == 200) {
        return MkPerizinanModel.fromJson(json.decode(response.body));
      }
    } on TimeoutException catch (_) {
      bottomsheet(
        title: 'Yah Gagal!',
        subtitle: 'Perikas kembali koneksi anda',
        image: 'assets/images/sad-illustration.png',
        onTap: () {
          Get.back();
        },
      );
    } on SocketException catch (_) {
      bottomsheet(
        title: 'Yah Gagal!',
        subtitle: 'Kesalahan tidak diketahui',
        image: 'assets/images/sad-illustration.png',
        onTap: () {
          Get.back();
        },
      );
    }
    return null;
  }

  List imageAndColor = [
    {
      'colorLine': Colors.lime,
      'colorShadow': Colors.lime[100]!.withOpacity(0.8),
      'image': "assets/icons/education3.png",
    },
    {
      'colorLine': Colors.teal,
      'colorShadow': Colors.teal[100]!.withOpacity(0.5),
      'image': "assets/icons/education6.png",
    },
    {
      'colorLine': Colors.purpleAccent,
      'colorShadow': Colors.purple[100]!.withOpacity(0.5),
      'image': "assets/icons/education7.png",
    },
    {
      'colorLine': Colors.deepOrange,
      'colorShadow': Colors.deepOrange[100]!.withOpacity(0.5),
      'image': "assets/icons/education8.png",
    },
    {
      'colorLine': Colors.brown,
      'colorShadow': Colors.brown[100],
      'image': "assets/icons/education9.png",
    },
    {
      'colorLine': Colors.blueGrey,
      'colorShadow': Colors.blueGrey.shade200,
      'image': "assets/icons/education10.png",
    },
    {
      'colorLine': const Color(0xffFB9AB7),
      'colorShadow': const Color(0xffffce4ed),
      'image': "assets/icons/education1.png",
    },
    {
      'colorLine': const Color(0xffFCB263),
      'colorShadow': const Color(0xffFEF1D8),
      'image': "assets/icons/education4.png",
    },
    {
      'colorLine': const Color(0xff30CF80),
      'colorShadow': const Color.fromARGB(210, 194, 245, 220),
      'image': "assets/icons/education2.png",
    },
    {
      'colorLine': AppColor.bluePrimary,
      'colorShadow': const Color(0xffD1F2FB),
      'image': "assets/icons/education5.png",
    },
  ];

  void updateDataInList() {
    imageAndColor.shuffle();
  }

  @override
  void onInit() {
    // TODO: implement onInit

    updateDataInList();
    getMk(dataUser.value.account?.npm ?? dataUserLocal['account']['npm']);
    super.onInit();
  }
}
