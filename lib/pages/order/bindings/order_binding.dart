import 'package:coffee_order/main.dart';
import 'package:coffee_order/repository/menu_local_repository.dart';
import 'package:coffee_order/repository/menu_server_repository.dart';
import 'package:coffee_order/repository/order_local_repository.dart';
import 'package:coffee_order/repository/order_server_repository.dart';
import 'package:get/get.dart';

import '../presentation/controllers/order_controller.dart';

class OrderBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<OrderController>(OrderController(
      orderRepository: app_type == 'online'
          ? OrderServerRepository()
          : OrderLocalRepository(Get.find()),
      menuRepository: app_type == 'online'
          ? MenuServerRepository()
          : MenuLocalRepository(Get.find()),
    ));
  }
}
