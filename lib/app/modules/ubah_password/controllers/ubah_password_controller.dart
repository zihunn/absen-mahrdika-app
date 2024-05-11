import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import "package:http/http.dart" as http;

import '../../../utils/bottomsheet.dart';
import '../../../utils/network.dart';

class UbahPasswordController extends GetxController {
  final GlobalKey<FormState> form = GlobalKey<FormState>();
  final TextEditingController pass = TextEditingController();
  final TextEditingController confirmPass = TextEditingController();
  RxBool isShowPw = false.obs;
  RxBool isShowPwConfirm = false.obs;
  RxBool isLoading = false.obs;

  Future changePassword(requestBody) async {
    try {
      isLoading.value = true;
      final jsonString = json.encode(requestBody);
      http.Response response = await http
          .post(Uri.parse('http://$baseUrl/api/user/ubahpassword'),
              headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json',
                'Authorization': 'Bearer $token',
              },
              body: jsonString)
          .timeout(const Duration(minutes: 2));

      print(response.body);
      if (response.statusCode == 200) {
        isLoading.value = false;
        pass.clear();
        confirmPass.clear();

        bottomsheet(
          title: 'Yay Berhasil!',
          subtitle: 'Berhasil Mengubah Password',
          image: 'assets/images/happy-illustration.png',
          onTap: () {
            Get.back();
          },
        );
      }

      isLoading.value = false;
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
    }
  }
}
