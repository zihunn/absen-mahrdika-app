import 'package:get/get.dart';

import '../controllers/room_share_controller.dart';

class RoomShareBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RoomShareController>(
      () => RoomShareController(),
    );
  }
}
