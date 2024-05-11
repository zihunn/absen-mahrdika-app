import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:absensi_mahardika/app/utils/network.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import "package:http/http.dart" as http;
import '../../../utils/bottomsheet.dart';
import '../../../utils/color.dart';

class TambahDosenController extends GetxController {
  List listMK = [].obs;
  RxBool isLoading = true.obs;

  List imageAndColor = [
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

  Future<List> getMK(String dosenId) async {
    try {
      var url = Uri.http(baseUrl, '/api/dosen/show/$dosenId');

      await Future.delayed(const Duration(seconds: 1));
      http.Response response = await http.get(url, headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      }).timeout(const Duration(minutes: 2));

      print(response.statusCode);

      if (response.statusCode == 200) {
        var result = json.decode(response.body);

        listMK = result['data'];
        isLoading.value = false;
        print(listMK);

      }

      if (response.statusCode == 404) {
        isLoading.value = false;
        bottomsheet(
          title: 'Yah Gagal!',
          subtitle: 'Mata kuliah tidak ditemukan',
          image: 'assets/images/sad-illustration.png',
          onTap: () {
            Get.back();
          },
        );
      }
        return listMK;
      
    } on TimeoutException catch (_) {
      isLoading.value = false;
      bottomsheet(
        title: 'Yah Gagal!',
        subtitle: 'Perikas kembali koneksi anda',
        image: 'assets/images/sad-illustration.png',
        onTap: () {
          Get.back();
        },
      );
        return listMK;

    } on SocketException catch (_) {
      isLoading.value = false;
      bottomsheet(
        title: 'Yah Gagal!',
        subtitle: 'Kesalahan tidak diketahui',
        image: 'assets/images/sad-illustration.png',
        onTap: () {
          Get.back();
        },
      );
        return listMK;

    }
  }

  @override
  void onInit() {
    // TODO: implement onInit

    super.onInit();
  }
}
