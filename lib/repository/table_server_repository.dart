import 'dart:convert';

import 'package:coffee_order/api/app_api.dart';
import 'package:coffee_order/database/models/table.dart';
import 'package:coffee_order/repository/table_repository.dart';
import 'package:get/get.dart';

class TableServerRepository extends TableRepository {
  @override
  Future<int> addTable(TableModel table) {
    // TODO: implement addTable
    throw UnimplementedError();
  }

  @override
  Future<void> deleteTable(TableModel table) {
    // TODO: implement deleteTable
    throw UnimplementedError();
  }

  @override
  Future<List<TableModel>> getTable() async {
    final appAPI = Get.find<AppApi>();
    final tableListString = await appAPI.getListTable();
    final tableList = (jsonDecode(tableListString) as List)
        .map((e) => TableModel.fromJson(e))
        .toList();
    return tableList;
  }

  @override
  Future<List<TableModel>> getTableByName(String name) {
    // TODO: implement getTableByName
    throw UnimplementedError();
  }

  @override
  Future<void> updateTable(TableModel table) {
    // TODO: implement updateTable
    throw UnimplementedError();
  }
}
