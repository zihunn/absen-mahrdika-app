import 'package:absensi_mahardika/app/modules/home-dosen/views/home_dosen_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../notifications_dosen/views/notifications_dosen_view.dart';
import '../../settings_dosen/views/settings_dosen_view.dart';

class NavigationsDosenController extends GetxController {
  RxInt selectedIndex = 0.obs;

  List<Widget> screenList = [
    const HomeDosenView(),
    const NotificationsDosenView(),
    const SettingsDosenView(),
  ];

  void changeIndex(int index) {
    selectedIndex.value = index;
  }
}
