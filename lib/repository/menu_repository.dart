import 'package:coffee_order/database/models/drink.dart';

abstract class MenuRepository {
  Future<int> addMenu(DrinkModel drink);
  void updateMenu(DrinkModel drink);
  void deleteMenu(DrinkModel drink);
  List<DrinkModel> getMenu();
  List<DrinkModel> getMenuByName(String name);
}
