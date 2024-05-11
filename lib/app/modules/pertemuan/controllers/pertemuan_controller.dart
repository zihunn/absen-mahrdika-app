import 'dart:convert';
import 'dart:ui';
import 'package:absensi_mahardika/app/data/pertemuan_model.dart';
import 'package:absensi_mahardika/app/utils/network.dart';
import 'package:dio/dio.dart';
import "package:http/http.dart" as http;
import 'package:absensi_mahardika/app/utils/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import "package:dio/dio.dart" as diopack;

import '../../../utils/bottomsheet.dart';

class PertemuanController extends GetxController {
  TextEditingController pertemuanCtrl = TextEditingController();
  TextEditingController materiCtrl = TextEditingController();
  Rx<TextEditingController> dateCtrl = TextEditingController().obs;
  Rx<TextEditingController> jamMulaiCtrl = TextEditingController().obs;
  Rx<TextEditingController> jamSelesaiCtrl = TextEditingController().obs;
  static int hour = 0;
  static int minute = 0;
  TimeOfDay initialTime = TimeOfDay(hour: hour, minute: minute);
  Rx<DateTime> currentDateTime = DateTime.now().obs;
  RxString selectedDate = ''.obs;
  RxBool isLoading = true.obs;
  var listMeet = PertemuanModel().obs;

  List<Color> listColor = [
    const Color(0xff185EEF),
    const Color(0xffED451C),
    const Color(0xff65B741),
    const Color(0xffF875AA),
    const Color(0xff6C22A6),
    const Color(0xffB80000),
    AppColor.blueColor,
    AppColor.yellowColor,
    const Color(0xff76453B),
    const Color(0xffFF9843),
  ];

  void datePicker() async {
    final DateTime? pickedDate = await showDatePicker(
      context: Get.context!,
      initialDate: DateTime.now(),
      firstDate: DateTime(2002),
      lastDate: DateTime(2050),
    );
    if (pickedDate != null && pickedDate != selectedDate.value) {
      final DateFormat formatter = DateFormat('yyyy-MM-dd');
      selectedDate.value = formatter.format(pickedDate);
      dateCtrl.value = TextEditingController(text: selectedDate.value);
      print(selectedDate.value);
    }
  }

  void createMeet(requestBody, requestParams) async {
    try {
      var response = await dio.post(
        presensiUrl,
        options: diopack.Options(
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          },
          sendTimeout: const Duration(minutes: 2),
        ),
        data: diopack.FormData.fromMap(requestBody),
      );

      if (response.statusCode == 200) {
        print("create Meet${response.statusCode}");
        getMeet(requestParams);
        bottomsheet(
          title: 'Yay Berhasil!',
          subtitle: 'Berhasil Menambahkan Pertemuan',
          image: 'assets/images/happy-illustration.png',
          onTap: () {
            Get.back();
          },
        );
      }
      if (response.statusCode == 400) {
        bottomsheet(
          title: 'Yahh Gagal!',
          subtitle: 'Data Tidak Boleh Kosong',
          image: 'assets/images/sad-illustration.png',
          onTap: () {
            Get.back();
          },
        );
      }
      if (response.statusCode == 401) {
        bottomsheet(
          title: 'Yahh Gagal!',
          subtitle: 'Pertemuan Sudah Ada',
          image: 'assets/images/sad-illustration.png',
          onTap: () {
            Get.back();
          },
        );
      }
      if (response.statusCode == 402) {
        bottomsheet(
          title: 'Yahh Gagal!',
          subtitle: 'Silahkan Coba Lagi..',
          image: 'assets/images/sad-illustration.png',
          onTap: () {
            Get.back();
          },
        );
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.connectionError ||
          e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.sendTimeout) {
        bottomsheet(
          title: 'Yahh Gagal!',
          subtitle: 'Periksa Koneksi Internet',
          image: 'assets/images/sad-illustration.png',
          onTap: () {
            Get.back();
          },
        );
      }
      bottomsheet(
        title: 'Yahh Gagal!',
        subtitle: 'Kesalahan Tidak Diketahui',
        image: 'assets/images/sad-illustration.png',
        onTap: () {
          Get.back();
        },
      );
    }
  }

  void getMeet(requestParams) async {
    try {
      isLoading.value = true;
      var url = Uri.http(baseUrl, 'api/presensi', requestParams);
      http.Response response = await http.get(url, headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });
      print("get Meet${response.statusCode}");

      print(response.statusCode);
      if (response.statusCode == 200) {
        isLoading.value = false;
        var result = jsonDecode(response.body);

        listMeet.value = PertemuanModel.fromJson(result);
        print(result);
      }
    } catch (e) {
      print(e);
    }
  }

  void deleteMeet(String jadwal_id) async {
    try {
      isLoading.value = true;
      var url = Uri.http(baseUrl, '/api/presensi/delete/$jadwal_id');
      http.Response response = await http.post(
        url,
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      print(response.body);
      if (response.statusCode == 200) {
        isLoading.value = false;
        bottomsheet(
          title: "Yay Berhasil!",
          subtitle: "Anda berhasil menghapus pertemuan.",
          image: 'assets/images/happy-illustration.png',
          onTap: () {
            Get.back();
          },
        );
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    selectedDate.value = currentDateTime.value.toString().split(' ').first;

    hour = hour = int.parse(
      currentDateTime.value
          .toString()
          .split(' ')
          .last
          .split('.')
          .first
          .substring(0, 2),
    );
    // dateCtrl.value = TextEditingController(text: selectedDate.value);
  }
}
