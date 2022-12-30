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

  Future<void> getMenu() async {
    drinkList.value = await menuRepository.getMenu();
  }

  Future<void> onSearchTextChange(String value) async {
    drinkList.value = await menuRepository.getMenuByName(value);
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
