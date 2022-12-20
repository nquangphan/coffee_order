import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';

import '../../../../shared/app_container.dart';
import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => Center(
            child: controller.widgetOptions
                .elementAt(controller.selectedIndex.value),
          )),
      bottomNavigationBar: Obx(
        () => Padding(
          padding: const EdgeInsets.only(top: 12),
          child: BottomNavigationBar(
            unselectedFontSize: 16,
            selectedFontSize: 18,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: AppContainer(
                  child: Icon(Icons.home, size: 32),
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: AppContainer(
                  child: Icon(Icons.coffee, size: 32),
                ),
                label: 'Menu',
              ),
              BottomNavigationBarItem(
                icon: AppContainer(
                  child: Icon(Icons.leaderboard, size: 32),
                ),
                label: 'Report',
              ),
            ],
            currentIndex: controller.selectedIndex.value,
            selectedItemColor: Colors.amber[800],
            onTap: controller.onItemTapped,
          ),
        ),
      ),
    );
  }
}
