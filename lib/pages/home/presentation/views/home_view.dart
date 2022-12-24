import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';

import '../../../../shared/app_container.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          body: Padding(
            padding: const EdgeInsets.only(top: kToolbarHeight),
            child: Center(
              child: SingleChildScrollView(
                child: Wrap(
                  children: List.generate(
                    controller.tableList.length,
                    (index) {
                      final table = controller.tableList[index];
                      final tableUISize = (Get.size.width - 16 * 5) / 5;
                      return Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: AppContainer(
                          onTap: () => controller.onTablePressed(table),
                          child: SizedBox(
                            width: tableUISize,
                            height: tableUISize,
                            child: Center(
                              child: Text(
                                table.name,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: table.status == 1
                                      ? Colors.amber[800]
                                      : null,
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
            ),
          ),
        ));
  }
}
