import 'dart:convert';

import 'package:absensi_mahardika/app/controllers/auth_controller.dart';
import 'package:absensi_mahardika/app/utils/network.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import "package:http/http.dart" as http;

class HistoryAbsenController extends GetxController {
  RxInt pageHadir = 1.obs;
  RxInt pageIzin = 1.obs;
  RxInt pageSakit = 1.obs;
  RxInt pageAlpa = 1.obs;
  List historyAlpa = [].obs;
  List historyizin = [].obs;
  List historyHadir = [].obs;
  List historySakit = [].obs;
   RxString status = 'hadir'.obs;
  var isConnection = false.obs;
  var isDataLoading = false.obs;
  var isShowShammer = true.obs;
  static GetStorage box = GetStorage();
  static var dataUserLocal = box.read('dataUser');
  final scrollControllerHadir = ScrollController();
  final scrollControllerIzin = ScrollController();
  final scrollControllerSakit = ScrollController();
  final scrollControllerAlpa = ScrollController();
  static var dataUser = Get.put(AuthController()).dataUser.value;

 

  String capitalizeAllWord(String value) {
    var result = value[0].toUpperCase();
    for (int i = 1; i < value.length; i++) {
      if (value[i - 1] == " ") {
        result = result + value[i].toUpperCase();
      } else {
        result = result + value[i];
      }
    }
    return result;
  }

  Future getHistory(requestParams) async {
    try {
      // isShowShammer(true);

      var url = Uri.http(baseUrl, 'api/absensi/show', requestParams);
      print(url);
      await Future.delayed(const Duration(seconds: 1));
      http.Response response = await http.get(url, headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token', 
      });

      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        print(result['data'][0]['status']);
        if (result['data'][0]['status'] == 'hadir') {
          historyHadir = historyHadir + result['data'];
          return historyHadir;
        }
        if (result['data'][0]['status'] == 'izin') {
          historyizin = historyizin + result['data'];
          return historyizin;
        }
        if (result['data'][0]['status'] == 'sakit') {
          historySakit = historySakit + result['data'];
          return historySakit;
        } else {
          historyAlpa = historyAlpa + result['data'];
          return historyAlpa;
        }
      }
    } catch (e) {
      print(e);
      // isDataLoading(false);
    } finally {
      isShowShammer(false);
    }
  }

  Map<String, dynamic> requestParamsHadir = {
    'npm': dataUser.account!.npm,
    'status': 'hadir',
    'paginate': '6',
    'page': '1'
  };
  Map<String, dynamic> requestParamsIzin = {
    'npm': dataUser.account!.npm,
    'status': 'izin',
    'paginate': '6',
    'page': '1'
  };
  Map<String, dynamic> requestParamsSakit = {
    'npm': dataUser.account!.npm,
    'status': 'sakit',
    'paginate': '6',
    'page': '1'
  };
  Map<String, dynamic> requestParamsAlpa = {
    'npm': dataUser.account!.npm,
    'status': 'alpa',
    'paginate': '6',
    'page': '1'
  };

  Future<void> scrollListener(ScrollController ctrl, RxInt page) async {
    if (isDataLoading.value) return;

    if (ctrl.position.pixels == ctrl.position.maxScrollExtent) {
      isDataLoading(true);

      page.value = page.value + 1;

      print('=========');

      print(page.value);

      print('=========');

      Map<String, dynamic> requestParams = {
        'npm': dataUser.account!.npm ,
        'status': status.value,
        'paginate': '6',
        'page': '${page.value}'
      };

      await getHistory(requestParams);

      print('call');

      isDataLoading(false);
    } else {
      print('Don\'t call');
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getHistory(requestParamsHadir);
    getHistory(requestParamsIzin);
    getHistory(requestParamsSakit);
    getHistory(requestParamsAlpa);
    scrollControllerHadir.addListener(() {
      scrollListener(scrollControllerHadir, pageHadir);
    });
    scrollControllerIzin.addListener(() {
      scrollListener(scrollControllerIzin, pageIzin);
    });
    scrollControllerSakit.addListener(() {
      scrollListener(scrollControllerSakit, pageSakit);
    });
    scrollControllerAlpa.addListener(() {
      scrollListener(scrollControllerAlpa, pageAlpa);
    });
    super.onInit();
  }
}
