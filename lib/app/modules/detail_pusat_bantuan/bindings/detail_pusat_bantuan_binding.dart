import 'package:get/get.dart';

import '../controllers/detail_pusat_bantuan_controller.dart';

class DetailPusatBantuanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailPusatBantuanController>(
      () => DetailPusatBantuanController(),
    );
  }
}
