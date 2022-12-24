import 'package:coffee_order/database/models/table.dart';

abstract class TableRepository{
  Future<int> addTable(TableModel table);
  void updateTable(TableModel table);
  void deleteTable(TableModel table);
  List<TableModel> getTable();
  List<TableModel> getTableByName(String name);
}