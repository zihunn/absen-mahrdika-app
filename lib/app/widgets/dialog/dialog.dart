import 'package:absensi_mahardika/app/modules/jadwal_kuliah/controllers/jadwal_kuliah_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class dialogShow {
  final controller = Get.put(JadwalKuliahController());
  void datePicker() async {
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
}
