import 'package:coffee_order/database/models/order_detail.dart';
import 'package:coffee_order/pages/order/presentation/views/add_minus_widget.dart';
import 'package:coffee_order/shared/app_button.dart';
import 'package:coffee_order/shared/app_textfield.dart';
import 'package:coffee_order/shared/top_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../shared/app_container.dart';
import '../controllers/order_controller.dart';

class OrderView extends GetView<OrderController> {
  static const routeName = '/OrderView';
  const OrderView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopBar(title: 'Add order'),
      body: Container(
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
                    final orderDetail = controller.getOrderDetailByDrink(drink);
                    return AppContainer(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Column(
                          children: [
                            Row(
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
                            const SizedBox(height: 12),
                            AddMinusWidget(
                              orderDetailModel: orderDetail,
                              onQuantityChange: (int quantity) {
                                final detail = orderDetail ??
                                    OrderDetailModel(
                                      quantity: quantity,
                                      drink: drink,
                                    );
                                detail.quantity = quantity;
                                controller.onUpdateOrderDetail(detail);
                              },
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
