import 'package:absensi_mahardika/app/widgets/appbar/custom_appbar.dart';
import 'package:absensi_mahardika/app/widgets/image_rotate/image_rotate.dart';
import 'package:absensi_mahardika/app/widgets/tabbar/jadwal_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/jadwal_kuliah_controller.dart';
import 'dart:math' as math;

class JadwalKuliahView extends GetView<JadwalKuliahController> {
  const JadwalKuliahView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(JadwalKuliahController());
    return Scaffold(
      backgroundColor: context.theme.primaryColor,
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
            CustomAppbar(text: 'jadwal'.tr),
            const JadwalBody(),
          ],
        ),
      ),
    );
  }
}
