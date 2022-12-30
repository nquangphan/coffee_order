import 'package:coffee_order/database/models/order.dart';
import 'package:coffee_order/database/models/order_detail.dart';
import 'package:coffee_order/pages/menu_detail/presentation/views/menu_detail_view.dart';
import 'package:coffee_order/repository/menu_repository.dart';
import 'package:coffee_order/repository/order_repository.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../../../../database/models/drink.dart';

class OrderController extends GetxController {
  RxList<DrinkModel> drinkList = <DrinkModel>[].obs;
  OrderController(
      {required this.orderRepository, required this.menuRepository});

  final MenuRepository menuRepository;
  final OrderRepository orderRepository;

  late Rx<OrderModel> currentOrder;

  @override
  void onInit() {
    super.onInit();
    currentOrder = (Get.arguments as OrderModel).obs;
    getMenu();
  }

  OrderDetailModel? getOrderDetailByDrink(DrinkModel drink) {
    return currentOrder.value.details
        .firstWhereOrNull((element) => element.drink.id == drink.id);
  }

  Future<void> getMenu() async {
    drinkList.value = await menuRepository.getMenu();
  }

  Future<void> onSearchTextChange(String value) async {
    drinkList.value = await menuRepository.getMenuByName(value);
  }

  onAddMenuButtonPressed() async {
    await Get.toNamed(MenuDetailView.routeName);
    getMenu();
  }

  Future<void> onUpdateOrderDetail(OrderDetailModel detail) async {
    EasyLoading.show();
    final detailFound = getOrderDetailByDrink(detail.drink);
    if (detailFound == null) {
      currentOrder.value.details.add(detail);
    } else {
      detailFound.merge(orderDetail: detail);
    }
    caculeteTotalPrice();
    if (currentOrder.value.id == -1) {
      final orderId = await orderRepository.createOrder(currentOrder.value);
      currentOrder.value.id = orderId;
      currentOrder.refresh();
    } else {
      await orderRepository.updateOrder(currentOrder.value);
    }
    EasyLoading.dismiss();
  }

  void caculeteTotalPrice() {
    var totalPrice = 0;
    for (var element in currentOrder.value.details) {
      totalPrice += (element.quantity * element.drink.price);
    }
    currentOrder.value.totalPrice = totalPrice;
  }
}
