import 'package:get/get.dart';

import '../controllers/jadwal_kuliah_controller.dart';

class JadwalKuliahBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<JadwalKuliahController>(
      () => JadwalKuliahController(),
    );
  }
}
