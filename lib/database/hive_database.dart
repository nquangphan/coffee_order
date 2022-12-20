import 'package:hive_flutter/hive_flutter.dart';

import 'models/drink.dart';
import 'models/order.dart';
import 'models/order_detail.dart';
import 'models/table.dart';

class HiveDatabase {
  late final Box<TableModel> tableBox;
  late final Box<DrinkModel> drinkBox;
  late final Box<OrderDetailModel> orderDetailBox;
  late final Box<OrderModel> orderBox;
  final String path;

  HiveDatabase(this.path);

  Future<void> init() async {
    Hive.deleteFromDisk();
    Hive
      ..init(path)
      ..registerAdapter(TableModelAdapter())
      ..registerAdapter(DrinkModelAdapter())
      ..registerAdapter(OrderDetailModelAdapter())
      ..registerAdapter(OrderModelAdapter());
    tableBox = await Hive.openBox(TableModel.hiveKey);
    drinkBox = await Hive.openBox(DrinkModel.hiveKey);
    orderDetailBox = await Hive.openBox(OrderDetailModel.hiveKey);
    orderBox = await Hive.openBox(OrderModel.hiveKey);
    if (tableBox.values.isEmpty) {
      for (int i = 0; i < 40; i++) {
        TableModel table = TableModel(name: 'Bàn ${i + 1}');
        tableBox.add(table);
        table.id = table.key;
        table.save();
      }
    }
    if (drinkBox.values.isEmpty) {
      DrinkModel drink =
          DrinkModel(name: 'name', price: 20000, image: 'image', id: 0);
      drinkBox.add(drink);
    }
  }
}
