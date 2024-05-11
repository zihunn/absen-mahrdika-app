import 'package:get/get.dart';

import '../controllers/khs_controller.dart';

class KhsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<KhsController>(
      () => KhsController(),
    );
  }
}
