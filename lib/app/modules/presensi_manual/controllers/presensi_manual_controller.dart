import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:absensi_mahardika/app/data/detail_presensi_mhsw.dart';
import 'package:absensi_mahardika/app/utils/network.dart';
import 'package:get/get.dart';
import "package:dio/dio.dart" as diopack;
import "package:http/http.dart" as http;

import '../../../utils/bottomsheet.dart';

class PresensiManualController extends GetxController {
  Map<String, dynamic> listMhsw = {};
  RxBool isLoading = false.obs;
  RxBool isScroll = false.obs;
  RxInt valueChoice = 0.obs;
  RxInt nilai = 0.obs;
  RxString status = ''.obs;
  Rx<DetailPresensiMhsw> data = DetailPresensiMhsw().obs;

  Future searchMhsw(requestBody) async {
    try {
      isLoading.value = true;
      Future.delayed(const Duration(seconds: 8));
      var response = await dio.post(
        searchMhswUrl,
        options: diopack.Options(
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          },
          sendTimeout: const Duration(minutes: 2),
        ),
        data: diopack.FormData.fromMap(requestBody),
      );

      print(searchMhswUrl);
      print(response.data);
      if (response.statusCode == 200) {
        isLoading.value = false;
        listMhsw = response.data;
        print(listMhsw);
        return listMhsw;
      }
      return listMhsw;
    } catch (e) {
      print(e);
    }
    return listMhsw;
  }

  void detailPresensiMhsw(requestParams) async {
    try {
      var url = Uri.http(baseUrl, '/api/presensi/mhsw/detail', requestParams);

      http.Response response = await http.get(
        url,
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      ).timeout(const Duration(minutes: 2));

      print(response.statusCode);
      print(url);
      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);

        data.value = DetailPresensiMhsw.fromJson(result);

        valueChoice.value = result['value'];
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

  void absen(requestBody) async {
    try {
      var url = Uri.parse(absensiUrl);

      http.Response response = await http
          .post(
            url,
            headers: {
              'Accept': 'application/json',
              'Content-Type': 'application/json',
              'Authorization': 'Bearer $token',
            },
            body: json.encode(requestBody),
          )
          .timeout(const Duration(minutes: 2));

      print(response.body);
      if (response.statusCode == 200) {
        bottomsheet(
          title: 'Yah Berhasil!',
          subtitle: 'Berhasil mengabsenkan',
          image: 'assets/images/happy-illustration.png',
          onTap: () {
            Get.back();
          },
        );
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
}
