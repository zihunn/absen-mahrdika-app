import 'package:get/get.dart';

import '../controllers/detail_pertemuan_controller.dart';

class DetailPertemuanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailPertemuanController>(
      () => DetailPertemuanController(),
    );
  }
}
