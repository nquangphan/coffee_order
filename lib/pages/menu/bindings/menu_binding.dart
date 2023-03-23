import 'package:coffee_order/main.dart';
import 'package:coffee_order/repository/menu_local_repository.dart';
import 'package:coffee_order/repository/menu_server_repository.dart';
import 'package:get/get.dart';

import '../presentation/controllers/menu_controller.dart';

class MenuBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AppMenuController>(AppMenuController(
      menuRepository: app_type == 'online'
          ? MenuServerRepository()
          : MenuLocalRepository(Get.find()),
    ));
  }
}
