import 'package:coffee_order/database/models/table.dart';

abstract class TableRepository {
  Future<int> addTable(TableModel table);
  Future<void> updateTable(TableModel table);
  Future<void> deleteTable(TableModel table);
  Future<List<TableModel>> getTable();
  Future<List<TableModel>> getTableByName(String name);
}
