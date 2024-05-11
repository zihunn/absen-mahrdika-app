import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../utils/color.dart';
import '../controllers/navigations_dosen_controller.dart';

class NavigationsDosenView extends GetView<NavigationsDosenController> {
  const NavigationsDosenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: controller.screenList[controller.selectedIndex.value],
        bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(30),
          ),
          child: BottomNavigationBar(
            selectedItemColor: controller.selectedIndex.value == 1
                ? Colors.transparent
                : AppColor.bluePrimary,
            backgroundColor: Colors.white,
            currentIndex: controller.selectedIndex.value,
            elevation: 3,
            selectedLabelStyle: const TextStyle(
              fontSize: 10.0,
            ),
            unselectedLabelStyle: const TextStyle(
              fontSize: 10.0,
            ),
            iconSize: Get.height / 30,
            onTap: (value) {
              controller.changeIndex(value);
              print(controller.selectedIndex.value);
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  CupertinoIcons.home,
                  color: Colors.transparent,
                ),
                label: '',
                backgroundColor: Colors.transparent,
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.settings),
                label: 'Setting',
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () => controller.changeIndex(1),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(
                15,
              ),
            ),
          ),
          child: Container(
            width: 60,
            height: 60,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(15.0),
              ),
              color: AppColor.bluePrimary,
            ),
            child: const Icon(
              Icons.school,
              size: 30.0,
            ),
          ),
        ),
      ),
    );
  }
}
