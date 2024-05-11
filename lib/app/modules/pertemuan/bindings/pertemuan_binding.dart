import 'package:get/get.dart';

import '../controllers/pertemuan_controller.dart';

class PertemuanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PertemuanController>(
      () => PertemuanController(),
    );
  }
}
