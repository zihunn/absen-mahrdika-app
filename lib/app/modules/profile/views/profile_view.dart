import 'package:absensi_mahardika/app/controllers/auth_controller.dart';
import 'package:absensi_mahardika/app/modules/profile/widgets/Card_absen.dart';
import 'package:absensi_mahardika/app/modules/profile/widgets/card_setting.dart';
import 'package:absensi_mahardika/app/modules/profile/widgets/logout_button.dart';
import 'package:absensi_mahardika/app/utils/color.dart';
import 'package:absensi_mahardika/app/utils/style.dart';
import 'package:absensi_mahardika/app/widgets/appbar/custom_appbar.dart';
import 'package:absensi_mahardika/app/widgets/image_rotate/image_rotate.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math' as math;
import '../../../utils/network.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(ProfileController());
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
                    bottom: -5,
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
            const CustomAppbar(text: 'Profil'),
            Container(
              margin: const EdgeInsets.only(top: 95),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(12.0),
                ),
              ),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Stack(
                  children: [
                    Container(
                      width: Get.width,
                      margin: const EdgeInsets.only(top: 50),
                      padding:
                          const EdgeInsets.only(top: 65, left: 25, right: 25),
                      decoration: BoxDecoration(
                        color: context.theme.primaryColor,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(15.0),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            dataUser.value.account!.nama!,
                            style: Style.Header1.copyWith(
                                fontFamily: 'SignikaSemi',
                                color: context.textTheme.bodyLarge!.color),
                          ),
                          Text(
                            dataUser.value.account!.npm!,
                            style: Style.Header1.copyWith(
                              fontFamily: 'SignikaRegular',
                              color: AppColor.greyColor,
                              fontSize: 16.0,
                            ),
                          ),
                          const SizedBox(
                            height: 15.0,
                          ),
                          const CardAbsen(),
                          const SizedBox(
                            height: 15.0,
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Setting",
                              style: Style.Header1.copyWith(
                                  color:
                                      context.theme.textTheme.bodyLarge!.color),
                            ),
                          ),
                          const SizedBox(
                            height: 15.0,
                          ),
                          const CardSetting(),
                          const ButtonLogout(),
                        ],
                      ),
                    ),
                    Positioned(
                      left: Get.width / 2.7,
                      top: 5,
                      child: Obx(() => Container(
                            height: 100,
                            width: 100,
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
                                        dataUser.value.account?.image ??
                                            controller.dataUserLocal['account']
                                                ['image'],
                                      ),
                                    ),
                            ),
                          )),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
