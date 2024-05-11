import 'package:get/get.dart';

import '../controllers/tambah_dosen_controller.dart';

class TambahDosenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TambahDosenController>(
      () => TambahDosenController(),
    );
  }
}
