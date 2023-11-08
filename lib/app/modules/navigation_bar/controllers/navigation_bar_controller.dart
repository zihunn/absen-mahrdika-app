import 'package:absensi_mahardika/app/modules/history_absen/views/history_absen_view.dart';
import 'package:absensi_mahardika/app/modules/home/views/home_view.dart';
import 'package:absensi_mahardika/app/modules/jadwal_kuliah/views/jadwal_kuliah_view.dart';
import 'package:absensi_mahardika/app/modules/profile/views/profile_view.dart';
import 'package:absensi_mahardika/app/modules/scan/controllers/scan_controller.dart';
import 'package:absensi_mahardika/app/modules/scan/views/scan_view.dart';
import 'package:absensi_mahardika/app/utils/color.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:ionicons/ionicons.dart';

class NavigationBarController extends GetxController {
  var navIndex = 0.obs;
  final camCtrl = Get.put(ScanController());
  final controller = PersistentTabController(initialIndex: 0);

  List<PersistentBottomNavBarItem> navBarItem() {
    return [
      PersistentBottomNavBarItem(
        activeColorPrimary: AppColor.blueColor2,
        inactiveColorPrimary: AppColor.greyColor,
        title: "beranda".tr,
        icon: const Icon(
          Ionicons.home,
        ),
      ),
      PersistentBottomNavBarItem(
        activeColorPrimary: AppColor.blueColor2,
        inactiveColorPrimary: AppColor.greyColor,
        title: "jadwal".tr,
        icon: const Icon(
          Icons.menu_book_rounded,
        ),
      ),
      PersistentBottomNavBarItem(
        activeColorPrimary: AppColor.blueColor2,
        inactiveColorPrimary: AppColor.greyColor,
        icon: Image.asset(
          "assets/images/logo-mahardika.png",
        ),
      ),
      PersistentBottomNavBarItem(
        activeColorPrimary: AppColor.blueColor2,
        inactiveColorPrimary: AppColor.greyColor,
        title: "riwayat_absen".tr,
        icon: const Icon(
          EneftyIcons.note_2_outline,
        ),
      ),
      PersistentBottomNavBarItem(
        activeColorPrimary: AppColor.blueColor2,
        inactiveColorPrimary: AppColor.greyColor,
        title: "profil".tr,
        icon: const Icon(
          Ionicons.person_outline,
        ),
      ),
    ];
  }

  final List<Widget> screens = [
    const HomeView(),
    const JadwalKuliahView(),
    const ScanView(),
    const HistoryAbsenView(),
    const ProfileView()
  ];

  void changeNavIndex(int index) {
    controller.index = index;
    navIndex.value = index;
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}
