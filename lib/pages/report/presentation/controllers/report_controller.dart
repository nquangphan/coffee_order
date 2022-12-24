import 'package:coffee_order/database/models/order.dart';
import 'package:coffee_order/repository/order_repository.dart';
import 'package:get/get.dart';

import '../../../../database/models/drink.dart';

class ReportController extends GetxController {
  RxList<DrinkModel> drinkList = <DrinkModel>[].obs;
  ReportController({required this.orderRepository});
  RxList<OrderModel> todayOrder = RxList.empty();
  Rx<Map<DateTime, List<OrderModel>>> reportMap = Rx({});
  final OrderRepository orderRepository;

  @override
  void onInit() {
    super.onInit();
    getTodayReport();
    getSevenDayOrder();
  }

  void refreshData() {
    getTodayReport();
    getSevenDayOrder();
  }

  void getTodayReport() {
    todayOrder.value = getReportByDate(DateTime.now());
  }

  List<OrderModel> getReportByDate(DateTime date) {
    return orderRepository.getOrderByDate(date);
  }

  void getSevenDayOrder() {
    for (int i = 0; i < 7; i++) {
      final today = DateTime.now();
      final reportDay = DateTime(today.year, today.month, today.day - i);
      final orders = getReportByDate(reportDay);
      reportMap.value.addAll(
        {
          reportDay: orders,
        },
      );
    }
    todayOrder.refresh();
  }

  List<OrderModel> getReportByDateInList(
      DateTime date, List<OrderModel> order) {
    return order
        .where((element) =>
            element.createDate.day == date.day &&
            element.createDate.month == date.month &&
            element.createDate.year == date.year)
        .toList();
  }

  int get sevenDayRevenue {
    int revenue = 0;
    reportMap.value.entries.toList().forEach((element) {
      element.value.forEach((e) {
        revenue += e.totalPrice;
      });
    });
    return revenue;
  }

  int get todayRevenue {
    int revenue = 0;
    for (var element in todayOrder) {
      revenue += (element.totalPrice);
    }
    return revenue;
  }
}
