import 'package:coffee_order/database/models/order.dart';
import 'package:coffee_order/database/models/order_detail.dart';
import 'package:coffee_order/pages/menu_detail/presentation/views/menu_detail_view.dart';
import 'package:coffee_order/repository/menu_repository.dart';
import 'package:coffee_order/repository/order_repository.dart';
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

  void getMenu() {
    drinkList.value = menuRepository.getMenu();
  }

  void onSearchTextChange(String value) {
    drinkList.value = menuRepository.getMenuByName(value);
  }

  
  onAddMenuButtonPressed() async {
    await Get.toNamed(MenuDetailView.routeName);
    getMenu();
  }

  void onUpdateOrderDetail(OrderDetailModel detail) {
    final detailFound = getOrderDetailByDrink(detail.drink);
    if (detailFound == null) {
      currentOrder.value.details.add(detail);
    } else {
      detailFound.merge(orderDetail: detail);
    }
    caculeteTotalPrice();
    if (currentOrder.value.id == -1) {
      orderRepository.createOrder(currentOrder.value);
    } else {
      orderRepository.updateOrder(currentOrder.value);
    }
  }

  void caculeteTotalPrice() {
    var totalPrice = 0;
    for (var element in currentOrder.value.details) {
      totalPrice += (element.quantity * element.drink.price);
    }
    currentOrder.value.totalPrice = totalPrice;
  }
}
