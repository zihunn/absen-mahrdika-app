import 'package:absensi_mahardika/app/modules/profile/controllers/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import '../controllers/navigation_bar_controller.dart';

class NavigationBarView extends GetView<NavigationBarController> {
  const NavigationBarView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(NavigationBarController());
    Get.put(ProfileController());
    return PersistentTabView(
      context,
      screens: controller.screens,
      items: controller.navBarItem(),
      controller: controller.controller,
      backgroundColor: context.theme.primaryColor,
      navBarHeight: 68,
      onItemSelected: (value) {
        if (value != 2) {
          controller.camCtrl.controller?.pauseCamera();
        } else {
          controller.camCtrl.controller?.resumeCamera();
        }
      },
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(1),
      ),
      navBarStyle: NavBarStyle.style15,
    );
  }
}

