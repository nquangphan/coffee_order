import 'package:coffee_order/main.dart';
import 'package:coffee_order/repository/menu_local_repository.dart';
import 'package:coffee_order/repository/menu_server_repository.dart';
import 'package:get/get.dart';

import '../presentation/controllers/menu_detail_controller.dart';

class MenuDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<MenuDetailController>(MenuDetailController(
      menuRepository: app_type == 'online'
          ? MenuServerRepository()
          : MenuLocalRepository(Get.find()),
    ));
  }
}
