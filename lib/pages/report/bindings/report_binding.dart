import 'package:coffee_order/repository/menu_local_repository.dart';
import 'package:coffee_order/repository/order_local_repository.dart';
import 'package:get/get.dart';

import '../presentation/controllers/report_controller.dart';

class ReportBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ReportController>(ReportController(
      orderRepository: OrderLocalRepository(Get.find()),
    ));
  }
}
