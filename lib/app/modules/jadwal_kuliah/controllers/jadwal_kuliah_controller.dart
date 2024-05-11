import 'dart:convert';
import 'dart:math';
import 'package:absensi_mahardika/app/controllers/auth_controller.dart';
import 'package:absensi_mahardika/app/data/jadwal_model.dart';
import 'package:absensi_mahardika/app/utils/bottomsheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:absensi_mahardika/app/utils/network.dart';
import "package:http/http.dart" as http;

class JadwalKuliahController extends GetxController
    with GetTickerProviderStateMixin {
  jadwalModel? jadwalData;
  var client = http.Client();
  var isConnection = false.obs;
  var isDataLoading = false.obs;
  var selectedDate = DateTime.now().obs;

  void datePicker() async {
    final DateTime? pickedDate = await showDatePicker(
      context: Get.context!,
      initialDate: DateTime.now(),
      firstDate: DateTime(2002),
      lastDate: DateTime(2050),
    );
    if (pickedDate != null && pickedDate != selectedDate.value) {
      selectedDate.value = pickedDate;

      Map<String, dynamic> requestParams = {
        'npm': dataUser.value.account!.npm,
        'date': selectedDate.value.toString().split(' ').first
      };

      getJadwal(requestParams);

      updateDataInList();
    }
  }

  Future getJadwal(requestParams) async {
    try {
      isDataLoading(true);

      var url = Uri.https('api.lkp-ppik.id', '/api/jadwal', requestParams);
      print(url);
      await Future.delayed(const Duration(seconds: 1));
      http.Response response = await http.get(url, headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      });

      isConnection.value = false;

      var result = jsonDecode(response.body);

      jadwalData = jadwalModel.fromJson(result);

      print(result);

      return jadwalData;
    } catch (e) {
      print(e);
      isConnection.value = true;
      isDataLoading(false);
    } finally {
      isDataLoading(false);
    }
  }

  allWordsCapitilize(String str) {
    return str.toLowerCase().split(' ').map((word) {
      String leftText = (word.length > 1) ? word.substring(1, word.length) : '';
      return word[0].toUpperCase() + leftText;
    }).join(' ');
  }

  List imageAndColor = [
    {
      'color': const Color(0xff78C1F3),
      'image': "assets/images/image12.png",
    },
    {
      'color': Colors.amber,
      'image': "assets/images/image15.png",
    },
    {
      'color': Colors.purpleAccent,
      'image': "assets/images/image13.png",
    },
  ];

  void updateDataInList() {
    imageAndColor.shuffle();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    Map<String, dynamic> requestBody = {
      'npm': dataUser.value.account!.npm,
      'date': selectedDate.value.toString().split(' ').first
    };
    getJadwal(requestBody);
    updateDataInList();
    super.onInit();
  }
}
