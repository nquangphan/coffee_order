import 'dart:convert';

import 'package:coffee_order/api/app_api.dart';
import 'package:coffee_order/database/models/order_detail.dart';
import 'package:coffee_order/database/models/order.dart';
import 'package:coffee_order/repository/order_repository.dart';
import 'package:get/get.dart';

class OrderServerRepository extends OrderRepository {
  @override
  Future<int> createOrder(OrderModel order) async {
    final appAPI = Get.find<AppApi>();
    final response = await appAPI.createOrder(order);
    return int.tryParse(response) ?? -1;
  }

  @override
  Future<int> createOrderDetail(OrderDetailModel orderDetailModel) {
    // TODO: implement createOrderDetail
    throw UnimplementedError();
  }

  @override
  Future<void> deleteOrder(OrderModel order) {
    // TODO: implement deleteOrder
    throw UnimplementedError();
  }

  @override
  Future<List<OrderModel>> getOrder() {
    // TODO: implement getOrder
    throw UnimplementedError();
  }

  @override
  Future<List<OrderModel>> getOrderByDate(DateTime date) async {
    final appAPI = Get.find<AppApi>();
    final orderListString = await appAPI
        .getOrderByTimeStamp(date.millisecondsSinceEpoch.toString());
    final orderList = (jsonDecode(orderListString) as List)
        .map((e) => OrderModel.fromJson(e))
        .toList();
    return orderList;
  }

  @override
  Future<List<OrderModel>> getOrderByMonth(DateTime date) async {
    final appAPI = Get.find<AppApi>();
    final orderListString =
        await appAPI.getOrderByMonth(date.millisecondsSinceEpoch.toString());
    final orderList = (jsonDecode(orderListString) as List)
        .map((e) => OrderModel.fromJson(e))
        .toList();
    return orderList;
  }

  @override
  Future<List<OrderModel>> getOrderByStatus(int status) async {
    final appAPI = Get.find<AppApi>();
    final orderListString = await appAPI.getOrderByStatus(status.toString());
    final orderList = (jsonDecode(orderListString) as List)
        .map((e) => OrderModel.fromJson(e))
        .toList();
    return orderList;
  }

  @override
  Future<OrderModel?> getOrderByTableId(int tableId) async {
    final appAPI = Get.find<AppApi>();
    try {
      final order = await appAPI.getOrderByTableID(tableId.toString());
      return OrderModel.fromJson(jsonDecode(order));
    } catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future<void> updateOrder(OrderModel order) {
    final appAPI = Get.find<AppApi>();
    return appAPI.updateOrder(order);
  }

  @override
  Future<void> updateOrderDetail(OrderDetailModel orderDetailModel) {
    // TODO: implement updateOrderDetail
    throw UnimplementedError();
  }
}
