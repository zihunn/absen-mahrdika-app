import 'package:absensi_mahardika/app/modules/jadwal_kuliah/controllers/jadwal_kuliah_controller.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/color.dart';
import '../button/button_confirm.dart';

class dialogShow {
  void datePicker() async {
    final controller = Get.put(JadwalKuliahController());

    final DateTime? pickedDate = await showDatePicker(
      context: Get.context!,
      initialDate: DateTime.now(),
      firstDate: DateTime(2002),
      lastDate: DateTime(2050),
    );
    if (pickedDate != null && pickedDate != controller.selectedDate.value) {
      controller.selectedDate.value = pickedDate;
      print(controller.selectedDate.value);
    }
  }

  void dialog(
      {required BuildContext context,
      required DialogType dialogType,
      required String title,
      required desc,
      required Function onTap}) {
    AwesomeDialog(
      
      context: context,
      dialogType: dialogType,
      animType: AnimType.rightSlide,
      title: title,
      desc: desc,
      descTextStyle: TextStyle(
        fontSize: 15.0,
        wordSpacing: 2,
        color: Colors.grey[400],
        fontFamily: 'Signika',
      ),
      titleTextStyle: const TextStyle(
          fontSize: 18,
          color: AppColor.blackSoftColor,
          fontFamily: 'SignikaSemi'),
      btnCancel: ButtonConfirm(
        onTap: () => Get.back(),
        height: 40,
        width: Get.width / 2,
        widthOutline: 0,
        radius: 16,
        color: Colors.red,
        colorOutline: Colors.white,
        isOutline: false,
        widget: const Text('Cancel'),
      ),
      btnOk: ButtonConfirm(
        onTap: () => onTap(),
        height: 40,
        width: Get.width / 2,
        widthOutline: 0,
        radius: 16,
        color: AppColor.greenColor,
        colorOutline: Colors.white,
        isOutline: false,
        widget: const Text('Oke'),
      ),
    ).show();
  }
}
