// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../modules/detail_pertemuan/controllers/detail_pertemuan_controller.dart';
import '../../modules/presensi_manual/views/presensi_manual_view.dart';
import '../../utils/bottomsheet.dart';
import '../../utils/color.dart';

class ButtonQrAndPreseni extends StatelessWidget {
  final List dataMk;
  const ButtonQrAndPreseni({
    Key? key,
    required this.dataMk,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(DetailPertemuanController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 20),
          width: Get.width / 2.5,
          height: Get.height / 18,
          decoration: BoxDecoration(
            color: AppColor.blueColor.withOpacity(0.1),
            borderRadius: const BorderRadius.all(
              Radius.circular(8.0),
            ),
          ),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: const Color.fromARGB(255, 199, 229, 244),
              side: const BorderSide(
                color: AppColor.blueColor2,
                width: 1.2,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () => QrCodeBottomsheet(
              context,
              DetailPertemuanController(),
              dataMk[1],
              dataMk[0],
              dataMk[2],
              dataMk[3],
            ),
            child: Row(
              children: [
                Image.asset(
                  "assets/icons/qrcode.png",
                  width: Get.width / 13,
                  height: Get.height / 13,
                ),
                const SizedBox(
                  width: 5.0,
                ),
                const Text(
                  "Buat QrCode",
                  style: TextStyle(
                    fontFamily: 'SignikaSemi',
                    fontSize: 14.0,
                    color: AppColor.blackSoftColor,
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 20),
          width: Get.width / 2.5,
          height: Get.height / 18,
          decoration: BoxDecoration(
            color: AppColor.blueColor.withOpacity(0.1),
            borderRadius: const BorderRadius.all(
              Radius.circular(8.0),
            ),
          ),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: const Color.fromARGB(255, 199, 229, 244),
              side: const BorderSide(
                color: AppColor.blueColor2,
                width: 1.2,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () {
              Get.to(() => const PresensiManualView(),
                  transition: Transition.rightToLeft, arguments: dataMk,);
            },
            child: Row(
              children: [
                Image.asset(
                  "assets/icons/notes.png",
                  width: 30.0,
                  height: 25.0,
                ),
                const SizedBox(
                  width: 5.0,
                ),
                const Text(
                  "Presensi",
                  style: TextStyle(
                    fontFamily: 'SignikaSemi',
                    fontSize: 15.0,
                    color: AppColor.blackSoftColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
