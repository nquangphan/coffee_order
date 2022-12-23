import 'package:coffee_order/shared/app_textfield.dart';
import 'package:coffee_order/shared/top_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';

import '../../../../shared/app_container.dart';
import '../controllers/menu_detail_controller.dart';

class MenuDetailView extends GetView<MenuDetailController> {
  static const routeName = '/MenuDetailView';
  const MenuDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          TopBar(title: controller.drink != null ? 'Update menu' : 'Add menu'),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16.0),
        height: 100,
        child: AppContainer(
          onTap: controller.onSaveButtonPressed,
          child: const Center(
            child: Text(
              'Save',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: AppContainer(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 32),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AppTextField(
                  label: 'Name',
                  hint: 'Drink name',
                  controller: controller.nameController,
                ),
                AppTextField(
                  label: 'Price',
                  hint: 'Drink price',
                  controller: controller.priceController,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
