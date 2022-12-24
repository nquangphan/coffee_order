import 'package:coffee_order/pages/table_detail/presentation/views/table_detail_view.dart';
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
    tableList.refresh();
  }

  onTablePressed(TableModel table) async {
    await Get.toNamed(TableDetailView.routeName, arguments: table);
    getTableList();
  }
}
