import 'package:coffee_order/repository/menu_local_repository.dart';
import 'package:get/get.dart';

import '../presentation/controllers/menu_controller.dart';

class MenuBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<MenuController>(MenuController(
      menuRepository: MenuLocalRepository(Get.find()),
    ));
  }
}
