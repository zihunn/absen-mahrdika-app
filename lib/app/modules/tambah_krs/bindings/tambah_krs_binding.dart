import 'package:get/get.dart';

import '../controllers/tambah_krs_controller.dart';

class TambahKrsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TambahKrsController>(
      () => TambahKrsController(),
    );
  }
}
