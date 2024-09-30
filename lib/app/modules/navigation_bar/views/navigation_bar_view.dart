import 'package:absensi_mahardika/app/modules/profile/views/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import '../../home/controllers/home_controller.dart';
import '../../home/views/home_view.dart';
import '../controllers/navigation_bar_controller.dart';

class NavigationBarView extends GetView<NavigationBarController> {
  const NavigationBarView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
     return Obx(() {
      return Scaffold(
        body: IndexedStack(
          index: controller.navIndex.value,
          children: controller.screens,
        ),
        bottomNavigationBar: PersistentTabView(
          context,
          controller: PersistentTabController(
              initialIndex: controller.navIndex.value),
          screens: controller.screens,
          items: controller.navBarItems(),
          backgroundColor: context.theme.primaryColor,
          navBarHeight: 68,
          onItemSelected: (value) {
            controller.onTabChanged(value);
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
        ),
      );
    });
  }

  //   return PersistentTabView(
  //     context,
  //     screens: controller.screens,
  //     items: controller.navBarItem(),
  //     controller: controller.controller,
  //     backgroundColor: context.theme.primaryColor,
  //     navBarHeight: 68,
  //     onItemSelected: (value) {
  //       if (value == 0 ) {
  //         print('UniqueKey');

  //         controller.screens[0] = HomeView(key: UniqueKey());
  //       } else {
  //         print('container');
  //         controller.screens[0] = Container();

  //       }
  //       if (value != 2) {
  //         controller.camCtrl.controller?.pauseCamera();
  //       } else {
  //         controller.camCtrl.controller?.resumeCamera();
  //       }
  //     },
  //     decoration: NavBarDecoration(
  //       borderRadius: BorderRadius.circular(1),
  //     ),
  //     navBarStyle: NavBarStyle.style15,
  //   );
  // }
}
