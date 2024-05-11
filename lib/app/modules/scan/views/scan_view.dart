import 'package:absensi_mahardika/app/modules/home/controllers/home_controller.dart';
import 'package:absensi_mahardika/app/utils/style.dart';
import 'package:absensi_mahardika/app/widgets/appbar/custom_appbar.dart';
import 'package:absensi_mahardika/app/widgets/button/button_icon.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'dart:math' as math;

import '../../../widgets/image_rotate/image_rotate.dart';
import '../controllers/scan_controller.dart';

class ScanView extends GetView<ScanController> {
  const ScanView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // Get.put(ScanController());
    var homeCtrl = Get.put(HomeController());
    return Scaffold(
      backgroundColor: context.theme.primaryColor,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Container(
              height: 75,
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
                    bottom: -120,
                  ),
                  CustomAppbar(text: 'Scan'),
                  ImageRotate(
                    image: "assets/images/image7.png",
                    width: 200,
                    height: 200,
                    angle: -math.pi / 1.8,
                    top: -70,
                    right: -90,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            StreamBuilder(
              stream: homeCtrl.getTime(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                return Container(
                  height: 100,
                  width: Get.width,
                  decoration: const BoxDecoration(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'qr'.tr,
                        style: Style.Header1.copyWith(
                          fontFamily: 'SignikaSemi',
                          color: context.theme.textTheme.bodyLarge!.color,
                          fontSize: 18.0,
                        ),
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        'descQr'.tr,
                        style: Style.Subtitle1.copyWith(
                          fontSize: 14.0,
                          fontFamily: 'SignikaRegular',
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            const SizedBox(
              height: 35.0,
            ),
            Expanded(
              child: Stack(
                children: [
                  Container(
                    height: 300,
                    width: 300,
                    padding: const EdgeInsets.all(7),
                    clipBehavior: Clip.antiAlias,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(12.0),
                      ),
                      image: DecorationImage(
                        image: AssetImage('assets/images/border.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: Container(
                      height: 300,
                      width: 300,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(35.0),
                        ),
                        color: context.theme.primaryColor,
                      ),
                      child: Container(
                        height: 100,
                        width: 100,
                        margin: const EdgeInsets.all(12),
                        clipBehavior: Clip.antiAlias,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(30.0),
                          ),
                        ),
                        child: QRView(
                          key: controller.qrKey,
                          onQRViewCreated: controller.onQRViewCreated,
                          
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ButtonIcon(
                  height: 55,
                  width: 55,
                  icon: Ionicons.images,
                  onTap: () => controller.getImage(),
                ),
                ButtonIcon(
                  height: 55,
                  width: 55,
                  icon: Ionicons.flashlight,
                  onTap: () {},
                ),
              ],
            ),
            Obx(
              () => Text(controller.latitude.value.toString()),
            ),
            Container(
              alignment: Alignment.center,
              height: 90,
              width: Get.width,
              decoration: const BoxDecoration(),
              child: Text(
                "Dibuat Oleh Mahardika",
                style: Style.Subtitle1.copyWith(
                  fontFamily: 'SignikaRegular',
                  fontSize: 10.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
