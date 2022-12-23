import 'package:coffee_order/repository/menu_local_repository.dart';
import 'package:get/get.dart';

import '../presentation/controllers/menu_detail_controller.dart';

class MenuDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<MenuDetailController>(MenuDetailController(
      menuRepository: MenuLocalRepository(Get.find()),
    ));
  }
}
