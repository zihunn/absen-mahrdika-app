import 'package:get/get.dart';

import '../controllers/settings_dosen_controller.dart';

class SettingsDosenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SettingsDosenController>(
      () => SettingsDosenController(),
    );
  }
}
