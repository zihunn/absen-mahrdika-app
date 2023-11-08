import 'package:get/get.dart';

import '../controllers/history_absen_controller.dart';

class HistoryAbsenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HistoryAbsenController>(
      () => HistoryAbsenController(),
    );
  }
}
