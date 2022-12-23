import 'package:coffee_order/shared/app_button.dart';
import 'package:coffee_order/shared/app_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../shared/app_container.dart';
import '../controllers/menu_controller.dart';

class MenuView extends GetView<MenuController> {
  const MenuView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: AppButton(
        onTap: controller.onAddMenuButtonPressed,
        child: const Icon(Icons.add),
      ),
      body: Container(
        margin: const EdgeInsets.only(top: kToolbarHeight),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            AppTextField(
              label: 'Search',
              hint: 'Search by name',
              onChanged: controller.onSearchTextChange,
            ),
            const SizedBox(height: 24),
            Expanded(
              child: Obx(
                () => ListView.separated(
                  itemBuilder: (context, index) {
                    final drink = controller.drinkList[index];
                    return AppContainer(
                      onTap: () {
                        controller.onDrinkDetailPressed(drink);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: Row(
                          children: [
                            Text(
                              drink.name,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Expanded(child: Container()),
                            Text(
                              drink.price.moneyFormat,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 16),
                  itemCount: controller.drinkList.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

extension IntExt on int {
  String get moneyFormat {
    final oCcy = NumberFormat("#,##0", "en_US");
    return '${oCcy.format(this)} đ';
  }
}
