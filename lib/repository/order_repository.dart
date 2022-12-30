import 'package:coffee_order/database/models/order.dart';
import 'package:coffee_order/database/models/order_detail.dart';

abstract class OrderRepository {
  Future<int> createOrder(OrderModel order);
  Future<void> updateOrder(OrderModel order);
  Future<void> deleteOrder(OrderModel order);
  Future<List<OrderModel>> getOrder();
  Future<List<OrderModel>> getOrderByStatus(int status);
  Future<OrderModel?> getOrderByTableId(int tableId);
  Future<void> updateOrderDetail(OrderDetailModel orderDetailModel);
  Future<int> createOrderDetail(OrderDetailModel orderDetailModel);
  Future<List<OrderModel>> getOrderByDate(DateTime date);
  Future<List<OrderModel>> getOrderByMonth(DateTime date);
}
