import 'package:coffee_order/pages/menu/presentation/views/menu_view.dart';
import 'package:coffee_order/pages/order/presentation/views/add_minus_widget.dart';
import 'package:coffee_order/shared/app_button.dart';
import 'package:coffee_order/shared/top_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';

import '../../../../shared/app_container.dart';
import '../controllers/table_detail_controller.dart';

class TableDetailView extends GetView<TableDetailController> {
  static const routeName = '/TableDetailView';
  const TableDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(title: controller.tableModel.name),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16.0),
        height: 200,
        child: AppContainer(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Total drinks:',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Obx(() => Text(
                        controller.totalDrink.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.amber[800],
                        ),
                      )),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Total price:',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Obx(() => Text(
                        controller.currentOrder.value?.totalPrice.moneyFormat ??
                            '',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.green,
                        ),
                      )),
                ],
              ),
              Obx(
                () => AppButton(
                  boxShape:
                      NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
                  onTap: controller.currentOrder.value?.id != -1
                      ? controller.onPayButtonPressed
                      : () {},
                  child: const Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        'Pay',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: AppButton(
        onTap: controller.onAddOrderDetailButtonPressed,
        child: const Icon(Icons.add),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: AppContainer(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Obx(
              () => ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final orderDetail =
                      controller.currentOrder.value!.details[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: AppContainer(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            children: [
                              Text(
                                orderDetail.drink.name,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Expanded(child: Container()),
                              Text(
                                (orderDetail.drink.price * orderDetail.quantity)
                                    .moneyFormat,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.amber[800],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          AddMinusWidget(
                            orderDetailModel: orderDetail,
                            onQuantityChange: (int quantity) {
                              orderDetail.quantity = quantity;
                              controller.onUpdateOrderDetail(orderDetail);
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 16),
                itemCount: controller.currentOrder.value?.details.length ?? 0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
