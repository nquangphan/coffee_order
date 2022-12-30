import 'dart:convert';

import 'package:coffee_order/api/app_api.dart';
import 'package:coffee_order/database/models/drink.dart';
import 'package:coffee_order/repository/menu_repository.dart';
import 'package:get/get.dart';

class MenuServerRepository extends MenuRepository {
  @override
  Future<int> addMenu(DrinkModel drink) async {
    final appAPI = Get.find<AppApi>();
    final response = await appAPI.addMenu(drink);
    return int.tryParse(response) ?? -1;
  }

  @override
  Future<List<DrinkModel>> getMenu() async {
    final appAPI = Get.find<AppApi>();
    final menuListString = await appAPI.getMenu();
    final menuList = (jsonDecode(menuListString) as List)
        .map((e) => DrinkModel.fromJson(e))
        .toList();
    return menuList;
  }

  @override
  Future<void> deleteMenu(DrinkModel drink) {
    // TODO: implement deleteMenu
    throw UnimplementedError();
  }

  @override
  Future<List<DrinkModel>> getMenuByName(String name) {
    // TODO: implement getMenuByName
    throw UnimplementedError();
  }

  @override
  Future<void> updateMenu(DrinkModel drink) {
    final appAPI = Get.find<AppApi>();
    return appAPI.updateMenu(drink);
  }
}
