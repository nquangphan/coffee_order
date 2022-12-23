import 'package:coffee_order/repository/menu_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../database/models/drink.dart';

class MenuDetailController extends GetxController {
  late TextEditingController nameController;
  late TextEditingController priceController;
  MenuDetailController({required this.menuRepository});

  DrinkModel? drink = Get.arguments;

  final MenuRepository menuRepository;

  @override
  void onInit() {
    super.onInit();
    nameController = TextEditingController(text: drink?.name);
    priceController = TextEditingController(
        text: drink != null ? drink?.price.toString() : '');
  }

  onSaveButtonPressed() async {
    if (drink != null) {
      final newDrink = DrinkModel(
        name: nameController.text,
        price: int.tryParse(priceController.text) ?? 0,
        image: 'image',
      );
      drink!.merge(drink: newDrink);
      menuRepository.updateMenu(drink!);
    } else {
      final newDrink = DrinkModel(
        name: nameController.text,
        price: int.tryParse(priceController.text) ?? 0,
        image: 'image',
      );

      await menuRepository.addMenu(newDrink);
    }
    Get.back();
  }

 
}
