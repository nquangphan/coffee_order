import 'package:coffee_order/repository/menu_local_repository.dart';
import 'package:get/get.dart';

import '../../home/presentation/controllers/home_controller.dart';
import '../../menu/presentation/controllers/menu_controller.dart';
import '../presentation/controllers/dashboard_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<DashboardController>(DashboardController(
      database: Get.find(),
    ));
    Get.put<HomeController>(HomeController(
      database: Get.find(),
    ));
    Get.put<MenuController>(MenuController(
      menuRepository: MenuLocalRepository(Get.find()),
    ));
  }
}
