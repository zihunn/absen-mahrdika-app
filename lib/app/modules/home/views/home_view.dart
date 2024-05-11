import 'package:get/get.dart';
import 'package:absensi_mahardika/app/widgets/image_rotate/image_rotate.dart';
import 'package:absensi_mahardika/app/widgets/tabbar/home_body.dart';
import 'package:absensi_mahardika/app/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import '../../../utils/color.dart';
import '../../../utils/network.dart';
import '../controllers/home_controller.dart';
import 'dart:math' as math;

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
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
                    width: 300,
                    height: 300,
                    angle: -math.pi / 2,
                    left: -130,
                    bottom: -15,
                  ),
                  ImageRotate(
                    image: "assets/images/image7.png",
                    width: 250,
                    height: 250,
                    angle: -math.pi / 10,
                    top: -100,
                    right: -90,
                  ),
                  ImageRotate(
                    image: "assets/images/image7.png",
                    width: 250,
                    height: 250,
                    angle: -math.pi / 4,
                    right: -100,
                    bottom: -60,
                  ),
                ],
              ),
            ),
            SafeArea(
              child: Container(
                width: Get.width,
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Obx(() {
                          return Row(
                            children: [
                              Container(
                                height: 45,
                                width: 45,
                                decoration: BoxDecoration(
                                  color: AppColor.greyColor,
                                  shape: BoxShape.circle,
                                  image: dataUser.value.account?.image == null
                                      ? const DecorationImage(
                                          image: AssetImage(
                                              'assets/images/noimage.png'),
                                          fit: BoxFit.cover,
                                        )
                                      : DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                            dataUser.value.account!.image!,
                                          ),
                                        ),
                                ),
                              ),
                              const SizedBox(
                                width: 15.0,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    dataUser.value.account?.nama ?? 'null',
                                    style: Style.Subtitle1.copyWith(
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                  ),
                                  Text(
                                    dataUser.value.account?.npm ?? 'null',
                                    style: Style.Subtitle1.copyWith(
                                      color: Colors.white,
                                      fontSize: 12,
                                      decoration: TextDecoration.underline,
                                      fontFamily: 'SignikaRegular',
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          );
                        }),
                        const Icon(
                          Ionicons.notifications_outline,
                          size: 24.0,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const HomeBody(),
          ],
        ),
      ),
    );
  }
}
