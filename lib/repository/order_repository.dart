import 'package:coffee_order/database/models/order.dart';
import 'package:coffee_order/database/models/order_detail.dart';

abstract class OrderRepository {
  Future<int> createOrder(OrderModel order);
  void updateOrder(OrderModel order);
  void deleteOrder(OrderModel order);
  List<OrderModel> getOrder();
  List<OrderModel> getOrderByStatus(int status);
  OrderModel? getOrderByTableId(int tableId);
  void updateOrderDetail(OrderDetailModel orderDetailModel);
  Future<int> createOrderDetail(OrderDetailModel orderDetailModel);
  List<OrderModel> getOrderByDate(DateTime date);
  List<OrderModel> getOrderByMonth(DateTime date);
}
