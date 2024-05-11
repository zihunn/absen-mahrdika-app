import 'package:get/get.dart';

import '../controllers/home_dosen_controller.dart';

class HomeDosenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeDosenController>(
      () => HomeDosenController(),
    );
  }
}
