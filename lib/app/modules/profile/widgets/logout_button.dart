import 'package:absensi_mahardika/app/modules/profile/controllers/profile_controller.dart';
import 'package:absensi_mahardika/app/utils/color.dart';
import 'package:absensi_mahardika/app/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/network.dart';

class ButtonLogout extends StatelessWidget {
  const ButtonLogout({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());
    return GestureDetector(
      onTap: () => controller.logout(token),
      child: Container(
        clipBehavior: Clip.antiAlias,
        margin: const EdgeInsets.symmetric(vertical: 20),
        height: Get.height / 12,
        width: Get.width,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: context.theme.shadowColor,
              blurRadius: 5,
              offset: const Offset(2, 3),
            ),
            BoxShadow(
              color: context.theme.shadowColor,
              blurRadius: 5,
              offset: const Offset(-2, -2),
            ),
          ],
          borderRadius: const BorderRadius.all(
            Radius.circular(12.0),
          ),
          color: context.theme.primaryColor,
        ),
        child: SizedBox(
          height: 100.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                alignment: Alignment.centerLeft,
                width: 130.0,
                child: Text(
                  "Logout",
                  style: Style.Header1.copyWith(
                      color: context.theme.textTheme.bodyLarge!.color,
                      fontFamily: 'SignikaSemi'),
                ),
              ),
              SizedBox(
                  width: 100.0,
                  child: Stack(
                    children: [
                      Positioned(
                        right: 0,
                        height: 100.0,
                        child: Container(
                          width: 50,
                          decoration: BoxDecoration(
                            color: AppColor.bluePrimary.withOpacity(0.7),
                          ),
                        ),
                      ),
                      Positioned(
                        left: -25,
                        child: Container(
                          height: 130.0,
                          decoration: const BoxDecoration(),
                          child: Image.asset(
                            'assets/images/Untitled design (73).png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
