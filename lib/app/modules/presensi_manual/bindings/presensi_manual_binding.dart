import 'package:get/get.dart';

import '../controllers/presensi_manual_controller.dart';

class PresensiManualBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PresensiManualController>(
      () => PresensiManualController(),
    );
  }
}
