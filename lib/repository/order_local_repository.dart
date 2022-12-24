import 'package:coffee_order/database/hive_database.dart';
import 'package:coffee_order/database/models/order.dart';
import 'package:coffee_order/database/models/order_detail.dart';
import 'package:coffee_order/repository/order_repository.dart';

class OrderLocalRepository extends OrderRepository {
  final HiveDatabase db;

  OrderLocalRepository(this.db);
  @override
  Future<int> createOrder(OrderModel order) async {
    final foundTable = db.tableBox.values
        .where((element) => element.id == order.table.id)
        .toList();
    if (foundTable.isEmpty) {
      throw ('Table not found');
    } else {
      foundTable.first.status = 1;
      foundTable.first.save();
    }
    for (var orderDetail in order.details) {
      final found = db.drinkBox.get(orderDetail.drink.id);
      if (found == null) {
        throw ('Drink not found');
      } else {
        orderDetail.drink = found;
      }
      db.orderDetailBox.add(orderDetail);
      orderDetail.id = orderDetail.key;
      orderDetail.save();
    }

    final key = await db.orderBox.add(order);
    order.id = order.key;
    order.save();
    return key;
  }

  @override
  void deleteOrder(OrderModel order) {
    final found = db.orderBox.get(order.id);
    if (found == null) {
      throw ('order not found');
    }
    db.orderBox.delete(found);
  }

  @override
  List<OrderModel> getOrder() {
    return db.orderBox.values.toList();
  }

  @override
  List<OrderModel> getOrderByStatus(int status) {
    return db.orderBox.values
        .where((element) => element.status == status)
        .toList();
  }

  @override
  void updateOrder(OrderModel order) {
    final foundTable = db.tableBox.values
        .where((element) => element.id == order.table.id)
        .toList();
    if (foundTable.isEmpty) {
      throw ('Table not found');
    } else {
      foundTable.first.status = 1;
      foundTable.first.save();
    }
    var found = db.orderBox.get(order.id);
    if (found == null) {
      throw ('order not found');
    }

    final needToRemoveDetail =
        found.details.where((element) => element.quantity < 1);
    found.details.removeWhere((element) => element.quantity < 1);
    if (found.details.isEmpty || order.status == 1) {
      foundTable.first.status = 0;
      foundTable.first.save();
    }
    if (needToRemoveDetail.isNotEmpty) {
      db.orderDetailBox.deleteAll(needToRemoveDetail);
    }

    found = found.merge(order: order);
    found.save();
  }

  @override
  OrderModel? getOrderByTableId(int tableId) {
    final orders = db.orderBox.values
        .where((element) => element.table.id == tableId && element.status == 0)
        .toList();
    if (orders.isNotEmpty) {
      return orders.first;
    }
    return null;
  }

  @override
  Future<int> createOrderDetail(OrderDetailModel orderDetailModel) {
    // TODO: implement createOrderDetail
    throw UnimplementedError();
  }

  @override
  void updateOrderDetail(OrderDetailModel orderDetailModel) {
    // TODO: implement updateOrderDetail
  }

  @override
  List<OrderModel> getOrderByDate(DateTime date) {
    return db.orderBox.values
        .where(
          (element) =>
              element.status == 1 &&
              element.createDate.day == date.day &&
              element.createDate.month == date.month &&
              element.createDate.year == date.year,
        )
        .toList();
  }

  @override
  List<OrderModel> getOrderByMonth(DateTime date) {
    return db.orderBox.values
        .where(
          (element) =>
              element.status == 1 &&
              element.createDate.month == date.month &&
              element.createDate.year == date.year,
        )
        .toList();
  }
}
