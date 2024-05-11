import 'dart:developer';

import 'package:absensi_mahardika/app/data/totalAbsen_model.dart';
import 'package:absensi_mahardika/app/modules/home/controllers/home_controller.dart';
import 'package:absensi_mahardika/app/routes/app_pages.dart';
import 'package:absensi_mahardika/app/utils/color.dart';
import 'package:absensi_mahardika/app/utils/network.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import "package:http/http.dart" as http;
import 'package:dio/dio.dart' as dioPackage;

class ProfileController extends GetxController {
  final RxBool theme = false.obs;
  var totalAbsen = totalAbsenModel().obs;
  final RxBool language = false.obs;
  final RxBool isChange = false.obs;
  static GetStorage box = GetStorage();
  var dataUserLocal = box.read('dataUser');
  var isDataLoading = false.obs;
  RxBool isDarkMode = false.obs;
  final homeCtrl = Get.put(HomeController());
  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
    Get.changeTheme(
      isDarkMode.value ? Themes.dark : Themes.light,
    );
    box.write('isDarkMode', isDarkMode.value);
  }

  void changelanguage(Locale locale) {
    Get.updateLocale(locale);
    box.write('isID', language.value);
    print(box.read('isID'));
  }

  void logout(String token) async {
    try {
      http.Response response = await http.get(
        Uri.tryParse(logoutUrl)!,
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        box.remove('token');
        Get.offAllNamed(Routes.LOGIN);
      }
    } catch (e) {}
  }

  // Future getJadwal(requestBody) async {
  //   try {
  //     var res = await dio.post(
  //       jadwalUrl,
  //       data: dioPackage.FormData.fromMap(requestBody),
  //     );
  //     print("get jadwal");
  //     print(res);
  //     log(res.realUri.toString());
  //     if (res.statusCode == 200) {
  //       return res.data;
  //     }
  //   } catch (e) {
  //     print(e);
  //     return null;
  //   }
  // }

  @override
  void onInit() {
    isDarkMode.value = box.read('isDarkMode') ?? false;
    super.onInit();
  }
}


