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
    const Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  void onItemTapped(int index) {
    selectedIndex.value = index;
  }
}
