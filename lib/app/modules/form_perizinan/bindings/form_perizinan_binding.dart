import 'package:get/get.dart';

import '../controllers/form_perizinan_controller.dart';

class FormPerizinanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FormPerizinanController>(
      () => FormPerizinanController(),
    );
  }
}
