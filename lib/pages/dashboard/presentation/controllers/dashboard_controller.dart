import 'package:coffee_order/pages/report/presentation/controllers/report_controller.dart';
import 'package:coffee_order/pages/report/presentation/views/report_view.dart';
import 'package:coffee_order/repository/order_local_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../database/hive_database.dart';
import '../../../home/presentation/views/home_view.dart';
import '../../../menu/presentation/views/menu_view.dart';

class DashboardController extends GetxController {
  DashboardController({
    required this.database,
  });
  final HiveDatabase database;

  final selectedIndex = 0.obs;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  List<Widget> widgetOptions = <Widget>[
    const HomeView(),
    const MenuView(),
    const ReportView(),
  ];

  void onItemTapped(int index) {
    selectedIndex.value = index;
    if (index == 2) {
      final ReportController reportController = Get.find();
      reportController.refreshData();
    }
  }
}
