import 'package:absensi_mahardika/app/modules/profile/controllers/profile_controller.dart';
import 'package:absensi_mahardika/app/utils/color.dart';
import 'package:absensi_mahardika/app/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardAbsen extends StatelessWidget {
  const CardAbsen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final profileCtrl = Get.put(ProfileController());
    return Material(
      elevation: 3,
      borderRadius: BorderRadius.circular(12),
      color: Colors.grey[100],
      child: Container(
        height: Get.height / 11,
        width: Get.width,
        padding: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 20,
        ),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(12.0),
          ),
          color: AppColor.bluePrimary.withOpacity(0.6),
        ),
        child: Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "hadir".tr,
                    style: Style.Subtitle1.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    profileCtrl.homeCtrl.totalAbsen.value.data?.hadir
                            .toString() ??
                        '-',
                    style: Style.Subtitle1.copyWith(
                      color: AppColor.whiteColor,
                    ),
                  ),
                ],
              ),
              const VerticalDivider(
                width: 0,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "izin".tr,
                    style: Style.Subtitle1.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    profileCtrl.homeCtrl.totalAbsen.value.data?.izin
                            .toString() ??
                        '-',
                    style: Style.Subtitle1.copyWith(
                      color: AppColor.whiteColor,
                    ),
                  ),
                ],
              ),
              const VerticalDivider(
                width: 0,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "sakit".tr,
                    style: Style.Subtitle1.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    profileCtrl.homeCtrl.totalAbsen.value.data?.sakit
                            .toString() ??
                        '-',
                    style: Style.Subtitle1.copyWith(
                      color: AppColor.whiteColor,
                    ),
                  ),
                ],
              ),
              const VerticalDivider(
                width: 0,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "alpa".tr,
                    style: Style.Subtitle1.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    profileCtrl.homeCtrl.totalAbsen.value.data?.alpa
                            .toString() ??
                        '-',
                    style: Style.Subtitle1.copyWith(
                      color: AppColor.whiteColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
