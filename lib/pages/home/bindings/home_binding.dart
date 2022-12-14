import 'package:get/get.dart';

import '../data/home_api_provider.dart';
import '../data/home_repository.dart';
import '../presentation/controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  Future<void> dependencies() async {
    Get.lazyPut(() => HomeProvider());
    Get.lazyPut(() => HomeRepository(provider: Get.find()));
    Get.lazyPut(() => HomeController(homeRepository: Get.find()));
  }
}
