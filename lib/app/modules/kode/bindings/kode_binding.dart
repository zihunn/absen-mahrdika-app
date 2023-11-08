import 'package:get/get.dart';

import '../controllers/kode_controller.dart';

class KodeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<KodeController>(
      () => KodeController(),
    );
  }
}
