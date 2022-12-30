import 'package:coffee_order/main.dart';
import 'package:coffee_order/repository/table_local_repository.dart';
import 'package:coffee_order/repository/table_server_repository.dart';
import 'package:get/get.dart';

import '../presentation/controllers/home_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<HomeController>(HomeController(
      tableRepository: app_type == 'online'
          ? TableServerRepository()
          : TableLocalRepository(Get.find()),
    ));
  }
}
