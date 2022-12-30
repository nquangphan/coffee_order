import 'package:coffee_order/database/models/drink.dart';

abstract class MenuRepository {
  Future<int> addMenu(DrinkModel drink);
  Future<void> updateMenu(DrinkModel drink);
  Future<void> deleteMenu(DrinkModel drink);
  Future<List<DrinkModel>> getMenu();
  Future<List<DrinkModel>> getMenuByName(String name);
}
