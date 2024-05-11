import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:absensi_mahardika/app/data/krs_model.dart';
import 'package:absensi_mahardika/app/utils/network.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import "package:http/http.dart" as http;
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../utils/bottomsheet.dart';

class KrsController extends GetxController {
  final dataKrs = krsModel().obs;

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
      'colorLine': Colors.red[400],
      'colorShadow': const Color(0xffD1F2FB),
      'image': "assets/icons/education5.png",
    },
  ];

  Future getKrs(requestParams) async {
    try {
      var url = Uri.http(baseUrl, 'api/krs', requestParams);

      http.Response response = await http.get(url, headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      }).timeout(const Duration(minutes: 2));

      print(response.body);

      if (response.statusCode == 200) {
        var result = json.decode(response.body);
        dataKrs.value = krsModel.fromJson(result);
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
  }

  Future<void> downloadFile(String npm) async {
    // Endpoint API
    String apiUrl = 'http://$baseUrl/api/krs/cetak';

    // Memeriksa izin penyimpanan
    var status = await Permission.storage.status;
    if (!status.isGranted) {
      await Permission.storage.request();
    }
    print(status);
    // Membuat permintaan GET ke API dengan parameter npm
    try {
      var response = await http.get(Uri.parse('$apiUrl?npm=$npm'));
      if (response.statusCode == 200) {
        // Menemukan direktori tempat file akan disimpan
        String dir =
            '${(await getExternalStorageDirectory())!.path.split('Android').first}Download';
        File file = File('$dir/krs_$npm.pdf');

        // Menulis data biner dari respons ke file
        await file.writeAsBytes(response.bodyBytes);

        print('File berhasil diunduh dan disimpan di $dir');
      } else {
        // Menangani respons yang tidak berhasil
        print('Gagal mengunduh file: ${response.statusCode}');
      }
    } catch (e) {
      print('Terjadi kesalahan saat mengunduh file: $e');
    }
  }
}
