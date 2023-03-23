import 'package:coffee_order/main.dart';
import 'package:coffee_order/pages/report/presentation/controllers/report_controller.dart';
import 'package:coffee_order/repository/menu_local_repository.dart';
import 'package:coffee_order/repository/menu_server_repository.dart';
import 'package:coffee_order/repository/order_local_repository.dart';
import 'package:coffee_order/repository/order_server_repository.dart';
import 'package:coffee_order/repository/table_local_repository.dart';
import 'package:coffee_order/repository/table_server_repository.dart';
import 'package:get/get.dart';

import '../../home/presentation/controllers/home_controller.dart';
import '../../menu/presentation/controllers/menu_controller.dart';
import '../presentation/controllers/dashboard_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<DashboardController>(DashboardController());
    Get.put<HomeController>(HomeController(
      tableRepository: app_type == 'online'
          ? TableServerRepository()
          : TableLocalRepository(Get.find()),
    ));
    Get.put<AppMenuController>(AppMenuController(
      menuRepository: app_type == 'online'
          ? MenuServerRepository()
          : MenuLocalRepository(Get.find()),
    ));
    Get.put<ReportController>(ReportController(
      orderRepository: app_type == 'online'
          ? OrderServerRepository()
          : OrderLocalRepository(Get.find()),
    ));
  }
}
