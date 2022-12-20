import 'package:get/get.dart';

import '../presentation/controllers/home_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<HomeController>(HomeController(
      database: Get.find(),
    ));
  }
}
