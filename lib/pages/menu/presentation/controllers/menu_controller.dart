import 'package:coffee_order/pages/menu_detail/presentation/views/menu_detail_view.dart';
import 'package:coffee_order/repository/menu_repository.dart';
import 'package:get/get.dart';

import '../../../../database/models/drink.dart';

class MenuController extends GetxController {
  RxList<DrinkModel> drinkList = <DrinkModel>[].obs;
  MenuController({required this.menuRepository});

  final MenuRepository menuRepository;

  @override
  void onInit() {
    super.onInit();
    getMenu();
  }

  void getMenu() {
    drinkList.value = menuRepository.getMenu();
  }

  void onSearchTextChange(String value) {
    drinkList.value = menuRepository.getMenuByName(value);
  }

  Future<void> onDrinkDetailPressed(DrinkModel drink) async {
    await Get.toNamed(MenuDetailView.routeName, arguments: drink);
    getMenu();
  }

  onAddMenuButtonPressed() async {
    await Get.toNamed(MenuDetailView.routeName);
    getMenu();
  }
}
