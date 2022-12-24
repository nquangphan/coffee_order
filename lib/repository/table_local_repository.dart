import 'package:coffee_order/database/hive_database.dart';
import 'package:coffee_order/database/models/drink.dart';
import 'package:coffee_order/database/models/table.dart';
import 'package:coffee_order/repository/menu_repository.dart';
import 'package:coffee_order/repository/table_repository.dart';

class TableLocalRepository extends TableRepository {
  final HiveDatabase db;

  TableLocalRepository(this.db);
  @override
  Future<int> addTable(TableModel table) async {
    final key = await db.tableBox.add(table);
    table.id = table.key;
    table.save();
    return key;
  }

  @override
  void deleteTable(TableModel table) {
    final found = db.tableBox.get(table.id);
    if (found == null) {
      throw ('table not found');
    }
    db.tableBox.delete(found);
  }

  @override
  List<TableModel> getTable() {
    return db.tableBox.values.toList();
  }

  @override
  List<TableModel> getTableByName(String name) {
    return db.tableBox.values
        .where(
          (element) => element.name.toLowerCase().contains(
                name.toLowerCase(),
              ),
        )
        .toList();
  }

  @override
  void updateTable(TableModel table) {
    var found = db.tableBox.get(table.id);
    if (found == null) {
      throw ('table not found');
    }
    found = found.merge(table: table);
    found.save();
  }
}
