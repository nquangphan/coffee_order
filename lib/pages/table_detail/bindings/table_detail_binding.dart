import 'package:coffee_order/main.dart';
import 'package:coffee_order/repository/order_local_repository.dart';
import 'package:coffee_order/repository/order_server_repository.dart';
import 'package:get/get.dart';

import '../presentation/controllers/table_detail_controller.dart';

class TableDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<TableDetailController>(TableDetailController(
      orderRepository: app_type == 'online'
          ? OrderServerRepository()
          : OrderLocalRepository(Get.find()),
    ));
  }
}
