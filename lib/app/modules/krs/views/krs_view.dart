import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'dart:math' as math;

import '../../../utils/color.dart';
import '../../../utils/network.dart';
import '../../../utils/style.dart';
import '../../../widgets/appbar/custom_appbar.dart';
import '../../../widgets/button/button_icon.dart';
import '../../../widgets/image_rotate/image_rotate.dart';
import '../../../widgets/tabbar/jadwal_body.dart';
import '../../../widgets/tabbar/krs_body.dart';
import '../../tambah_krs/views/tambah_krs_view.dart';
import '../controllers/krs_controller.dart';

class KrsView extends GetView<KrsController> {
  const KrsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var npm = dataUser.value.account?.npm ?? dataUserLocal['account']['npm'];
    return Scaffold(
      backgroundColor: context.theme.primaryColor,
      // backgroundColor: Colors.white,

      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: Stack(
          children: [
            Container(
              height: Get.height / 3,
              width: Get.width,
              decoration: BoxDecoration(
                color: context.theme.appBarTheme.backgroundColor,
              ),
              child: const Stack(
                children: [
                  ImageRotate(
                    image: "assets/images/image7.png",
                    width: 200,
                    height: 200,
                    angle: -math.pi / 3,
                    left: -90,
                    bottom: 69,
                  ),
                  ImageRotate(
                    image: "assets/images/image7.png",
                    width: 200,
                    height: 200,
                    angle: -math.pi / 1.8,
                    top: -70,
                    right: -90,
                  ),
                  ImageRotate(
                    image: "assets/images/image7.png",
                    width: 200,
                    height: 200,
                    right: -100,
                    bottom: -20,
                    angle: -math.pi / 1.8,
                  ),
                ],
              ),
            ),
            SafeArea(
              child: SizedBox(
                height: Get.height / 12,
                child: Row(
                  children: [
                    SizedBox(
                      child: ButtonIcon(
                        height: 40,
                        width: 40,
                        color: Colors.white,
                        icon: Ionicons.arrow_back,
                        onTap: () => Get.back(),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        width: Get.width,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Krs",
                            style: Style.Subtitle1.copyWith(
                              fontFamily: 'Signika',
                              color: Colors.white,
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 50,
                      width: 70,
                      decoration: const BoxDecoration(),
                    ),
                  ],
                ),
              ),
            ),
            const KrsBody(),
          ],
        ),
      ),
      floatingActionButton: Obx(() => FloatingActionButton(
            onPressed: controller.dataKrs.value.availKrs == true
                ? () {
                    Get.to(() => const TambahKrsView(),
                        transition: Transition.rightToLeft);
                  }
                : () {
                    controller.downloadFile(npm);
                  },
            child: controller.dataKrs.value.availKrs == true
                ? const Icon(
                    Icons.add,
                  )
                : const Icon(
                    Icons.print_outlined,
                  ),
          )),
    );
  }
}
