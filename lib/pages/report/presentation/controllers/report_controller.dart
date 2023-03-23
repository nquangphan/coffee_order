import 'dart:convert';

import 'package:coffee_order/api/app_api.dart';
import 'package:coffee_order/api/response_interceptor.dart';
import 'package:coffee_order/database/models/order.dart';
import 'package:coffee_order/database/models/table.dart';
import 'package:coffee_order/repository/order_repository.dart';
import 'package:coffee_order/shared/common_bottom_sheet.dart';
import 'package:dio/dio.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../database/models/drink.dart';

class ReportController extends GetxController {
  RxList<DrinkModel> drinkList = <DrinkModel>[].obs;
  ReportController({required this.orderRepository});
  RxList<OrderModel> todayOrder = RxList.empty();
  Rx<Map<DateTime, List<OrderModel>>> reportMap = Rx({});
  final OrderRepository orderRepository;
  late final TextEditingController serverIPController;
  final sharePref = Get.find<SharedPreferences>();
  @override
  void onInit() {
    super.onInit();
    serverIPController =
        TextEditingController(text: sharePref.getString('server_ip'));
    getTodayReport();
    getSevenDayOrder();
  }

  void refreshData() {
    getTodayReport();
    getSevenDayOrder();
  }

  Future<void> getTodayReport() async {
    todayOrder.value = await getReportByDate(DateTime.now());
    todayOrder.refresh();
  }

  Future<List<OrderModel>> getReportByDate(DateTime date) async {
    return await orderRepository.getOrderByDate(date);
  }

  Future<void> getSevenDayOrder() async {
    for (int i = 0; i < 7; i++) {
      final today = DateTime.now();
      final reportDay = DateTime(today.year, today.month, today.day - i);
      final orders = await getReportByDate(reportDay);
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
      for (var e in element.value) {
        revenue += e.totalPrice;
      }
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

  onSaveServerIPPressed() async {
    final options = BaseOptions(
      responseType: ResponseType.json,
      validateStatus: (status) {
        return true;
      },
      headers: {'Accept': 'application/json'},
      baseUrl: 'http://${serverIPController.text}:8080',
      receiveTimeout: 30000, // 30s
      sendTimeout: 30000, // 30s
    );
    final _dio = Dio(options);
    _dio.interceptors.add(ResponseInterceptor());
    final appAPI =
        AppApi(_dio, baseUrl: 'http://${serverIPController.text}:8080');
    try {
      final tableListString = await appAPI.getListTable();
      final tableList = (jsonDecode(tableListString) as List)
          .map((e) => TableModel.fromJson(e))
          .toList();
      if (tableList.isNotEmpty == true) {
        {
          sharePref.setString('server_ip', serverIPController.text);
          Get.delete<AppApi>();
          Get.put(appAPI);
        }
      } else {
        Get.bottomSheet(
          const CommonBottomSheet(
              title: 'Lỗi', description: 'Không thể kết nối đến server'),
        );
      }
    } catch (e) {
      Get.bottomSheet(
        const CommonBottomSheet(
            title: 'Lỗi', description: 'Không thể kết nối đến server'),
      );
    }
  }
}
