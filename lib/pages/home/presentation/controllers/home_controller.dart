import 'package:get/get.dart';

import '../../../../database/hive_database.dart';
import '../../../../database/models/table.dart';

class HomeController extends GetxController {
  RxList<TableModel> tableList = <TableModel>[].obs;
  HomeController({
    required this.database,
  });

  final HiveDatabase database;

  @override
  void onInit() {
    super.onInit();
    getTableList();
  }

  void getTableList() {
    tableList.value = database.tableBox.values.toList();
  }
}
