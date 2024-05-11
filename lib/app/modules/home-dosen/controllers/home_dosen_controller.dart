import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:absensi_mahardika/app/controllers/auth_controller.dart';
import 'package:absensi_mahardika/app/data/jadwal_dosen_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import "package:http/http.dart" as http;

import '../../../utils/bottomsheet.dart';
import '../../../utils/color.dart';
import '../../../utils/date_utils.dart';
import '../../../utils/network.dart';

class HomeDosenController extends GetxController {
  var scrollController = ScrollController();
  List<DateTime> currentMonthList = List.empty();
  Rx<DateTime> currentDateTime = DateTime.now().obs;
  DateTime date = DateTime.now();
  var jadwalDosen = jadwalDosenModel().obs;
  RxBool isLoading = true.obs;
  static var authCtrl = Get.put(AuthController());
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

  void updateDataInList() {
    imageAndColor.shuffle();
  }

  Future getJadwalDosen(requestParams) async {
    String? tkn = token ?? authCtrl.dataUser.value.account?.rememberToken;
    try {
      isLoading.value = true;
      var url = Uri.http(baseUrl, 'api/jadwal/dosen', requestParams);
      Future.delayed(const Duration(seconds: 6));
      http.Response response = await http.get(url, headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $tkn',
      }).timeout(const Duration(minutes: 2));

      if (response.statusCode != 200) {
        isLoading.value = false;
      }

      isLoading.value = false;

      var result = jsonDecode(response.body);
      print(result);

      jadwalDosen.value = jadwalDosenModel.fromJson(result);
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

  @override
  void onInit() {
    Map<String, dynamic> requestParams = {
      'dosen_id': dataUser.value.account?.dosenId ??
          dataUserLocal['account']['dosen_id'],
      'date': currentDateTime.value.toString().split(' ').first
    };
    getJadwalDosen(requestParams);

    print('object');
    currentMonthList = DateUtil.daysInMonth(currentDateTime.value);
    currentMonthList.sort((a, b) => a.day.compareTo(b.day));
    currentMonthList = currentMonthList.toSet().toList();
    scrollController =
        ScrollController(initialScrollOffset: 70.0 * currentDateTime.value.day);
    updateDataInList();
  }
}
