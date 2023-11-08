import 'package:absensi_mahardika/app/modules/home/controllers/home_controller.dart';
import 'package:get/get.dart';

import '../controllers/navigation_bar_controller.dart';

class NavigationBarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NavigationBarController>(
      () => NavigationBarController(),
    );

  }
}
