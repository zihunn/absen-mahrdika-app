import 'package:get/get.dart';

import '../controllers/notifications_dosen_controller.dart';

class NotificationsDosenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NotificationsDosenController>(
      () => NotificationsDosenController(),
    );
  }
}
