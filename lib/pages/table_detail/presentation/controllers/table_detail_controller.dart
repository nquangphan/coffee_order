import 'package:coffee_order/database/models/order.dart';
import 'package:coffee_order/database/models/order_detail.dart';
import 'package:coffee_order/database/models/table.dart';
import 'package:coffee_order/pages/dashboard/presentation/views/dashboard_view.dart';
import 'package:coffee_order/pages/order/presentation/views/order_view.dart';
import 'package:coffee_order/repository/order_repository.dart';
import 'package:coffee_order/shared/app_button.dart';
import 'package:coffee_order/shared/app_container.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';

class TableDetailController extends GetxController {
  late TextEditingController nameController;
  late TextEditingController priceController;
  TableDetailController({required this.orderRepository});

  final OrderRepository orderRepository;

  final TableModel tableModel = Get.arguments as TableModel;

  late final Rx<OrderModel?> currentOrder = Rx<OrderModel?>(null);

  @override
  void onInit() {
    super.onInit();
    getCurrentOrder();
  }

  void getCurrentOrder() {
    currentOrder.value = orderRepository.getOrderByTableId(tableModel.id) ??
        OrderModel(
          totalPrice: 0,
          details: [],
          table: tableModel,
          createDate: DateTime.now(),
          // DateTime(DateTime.now().year, DateTime.now().month,
          //     DateTime.now().day - 2),
        );
    currentOrder.refresh();
  }

  onPayButtonPressed() {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Total drinks:',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Obx(() => Text(
                      currentOrder.value?.details.length.toString() ?? '',
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
                      currentOrder.value?.totalPrice.moneyFormat ?? '',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.green,
                      ),
                    )),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: AppContainer(
                      onTap: Get.back,
                      child: const Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(
                            'Cancel',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: AppButton(
                      boxShape: NeumorphicBoxShape.roundRect(
                          BorderRadius.circular(12)),
                      onTap: () {
                        if (currentOrder.value != null) {
                          caculeteTotalPrice();
                          currentOrder.value!.status = 1;
                          orderRepository.updateOrder(currentOrder.value!);
                        }
                        Get.until((route) =>
                            route.settings.name == DashboardView.routeName);
                      },
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
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  onAddOrderDetailButtonPressed() async {
    await Get.toNamed(OrderView.routeName, arguments: currentOrder.value);
    getCurrentOrder();
  }

  void onUpdateOrderDetail(OrderDetailModel detail) {
    if (currentOrder.value != null) {
      int totalPrice = caculeteTotalPrice();
      if (totalPrice == 0) {
        currentOrder.value?.details = [];
      }
      orderRepository.updateOrder(currentOrder.value!);
      currentOrder.refresh();
    }
  }

  int caculeteTotalPrice() {
    var totalPrice = 0;
    for (var element in currentOrder.value!.details) {
      totalPrice += (element.quantity * element.drink.price);
    }
    currentOrder.value!.totalPrice = totalPrice;
    return totalPrice;
  }
}
