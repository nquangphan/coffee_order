import 'package:get/get.dart';

import '../../../../database/hive_database.dart';
import '../../../../database/models/drink.dart';

class MenuController extends GetxController {
  RxList<DrinkModel> drinkList = <DrinkModel>[].obs;
  MenuController({
    required this.database,
  });

  final HiveDatabase database;

  @override
  void onInit() {
    super.onInit();
    getMenu();
  }

  void getMenu() {
    drinkList.value = database.drinkBox.values.toList();
  }
}
