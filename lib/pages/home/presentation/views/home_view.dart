import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';

import '../../../../shared/app_container.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 3,
          crossAxisSpacing: 4.0,
          mainAxisSpacing: 8.0,
          children: List.generate(
            controller.tableList.length,
            (index) {
              final table = controller.tableList[index];
              final tableUISize = (Get.size.width - 16 * 5) / 4;
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: AppContainer(
                  child: SizedBox(
                    width: tableUISize,
                    height: tableUISize,
                    child: Center(
                      child: Text(
                        table.name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
