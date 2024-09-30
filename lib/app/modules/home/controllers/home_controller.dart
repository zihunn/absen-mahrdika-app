import 'dart:async';
import 'dart:convert';
import 'package:absensi_mahardika/app/controllers/auth_controller.dart';
import 'package:absensi_mahardika/app/modules/Khs/views/khs_view.dart';
import 'package:absensi_mahardika/app/modules/edit_profil/controllers/edit_profil_controller.dart';
import 'package:absensi_mahardika/app/modules/krs/views/krs_view.dart';
import 'package:absensi_mahardika/app/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import '../../../data/totalAbsen_model.dart';
import '../../../utils/network.dart';
import "package:http/http.dart" as http;

import '../../perizinan/views/perizinan_view.dart';

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  String hours = '';
  int hour = 0;
  int minute = 0;
  String time = '';
  var isDark = false;
  int selectedIndex = 0;
  RxInt currentIndex = 0.obs;
  var date = DateFormat('HH:mm');
  var isDataLoading = false.obs;
  late TabController tabController;
  final editCtrl = Get.put(EditProfilController()).dataUserLocal;
  static GetStorage box = GetStorage();
  var totalAbsen = totalAbsenModel().obs;
  var days = DateFormat('EEEE, d MMM yyyy', "id_ID").format(DateTime.now());
  get dataUserLocal => (box.read('dataUser') ?? "");

  List<Map<String, dynamic>> listFitur = [
    {
      'image': "assets/icons/krs.png",
      'name': "KRS",
      'subtitle': "Kartu Rencana Studi",
      'onTap': () {
        Get.to(
          () => const KrsView(),
          transition: Transition.rightToLeft,
        );
      }
    },
    {
      'image': "assets/icons/khs.png",
      'name': "KHS".tr,
      'subtitle': "Kartu Hasil Studi",
      'onTap': () {
        Get.to(
          () => const KhsView(),
          transition: Transition.rightToLeft,
        );
      }
    },
    {
      'image': "assets/icons/transkip.png",
      'name': "Transkrip".tr,
      'subtitle': 'Download Transkrip Nilai',
      'onTap': () {
        Get.to(() => const KrsView(), transition: Transition.rightToLeft);
      }
    },
    {
      'image': "assets/icons/permit.png",
      'name': "Perizinan".tr,
      'subtitle': 'Izin Perkuliahan',
      'onTap': () {
        Get.to(() => const PerizinanView(), transition: Transition.rightToLeft);
      }
    },
    {
      'image': "assets/icons/todo.png",
      'name': "ToDoListKa".tr,
      'subtitle': 'Ayo Atur Tugas Kuliahmu',
      'onTap': () {
        Get.to(() => const KrsView(), transition: Transition.rightToLeft);
      }
    },
  ];
  void changeTheme() {
    Get.changeTheme(Get.isDarkMode ? Themes.light : Themes.dark);
  }

  HomeController() {
    print('home ctrl');
  }
  Stream<DateTime> getTime() async* {
    while (true) {
      await Future.delayed(const Duration(seconds: 1));
      time = DateFormat('yyyy-MM-dd').format(DateTime.now());
      hour = int.parse(DateFormat('HH').format(DateTime.now()));
      hours = DateFormat('HH:mm').format(DateTime.now());
      minute = int.parse(DateFormat('mm').format(DateTime.now()));
      yield DateTime.now();
    }
  }

  // Stream<totalAbsenModel> streamAbsen(String npm) async* {
  //   var url = Uri.http(baseUrl, 'api/absensi', {'npm': npm});

  //   yield* Stream.periodic(const Duration(seconds: 15), (_) {
  //     return http.get(
  //       url,
  //       headers: {
  //         'Accept': 'application/json',
  //         'Authorization': 'Bearer $token',
  //       },
  //     );
  //   }).asyncMap((event) async {
  //     var data = await event;

  //     var result = jsonDecode(data.body);

  //     totalAbsen.value = totalAbsenModel.fromJson(result);
  //     print(token);
  //     return totalAbsen.value;
  //   });
  // }

  @override
  void onInit() {
    print('onInit Home Controller');
    box.listen(() => print('box changed home controller'));

    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    print('on ready home');
    super.onReady();
  }

  @override
  void onClose() {
    print('onClose Home Controller');
    super.onClose();
  }
}
