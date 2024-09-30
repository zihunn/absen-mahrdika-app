import 'package:get/get.dart';

import '../controllers/mk_perizinan_controller.dart';

class MkPerizinanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MkPerizinanController>(
      () => MkPerizinanController(),
    );
  }
}
