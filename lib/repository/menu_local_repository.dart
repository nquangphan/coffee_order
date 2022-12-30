import 'package:coffee_order/database/hive_database.dart';
import 'package:coffee_order/database/models/drink.dart';
import 'package:coffee_order/repository/menu_repository.dart';

class MenuLocalRepository extends MenuRepository {
  final HiveDatabase db;

  MenuLocalRepository(this.db);
  @override
  Future<int> addMenu(DrinkModel drink) async {
    final key = await db.drinkBox.add(drink);
    drink.id = drink.key;
    drink.save();
    return key;
  }

  @override
  Future<void> deleteMenu(DrinkModel drink) async {
    final found = db.drinkBox.get(drink.id);
    if (found == null) {
      throw ('Drink not found');
    }
    db.drinkBox.delete(found);
  }

  @override
  Future<List<DrinkModel>> getMenu() {
    return Future.value(db.drinkBox.values.toList());
  }

  @override
  Future<List<DrinkModel>> getMenuByName(String name) {
    return Future.value(db.drinkBox.values
        .where(
          (element) => element.name.toLowerCase().contains(
                name.toLowerCase(),
              ),
        )
        .toList());
  }

  @override
  Future<void> updateMenu(DrinkModel drink) async {
    var found = db.drinkBox.get(drink.id);
    if (found == null) {
      throw ('Drink not found');
    }
    found = found.merge(drink: drink);
    found.save();
  }
}
