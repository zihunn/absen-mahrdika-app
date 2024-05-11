import 'package:get/get.dart';

import '../controllers/navigations_dosen_controller.dart';

class NavigationsDosenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NavigationsDosenController>(
      () => NavigationsDosenController(),
    );
  }
}
