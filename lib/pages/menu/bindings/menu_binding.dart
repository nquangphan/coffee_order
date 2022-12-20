import 'package:get/get.dart';

import '../presentation/controllers/menu_controller.dart';

class MenuBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<MenuController>(MenuController(
      database: Get.find(),
    ));
  }
}
