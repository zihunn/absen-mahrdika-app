import 'package:absensi_mahardika/app/modules/home-dosen/controllers/home_dosen_controller.dart';
import 'package:absensi_mahardika/app/utils/color.dart';
import 'package:absensi_mahardika/app/utils/network.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../utils/date_utils.dart';
import '../custom_shape/custom_shape.dart';

Widget hrizontalCapsuleListView() {
  final ctrl = Get.put(HomeDosenController());
  return ScrollablePositionedList.builder(
    initialScrollIndex: ctrl.currentDateTime.value.day - 1,
    scrollDirection: Axis.horizontal,
    physics: const BouncingScrollPhysics(),
    shrinkWrap: true,
    itemCount: ctrl.currentMonthList.length,
    itemBuilder: (BuildContext context, int index) {
      return capsuleView(index);
    },
  );
}

Widget capsuleView(int index) {
  final ctrl = Get.put(HomeDosenController());

  return Obx(
    () => GestureDetector(
      onTap: () {
        ctrl.currentDateTime.value = ctrl.currentMonthList[index];

        Map<String, dynamic> requestParams = {
          'dosen_id': dataUser.value.account?.dosenId ??
              dataUserLocal['account']['dosen_id'],
          'date': ctrl.currentDateTime.value.toString().split(' ').first
        };
        ctrl.getJadwalDosen(requestParams);
        print(requestParams);
      },
      child: Container(
        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
        margin: const EdgeInsets.only(left: 10),
        width: Get.width / 7,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(12.0),
          ),
          color: Colors.white,
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                (ctrl.currentMonthList[index].day ==
                        ctrl.currentDateTime.value.day)
                    ? curveShape(
                        AppColor.bluePrimary,
                        const Color(0xffD1F2FB),
                      )
                    : const SizedBox(),
                Text(
                  DateUtil.weekdays[ctrl.currentMonthList[index].weekday - 1],
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
                CircleAvatar(
                  backgroundColor: (ctrl.currentMonthList[index].day !=
                          ctrl.currentDateTime.value.day)
                      ? Colors.white
                      : Colors.blue,
                  radius: 15,
                  child: Text(
                    ctrl.currentMonthList[index].day.toString(),
                    style: TextStyle(
                      color: (ctrl.currentMonthList[index].day !=
                              ctrl.currentDateTime.value.day)
                          ? Colors.grey
                          : Colors.white,
                    ),
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

Widget curveShape(Color lineColor, shadow) {
  return SizedBox(
    height: Get.height / 60,
    width: 35,
    child: Stack(
      children: [
        Positioned(
          right: 4,
          top: -20,
          child: Container(
            height: Get.height / 25,
            width: Get.width / 13,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(13.0),
              ),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                // stops: [0, 70],
                colors: [
                  // Color.fromARGB(73, 252, 228, 237),
                  // Color(0xffD1F2FB),
                  shadow,
                  shadow,
                  shadow,
                  shadow,
                  shadow,

                  Colors.white
                ],
              ),
            ),
          ),
        ),
        Positioned(
          left: -45,
          child: ClipPath(
            clipper: Customshape(),
            child: Container(
              height: 30,
              width: Get.width,
              decoration: BoxDecoration(
                color: lineColor,
              ),
              child: const Center(
                  child: Text(
                "",
                style: TextStyle(fontSize: 20, color: Colors.white),
              )),
            ),
          ),
        ),
      ],
    ),
  );
}
